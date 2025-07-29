import 'package:flutter/material.dart';

class FadeClip extends StatelessWidget{
  final Widget child;
  final Color fadeColor;

  const FadeClip({
    super.key,
    required this.child,
    this.fadeColor = Colors.white,
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
                stops: const <double>[0.0, 0.05, 0.95, 1.0],
              ).createShader(bounds);
          },
          child: child,
          blendMode: BlendMode.dstATop,
       ),
    );
  }


  
}