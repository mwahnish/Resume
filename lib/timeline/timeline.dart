import 'package:flutter/material.dart';
import 'package:wahnish_resume/timeline/section%20selection/timeline_section_selector.dart';

class Timeline extends StatefulWidget {
  List<TimelineSection> sections;

  Timeline({super.key, required this.sections});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  int selectedSectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 48),
          child: TimelineSectionSelector(
            selectedSectionIndex: selectedSectionIndex,
             titles: widget.sections.map((section) => section.title).toList(), 
             onSectionSelected: (index)=>{}),
        ),
        Expanded(
          child: Stack(
            children: [
              Positioned(
                left: 2,
                top: 0,
                bottom: 0,
                child: VerticalDivider(
                color: Theme.of(context).colorScheme.primaryContainer,
                thickness: 4,
              )),
              SingleChildScrollView(
                child: Column(
                  spacing: 32,
                  children: [
                    ...widget.sections[selectedSectionIndex].items.map((timelineItem) => _TimelineItem(child: timelineItem)).toList(),
                    SizedBox(height: 64), // Add some space at the bottom
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  
  }
}

class TimelineSection{
  String title;
  List<Widget> items;

  TimelineSection({required this.title, required this.items});
}

class _TimelineItem extends StatelessWidget{
  final Widget child;

  _TimelineItem({required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 46,
      children: [
        PhysicalModel(
          color: Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle,
          elevation: 4,
          child: SizedBox(
            width: 20,
            height: 20,
          ),
        ),
        child
      ],
    );
  
  }

  
}
