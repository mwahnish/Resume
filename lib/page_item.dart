
import 'package:flutter/material.dart';

class PageItem extends StatelessWidget{
  String title;
  String content;
  double maxWidth;
  TextAlign textAlign;

  PageItem({super.key, required this.title, required this.content, this.maxWidth = 600, this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: RichText(
        textAlign: textAlign,
        text: TextSpan(
          children: [
            TextSpan(text: title, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
            TextSpan(text: ": ", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
            TextSpan(text: content, style: Theme.of(context).textTheme.bodyMedium),
          ]
        )
      ),
    );
  }
}