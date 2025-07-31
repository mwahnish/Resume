

import 'package:flutter/material.dart';
import 'package:wahnish_resume/common/layout_breaker.dart';
import 'package:wahnish_resume/common/link_item.dart';
import 'package:wahnish_resume/common/page_item.dart';
import 'package:wahnish_resume/content/content.dart';
import 'package:wahnish_resume/content/link.dart';

class About extends StatelessWidget{
  final Content content;

  About({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBreaker(
      large: _drawLarge(context), 
      small: _drawSmall(context),
      breakpoint: 330,
    );
  }

  Widget _drawLarge(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            spacing: 8,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 150,
                  child: Image.asset(content.image)
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(content.name, style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                  PageItem(title: "Location", content: content.location, textAlign: TextAlign.left),
                  LinkItem(title: "Email", links: [Link(title: content.email, url: "mailto:${content.email}")], textAlign: TextAlign.left),
                  PageItem(title: "Phone", content: content.phone, textAlign: TextAlign.left),
                ],
              )
              
            ],
          ),
          
          PageItem(title: "About me", content: content.about, textAlign: TextAlign.left),
        ],
      ),
    );
  }

  Widget _drawSmall(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              height: 300,
              child: Image.asset(content.image)
            ),
          ),
          Text(content.name, style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
          PageItem(title: "Location", content: content.location, textAlign: TextAlign.left),
          LinkItem(title: "Email", links: [Link(title: content.email, url: "mailto:${content.email}")], textAlign: TextAlign.left),
          PageItem(title: "Phone", content: content.phone, textAlign: TextAlign.left),
          
          PageItem(title: "About me", content: content.about, textAlign: TextAlign.left),
        ],
      ),
    );
  }
}