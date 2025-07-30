import 'package:flutter/material.dart';
import 'package:wahnish_resume/common/experience_widget.dart';
import 'package:wahnish_resume/common/project_widget.dart';
import 'package:wahnish_resume/common/skill_widget.dart';
import 'package:wahnish_resume/content/content.dart';
import 'package:wahnish_resume/desktop/timeline/section%20selection/animated_segment_row.dart';
import 'package:wahnish_resume/mobile/about.dart';

class MobileLayout extends StatefulWidget {
  final Content content;

  const MobileLayout({super.key, required this.content});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.content.name,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                spacing: 16,

                children: [
                  About(content: widget.content),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IntrinsicWidth(
                      child: AnimatedSegmentRow(
                        titles: ["Experience", "Projects", "Skills"],
                        selectedIndex: selectedIndex,
                        onSegmentSelected: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 32,
                      children: [
                        if (selectedIndex == 0) ...[
                          ...widget.content.experiences.map((e) => ExperienceWidget(experience: e)).toList(),
                        ] else if (selectedIndex == 1) ...[
                          ...widget.content.projects.map((p) => ProjectWidget(project: p)).toList(),
                        ] else if (selectedIndex == 2) ...[
                          ...widget.content.skills.map((s) => SkillWidget(skill: s)).toList(),
                        ]
                      ],
                    ),
                  ),
                  
                ]
              ),
            ),
          ),
        ),
      )
    );
  }
}