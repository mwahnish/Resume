import 'package:flutter/material.dart';
import 'package:wahnish_resume/content/content.dart';
import 'package:wahnish_resume/content/experience.dart';

class ExperienceWidget extends StatelessWidget {
  final Experience experience;

  ExperienceWidget({
    super.key,
    required this.experience,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(experience.companyName, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
        Text("${experience.jobTitle} - ${experience.duration}", style: Theme.of(context).textTheme.titleMedium),
        ...experience.descriptions.map((desc) => Text("$desc", style: Theme.of(context).textTheme.bodyMedium)),
      ],
    );
  }
}