
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wahnish_resume/timeline/section%20selection/fade_clip.dart';
import 'package:wahnish_resume/timeline/section%20selection/selection_segment.dart';

const int maxInt = -1 >>> 1;

class AnimatedSegmentRow extends StatefulWidget{
  final List<String> titles;

  /// The row will slide to this index
  final int selectedIndex;

  AnimatedSegmentRow({
    super.key,
    required this.titles,
    required this.selectedIndex,
  });

  @override
  State<AnimatedSegmentRow> createState() => AnimatedSegmentRowState();
}

class AnimatedSegmentRowState extends State<AnimatedSegmentRow> with TickerProviderStateMixin {
  List<double> segmentWidths = [];
  
  int selectedIndex = 0;

  List<String> titleDisplayOrder = [];
  Offset startScreenPosition = Offset.zero;

  late AnimationController slideAnimationController = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  );

  late CurvedAnimation slideAnimation = CurvedAnimation(
    parent: slideAnimationController,
    curve: Curves.easeInOut,
  );

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
    print("Selected title: $selectedTitle");
    print("It's index: $selectedIndex");

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

    Color selectedColor = Theme.of(context).colorScheme.onSurface;
    Color unselectedColor = Theme.of(context).colorScheme.primary.withAlpha( 0);

    var fadeDistance = getRowWidth(); 



    // making interactable segments
    List<SelectionSegment> segments = [];
    for (int i = 0; i < titleDisplayOrder.length; i++) {
      var onReceivedWidthIndex = i; // caching the index for later
      segments.add(
        SelectionSegment(
          key: ValueKey(Random().nextInt(maxInt)), // Using a random key to force rebuilds when the list changes. This will ensure the color changes smoothly
          title: titleDisplayOrder[i],
          selectedColor: selectedColor,
          unselectedColor: unselectedColor,
          fadeDistance: fadeDistance,
          onReceivedPosition: (position) {
            if (i == 0 && startScreenPosition != position) {
              setState(() {
                startScreenPosition = position;
              });
            }
          },
          startScreenPosition: startScreenPosition,
          onTap: () {
            setState(() {
              selectedIndex = i;
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
          selectedColor: selectedColor,
          fadeDistance: fadeDistance,
          unselectedColor: unselectedColor,
          startScreenPosition: startScreenPosition,
          onReceivedPosition: (position) {
            
          },
          onTap: () {
            
          },
          onReceivedWidth: (width) {
            
          },
        )
      );
    }

    

    return FadeClip(
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
    );
  }
}
