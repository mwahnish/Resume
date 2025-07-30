import 'package:flutter/material.dart';

class SplitLayout extends StatelessWidget {
  Widget leftChild;
  Widget rightChild;

  SplitLayout({super.key, required this.leftChild, required this.rightChild});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 64, left: 32, right:  32, bottom: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 34),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 450),
                    child: leftChild
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topLeft,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 450),
                    child: rightChild
                  ),
              ),
            )
          ],
        ),
      )
    );
  }
}