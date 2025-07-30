import 'dart:ui';

import 'package:flutter/material.dart';

class Falloff extends StatefulWidget {
  final Widget child;
  final int fade;
  final double rightStopPosition;
  final Color fadeColor;

  const Falloff({
    super.key,
    required this.child,
    this.fade = 128,
    this.rightStopPosition = 1,
    this.fadeColor = Colors.white,
  });

  @override
  State<Falloff> createState() => _FalloffState();
}

class _FalloffState extends State<Falloff> with TickerProviderStateMixin {

  double targetRightStopPosition = 1;
  double currentRightStopPosition = 1;

  bool firstLoad = true;

  late AnimationController animationController = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );

  late CurvedAnimation animation = CurvedAnimation(
    parent: animationController,
    curve: Curves.easeInOut,
  );

  @override
  void initState() {
    targetRightStopPosition = widget.rightStopPosition;
    currentRightStopPosition = widget.rightStopPosition;
    
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Falloff oldWidget) {
    if (oldWidget.fade != widget.fade || oldWidget.rightStopPosition != widget.rightStopPosition) {
      
      targetRightStopPosition = widget.rightStopPosition;

      if (!firstLoad) {
        animationController.forward(from: 0).then((_) {
          currentRightStopPosition = targetRightStopPosition;
        });
      }
      // since initial values may be set after the first build for our use case, we want to avoid animating on the first load
      else {
        currentRightStopPosition = targetRightStopPosition;
      }
      firstLoad = false;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        var lerp = lerpDouble(currentRightStopPosition, targetRightStopPosition, animation.value)!;
        return ClipRRect(
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  widget.fadeColor,
                  widget.fadeColor,
                  widget.fadeColor.withAlpha(widget.fade),
                  widget.fadeColor.withAlpha(widget.fade),
                ],
                stops: <double>[
                  0,
                  lerp,
                  lerp + .01,
                  1
                ],
              ).createShader(bounds);
            },
            child: widget.child,
            blendMode: BlendMode.dstATop,
          ),
        );
      }
    );
  }
}