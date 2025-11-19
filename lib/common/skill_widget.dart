import 'package:flutter/material.dart';
import 'package:wahnish_resume/content/skill.dart';

class SkillWidget extends StatelessWidget{
  final Skill skill;

  const SkillWidget({
    super.key,
    required this.skill,
  });

  
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        SelectableText(skill.skillName, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
        SelectableText(skill.duration, style: Theme.of(context).textTheme.titleMedium),
        ...skill.descriptions.map((desc) => SelectableText("$desc", style: Theme.of(context).textTheme.bodyMedium)),
      ],
    );
  }

}