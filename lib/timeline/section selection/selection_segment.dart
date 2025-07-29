
import 'dart:ui';

import 'package:flutter/material.dart';

class SelectionSegment extends StatefulWidget {
  final String title;
  final void Function() onTap;
  void Function(double width) onReceivedWidth;
  void Function(Offset position) onReceivedPosition;
  Color selectedColor;
  Color unselectedColor;
  Offset startScreenPosition;
  double fadeDistance;

  SelectionSegment({
    super.key, 
    required this.title,
    required this.onTap,
    required this.onReceivedWidth,
    required this.onReceivedPosition,
    required this.selectedColor,
    required this.unselectedColor,
    required this.startScreenPosition,
    required this.fadeDistance,
  });

  @override
  State<SelectionSegment> createState() => SelectionSegmentState();
}

class SelectionSegmentState extends State<SelectionSegment> {
  final GlobalKey _key = GlobalKey();
  double distanceFromLeft = 0.0;

  

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_key.currentContext != null) {
        final RenderBox renderBox = _key.currentContext!.findRenderObject() as RenderBox;
        var size = renderBox.size;
        var position = renderBox.localToGlobal(Offset.zero);
        widget.onReceivedWidth(size.width);
        widget.onReceivedPosition(position);

        var newDistanceFromLeft = position.dx - widget.startScreenPosition.dx;
        if (newDistanceFromLeft != distanceFromLeft) {
          setState(() {
            distanceFromLeft = newDistanceFromLeft;
          });
        }
      }
    });

    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        key: _key,
        padding: const EdgeInsets.only(right: 8.0),
        child: Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: Color.lerp(widget.selectedColor, widget.unselectedColor, distanceFromLeft / widget.fadeDistance),
          ),
        ),
      ),
    );
  }
}