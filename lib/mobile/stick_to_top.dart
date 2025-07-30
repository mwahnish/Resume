import 'package:flutter/material.dart';

class StickToTop extends StatefulWidget {
  final Widget child;

  final ScrollController scrollController;

  const StickToTop({super.key, required this.child, required this.scrollController});


  @override
  State<StickToTop> createState() => _StickToTopState();
}

class _StickToTopState extends State<StickToTop> with WidgetsBindingObserver {

  final GlobalKey _key = GlobalKey();
  bool stuck = false;
  double leftMargin = 0;

  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();
   
    widget.scrollController.addListener(_getWidgetPosition);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_getWidgetPosition);
    super.dispose();
  }

  void _getWidgetPosition() {
    if (_key.currentContext != null) {
      final RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
      final Offset position = renderBox.localToGlobal(Offset.zero);
      setState(() {
        stuck = position.dy <= 0;
        leftMargin = position.dx;
      });

      if (context.mounted){
        if (stuck && _overlayEntry == null) {
          _overlayEntry = OverlayEntry(
            builder: (context) => Container(
              child: Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: Container(
                  color: Theme.of(context).colorScheme.surface,
                  child: Padding(
                    padding: EdgeInsets.only(left: leftMargin),
                    child: widget.child,
                  ),
                ),
              ),
            ),
          );
          Overlay.of(context).insert(_overlayEntry!);
        } else if (!stuck && _overlayEntry != null) {
          _overlayEntry?.remove();
          _overlayEntry = null;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //  WidgetsBinding.instance.addPostFrameCallback((_) {   
    //   if (_key.currentContext != null){
    //     try{
    //       final RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
      
    //       var position = renderBox.localToGlobal(Offset.zero);
          
    //       print(position);
    //     }catch(e){
    //       // This is a workaround for the case where the widget is not yet laid out.
    //       // The error is thrown when trying to find the render object before the widget is laid out.
    //       // We can ignore this error, as we will get the position in the next frame.
    //     }
        
    //   }
    // });


    return Container(
      key: _key,
      child: widget.child,
    );
  }
}