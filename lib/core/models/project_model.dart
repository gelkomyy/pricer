class ProjectModel {
  final int id;
  String status;
  String projectName;
  String clientName;
  num totalPrice;
  num totalHours;
  num pricePerHour;

  ProjectModel({
    required this.pricePerHour,
    required this.id,
    required this.status,
    required this.projectName,
    required this.clientName,
    required this.totalPrice,
    required this.totalHours,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'status': status,
      'projectName': projectName,
      'clientName': clientName,
      'totalPrice': totalPrice,
      'totalHours': totalHours,
      'pricePerHour': pricePerHour,
    };
  }
}
