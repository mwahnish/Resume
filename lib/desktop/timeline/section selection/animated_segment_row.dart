
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wahnish_resume/desktop/timeline/section%20selection/fade_clip.dart';
import 'package:wahnish_resume/desktop/timeline/section%20selection/falloff.dart';
import 'package:wahnish_resume/desktop/timeline/section%20selection/selection_segment.dart';

const int maxInt = -1 >>> 1;

class AnimatedSegmentRow extends StatefulWidget{
  final List<String> titles;

  /// The row will slide to this index
  final int selectedIndex;

  final void Function(int index)? onSegmentSelected;

  AnimatedSegmentRow({
    super.key,
    required this.titles,
    required this.selectedIndex,
    this.onSegmentSelected,
  });

  @override
  State<AnimatedSegmentRow> createState() => AnimatedSegmentRowState();
}

class AnimatedSegmentRowState extends State<AnimatedSegmentRow> with TickerProviderStateMixin {
  List<double> segmentWidths = [];
  
  int selectedIndex = 0;

  List<String> titleDisplayOrder = [];

  late AnimationController slideAnimationController = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );

  late CurvedAnimation slideAnimation = CurvedAnimation(
    parent: slideAnimationController,
    curve: Curves.easeInOut,
  );

  double? firstItemWidth;

  @override
  void initState() {
    super.initState();
    segmentWidths = List.filled(widget.titles.length, 0.0);
    titleDisplayOrder = List.from(widget.titles);
    _makeSelectedWidgetFirst();
  }

  void _makeSelectedWidgetFirst(){
    if (selectedIndex == 0) return;

    var selectedTitle = titleDisplayOrder[selectedIndex];

    while (titleDisplayOrder[0] != selectedTitle) {
      var removed = titleDisplayOrder.removeAt(0);
      titleDisplayOrder.add(removed);
    }
  }

  double getRowWidth() {
    double totalWidth = 0.0;
    for (var width in segmentWidths) {
      totalWidth += width;
    }
    return totalWidth;
  }


  @override
  Widget build(BuildContext context) {

    var targetSlidePosition = 0.0;

    for (int i = 0; i < selectedIndex; i++) {
      targetSlidePosition -= segmentWidths[i];
    }


    var rowWidth = getRowWidth(); 
    if (rowWidth == 0){
      // then we haven't received the widths yet. Going to give it a default value just so we don't divide by zero later
      rowWidth = 1.0;
    }



    // making interactable segments
    List<SelectionSegment> segments = [];
    for (int i = 0; i < titleDisplayOrder.length; i++) {
      var onReceivedWidthIndex = i; // caching the index for later
      segments.add(
        SelectionSegment(
          key: ValueKey(Random().nextInt(maxInt)), // Using a random key to force rebuilds when the list changes. This will ensure the color changes smoothly
          title: titleDisplayOrder[i],
         
          onTap: () {
            widget.onSegmentSelected?.call(widget.titles.indexOf(titleDisplayOrder[i]));
            setState(() {
              selectedIndex = i;
              firstItemWidth = segmentWidths[selectedIndex];
              slideAnimationController.forward(from: 0.0).then(
                (_) {
                  setState(() {
                    _makeSelectedWidgetFirst();
                    selectedIndex = 0;
                  });
                },
              );
            });
          },
          onReceivedWidth: (width) {

            if (firstItemWidth == null) {
              setState(() {
                firstItemWidth = width;
              });
            }

            if (segmentWidths[onReceivedWidthIndex] != width) {
              // Only update the width if it hasn't been set yet
              setState(() {
                segmentWidths[onReceivedWidthIndex] = width;
              });
            }
          },
        )
      );
    }

    // making dummy segments for the sliding animation
    List<SelectionSegment> dummySegments = [];
    for (int i = 0; i < titleDisplayOrder.length; i++) {
      var onReceivedWidthIndex = i; // caching the index for later
      dummySegments.add(
        SelectionSegment(
          key: ValueKey(Random().nextInt(maxInt)), // Using a random key to force rebuilds when the list changes. This will ensure the color changes smoothly
          title: titleDisplayOrder[i],
          
        )
      );
    }

    

    return Falloff(
      rightStopPosition: (firstItemWidth != null ? firstItemWidth! : 0) / rowWidth,
      fadeColor: Theme.of(context).colorScheme.surface,
      child: FadeClip(
        fadeColor: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 2),
          child: AnimatedBuilder(
            animation: slideAnimationController,
            builder: (context, _) {
              return Transform.translate(
                offset: Offset(targetSlidePosition * slideAnimation.value, 0),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        ...segments,
                      ],
                    ),
                    FractionalTranslation(
                      translation: Offset(1, 0),
                      child: Row(
                        children: [
                          ...dummySegments,
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
