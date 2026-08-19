class PlanProgressEntity {
  final int totalPages;
  final int completdPages;
  final int remainingPages;
  final int percentage;

  PlanProgressEntity( {
    required this.totalPages,
    required this.completdPages,
    required this.remainingPages,
    required this.percentage
  });
}