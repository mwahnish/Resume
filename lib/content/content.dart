import 'package:wahnish_resume/content/experience.dart';
import 'package:wahnish_resume/content/project.dart';
import 'package:wahnish_resume/content/skill.dart';

class Content{
  final String name;
  final String location;
  final String email;
  final String phone;
  final String about;
  final String image;

  final List<Experience> experiences;
  final List<Skill> skills;
  final List<Project> projects;

  const Content({
    required this.name,
    required this.location,
    required this.email,
    required this.phone,
    required this.about,
    required this.image,
    this.experiences = const [],
    this.skills = const [],
    this.projects = const [],
  });
}