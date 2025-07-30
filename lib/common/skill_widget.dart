import 'package:flutter/material.dart';
import 'package:wahnish_resume/content/skill.dart';

class SkillWidget extends StatelessWidget{
  Skill skill;

  SkillWidget({
    super.key,
    required this.skill,
  });

  
  @override
  Widget build(BuildContext context) {

    final double maxWidth = 450;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        Text(skill.skillName, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
        Text(skill.duration, style: Theme.of(context).textTheme.titleMedium),
        ...skill.descriptions.map((desc) => Text("$desc", style: Theme.of(context).textTheme.bodyMedium)),
      ],
    );
  }

}