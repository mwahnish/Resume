import 'package:flutter/material.dart';

class LayoutBreaker extends StatelessWidget {
  final Widget large;
  final Widget small;
  final double breakpoint;


  const LayoutBreaker({
    super.key,
    required this.large,
    required this.small,
    this.breakpoint = 900,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > breakpoint) {
          return large;
        } else {
          return small;
        }
      },
    );
  }
}
