
import 'package:wahnish_resume/content/link.dart';

class Project {
  final String name;
  final String description;
  final String roles;
  final String keySkills;
  final String? image;
  final String? video;
  final List<Link> links;

  const Project.withImage({
    required this.name,
    required this.description,
    required this.roles,
    required this.keySkills,
    required this.image,
    this.links = const [],
  }): video = null;

  const Project.withVideo({
    required this.name,
    required this.description,
    required this.roles,
    required this.keySkills,
    required this.video,
    this.links = const [],
  }): image = null;

  const Project.withTextOnly({
    required this.name,
    required this.description,
    required this.roles,
    required this.keySkills,
    this.links = const [],
  }): image = null, video = null;
}