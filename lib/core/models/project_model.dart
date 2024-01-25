class ProjectModel {
  final String status;
  final String projectName;
  final String clientName;
  final num totalPrice;
  final num totalHours;

  const ProjectModel(
      {required this.status,
      required this.projectName,
      required this.clientName,
      required this.totalPrice,
      required this.totalHours});
}
