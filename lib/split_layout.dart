import 'package:flutter/material.dart';

class SplitLayout extends StatelessWidget {
  Widget leftChild;
  Widget rightChild;

  SplitLayout({super.key, required this.leftChild, required this.rightChild});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 64),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: leftChild,
            )),
            Expanded(child: rightChild),
          ],
        ),
      )
    );
  }
}