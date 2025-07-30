import 'package:flutter/material.dart';
import 'package:wahnish_resume/common/link_item.dart';
import 'package:wahnish_resume/common/page_item.dart';
import 'package:wahnish_resume/content/project.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ProjectWidget extends StatefulWidget{
  Project project;

  ProjectWidget({
    super.key,
    required this.project,
  });

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {

  YoutubePlayerController? _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      params: YoutubePlayerParams(
        pointerEvents: PointerEvents.none,
        mute: true,
        showControls: false,
        showFullscreenButton: false,
        showVideoAnnotations: false,
        loop: true,
      ),
    );

    if (widget.project.video != null) {
      _controller!.loadVideoByUrl(mediaContentUrl: widget.project.video!);
    }
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        if (widget.project.image != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(widget.project.image!),
          ),
        if (widget.project.video != null && _controller != null)
          ConstrainedBox(
            constraints: const BoxConstraints( maxWidth: 500),
            child: YoutubePlayer(
              controller: _controller!,
            ),
          ),
    
        Text(widget.project.name, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
        Text(widget.project.description),
        if (widget.project.links.isNotEmpty)
          LinkItem(title: "Release", links: widget.project.links),
        PageItem(title: "Roles:", content: widget.project.roles),
        PageItem(title: "Key Skills:", content: widget.project.keySkills),
      ],
    );
  }
}