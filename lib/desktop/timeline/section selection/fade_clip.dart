import 'package:flutter/material.dart';

class FadeClip extends StatelessWidget{
  final Widget child;
  final Color fadeColor;
  final double leftStopPosition;
  final double rightStopPosition;
  final double fadeWidth;

  const FadeClip({
    super.key,
    required this.child,
    this.fadeColor = Colors.white,
    this.leftStopPosition = 0,
    this.rightStopPosition = 1,
    this.fadeWidth = .05,
  });
  
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: ShaderMask(
          shaderCallback: (Rect bounds) {
              return LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  fadeColor.withAlpha(0),
                  fadeColor,
                  fadeColor,
                  fadeColor.withAlpha(0),
                ],
                stops: <double>[leftStopPosition, leftStopPosition+fadeWidth, rightStopPosition, rightStopPosition-fadeWidth],
              ).createShader(bounds);
          },
          child: child,
          blendMode: BlendMode.dstATop,
       ),
    );
  }


  
}