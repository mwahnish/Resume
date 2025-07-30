class Experience {
  final String jobTitle;
  final String companyName;
  final String duration;
  final List<String> descriptions;

  const Experience({
    required this.jobTitle,
    required this.companyName,
    required this.duration,
    this.descriptions = const [],
  });
}