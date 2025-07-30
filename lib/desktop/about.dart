

import 'package:flutter/material.dart';
import 'package:wahnish_resume/common/link_item.dart';
import 'package:wahnish_resume/common/page_item.dart';
import 'package:wahnish_resume/content/content.dart';
import 'package:wahnish_resume/content/link.dart';


class About extends StatelessWidget {
  final Content content;
  final double maxWidth;

  About({
    super.key,
    required this.content,
    this.maxWidth = 450,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 4,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 300,
              child: Image.asset(content.image)
            ),
          ),
          Text(content.name, style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.right,),
          //SizedBox(child: Text(tagline, textAlign: TextAlign.right,), width: maxWidth,),
          PageItem(title: "Location", content: content.location, textAlign: TextAlign.right),
          LinkItem(title: "Email", links: [Link(title: content.email, url: "mailto:${content.email}")], textAlign: TextAlign.right),
          PageItem(title: "Phone", content: content.phone, textAlign: TextAlign.right),
          PageItem(title: "About me", content: content.about, textAlign: TextAlign.right),

        ],
      ),
    );
  }
}
