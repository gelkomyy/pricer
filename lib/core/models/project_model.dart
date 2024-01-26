class ProjectModel {
  final int id;
  final String status;
  final String projectName;
  final String clientName;
  final num totalPrice;
  final num totalHours;

  const ProjectModel(
      {required this.id,
      required this.status,
      required this.projectName,
      required this.clientName,
      required this.totalPrice,
      required this.totalHours});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'status': status,
      'projectName': projectName,
      'clientName': clientName,
      'totalPrice': totalPrice,
      'totalHours': totalHours,
    };
  }
}
