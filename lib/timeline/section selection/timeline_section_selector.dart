import 'package:flutter/material.dart';
import 'package:wahnish_resume/timeline/section%20selection/animated_segment_row.dart';
import 'package:wahnish_resume/timeline/section%20selection/selection_segment.dart';

class TimelineSectionSelector extends StatefulWidget {
  final int selectedSectionIndex;
  final List<String> titles;
  final void Function(String) onSectionSelected;

  const TimelineSectionSelector({
    super.key,
    required this.selectedSectionIndex,
    required this.titles,
    required this.onSectionSelected,
  });

  @override
  State<TimelineSectionSelector> createState() => _TimelineSectionSelectorState();
}

class _TimelineSectionSelectorState extends State<TimelineSectionSelector> with TickerProviderStateMixin{

  late AnimationController _slideController = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {

    return _slideRow(context);
  }

  Widget _slideRow(BuildContext context){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            AnimatedSegmentRow(
              titles: widget.titles, 
              selectedIndex: 0)
            // _drawTitles(context, widget.selectedSectionIndex),
            // FractionalTranslation(
            //   translation: const Offset(1, 0),
            //   child: _drawTitles(context, widget.selectedSectionIndex)
            // ),
          ],
        ),
      ],
    );
  }

}
