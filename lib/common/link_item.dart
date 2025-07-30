
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wahnish_resume/content/link.dart';

class LinkItem extends StatelessWidget{
  String title;
  TextAlign textAlign;
  List<Link> links;

  LinkItem({super.key, required this.title, this.textAlign = TextAlign.left, this.links = const []});

  @override
  Widget build(BuildContext context) {

    List<TextSpan> linkSpans = [];
    for (var link in links) {
      linkSpans.add(TextSpan(
        text: link.title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Theme.of(context).colorScheme.primary,
          decoration: TextDecoration.underline,
        ),
        recognizer: TapGestureRecognizer()..onTap = () {
          launchUrl(Uri.parse(link.url));
        },
      ));
      linkSpans.add(TextSpan(text: ', ')); // Add space and a comma after each link
    }

    return RichText(
      textAlign: textAlign,
      text: TextSpan(
        children: [
          TextSpan(text: title, style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
          TextSpan(text: ": ", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold)),
          ...linkSpans
        ]
      )
    );
  }
}
