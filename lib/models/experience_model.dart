class Experience {
  final String company;
  final String role;
  final String period;
  final List<String> description;
  final String? type; // Full-time / Part-time

  const Experience({
    required this.company,
    required this.role,
    required this.period,
    required this.description,
    this.type,
  });
}
