import 'package:flutter/material.dart';
import 'package:wahnish_resume/link_item.dart';
import 'package:wahnish_resume/page_item.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ProjectWidget extends StatefulWidget{
  String name;
  String description;
  String roles;
  String keySkills;
  String? image;
  String? video;
  List<Link> links;

  ProjectWidget._({
    super.key,
    required this.name,
    required this.description,
    required this.roles,
    required this.keySkills,
    this.image,
    this.video,
    this.links = const [],
  });

  ProjectWidget.withImage({
    super.key,
    required this.name,
    required this.description,
    required this.roles,
    required this.keySkills,
    required this.image,
    this.links = const [],
  });

  ProjectWidget.withVideo({
    super.key,
    required this.name,
    required this.description,
    required this.roles,
    required this.keySkills,
    required this.video,
    this.links = const [],
  });

  ProjectWidget.withTextOnly({
    super.key,
    required this.name,
    required this.description,
    required this.roles,
    required this.keySkills,
    this.links = const [],
  });

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  final double maxWidth = 450;

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

    if (widget.video != null) {
      _controller!.loadVideoByUrl(mediaContentUrl: widget.video!);
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
        if (widget.image != null)
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(widget.image!),
          ),
        if (widget.video != null && _controller != null)
          SizedBox(
            width: maxWidth,
            child: YoutubePlayer(
              controller: _controller!,
            ),
          ),
        
        Text(widget.name, style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
        Text(widget.description),
        if (widget.links.isNotEmpty)
          LinkItem(title: "Release", links: widget.links),
        PageItem(title: "Roles:", content: widget.roles, maxWidth: maxWidth),
        PageItem(title: "Key Skills:", content: widget.keySkills, maxWidth: maxWidth),
      ],
    );
  }
}