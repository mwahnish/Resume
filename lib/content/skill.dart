class Skill {
  final String skillName;
  final String duration;
  final List<String> descriptions;

  const Skill({
    required this.skillName,
    required this.duration,
    this.descriptions = const [],
  });
}