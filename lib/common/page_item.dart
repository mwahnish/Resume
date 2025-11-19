
import 'package:flutter/material.dart';

class PageItem extends StatelessWidget{
  final String title;
  final String content;
  final TextAlign textAlign;

  const PageItem({super.key, required this.title, required this.content, this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {

    return SelectableText.rich(
      TextSpan(
        children: [
          TextSpan(text: title, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
          TextSpan(text: ": ", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
          TextSpan(text: content, style: Theme.of(context).textTheme.bodyMedium),
        ]
      ),

      textAlign: textAlign,
    );
  }
}