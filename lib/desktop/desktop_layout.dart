
import 'package:flutter/material.dart';
import 'package:wahnish_resume/common/experience_widget.dart';
import 'package:wahnish_resume/common/project_widget.dart';
import 'package:wahnish_resume/common/skill_widget.dart';
import 'package:wahnish_resume/content/content.dart';
import 'package:wahnish_resume/desktop/about.dart';
import 'package:wahnish_resume/desktop/split_layout.dart';
import 'package:wahnish_resume/desktop/timeline/timeline.dart';

class DesktopLayout extends StatelessWidget{
  Content content;

  DesktopLayout({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: content.name,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      home: SplitLayout(
        leftChild: About(
          content: content,
        ),
        rightChild: Timeline(
          sections: [
            TimelineSection(
              title: "Portfolio", 
              items: content.projects.map((project) => ProjectWidget(project: project)).toList()
            ),
            TimelineSection(
              title: "Experience", 
              items: content.experiences.map((exp) => ExperienceWidget(experience: exp)).toList()
            ),
            TimelineSection(
              title: "Skills", 
              items: content.skills.map((skill) => SkillWidget(skill: skill)).toList()
            )
          ]
        )
      )
    );
  }

}