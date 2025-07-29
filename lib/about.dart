

import 'package:flutter/material.dart';
import 'package:wahnish_resume/page_item.dart';


class About extends StatelessWidget {
  String name;
  String tagline;
  String image;
  String location;
  String email;
  String phone;
  String website;
  String about;
  final double maxWidth = 450;

  About({
    super.key,
    required this.name,
    required this.tagline,
    required this.image,
    required this.location,
    required this.email,
    required this.phone,
    required this.website,
    required this.about,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      spacing: 4,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            height: 300,
            child: Image.asset(image)
          ),
        ),
        Text(name, style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold), textAlign: TextAlign.right,),
        //SizedBox(child: Text(tagline, textAlign: TextAlign.right,), width: maxWidth,),
        PageItem(title: "Location", content: location, maxWidth: maxWidth, textAlign: TextAlign.right),
        PageItem(title: "Email", content: email, maxWidth: maxWidth, textAlign: TextAlign.right),
        PageItem(title: "Phone", content: phone, maxWidth: maxWidth, textAlign: TextAlign.right),
        PageItem(title: "Website", content: website, maxWidth: maxWidth, textAlign: TextAlign.right),
        PageItem(title: "About me", content: about, maxWidth: maxWidth, textAlign: TextAlign.right),

      ],
    );
  }
}
