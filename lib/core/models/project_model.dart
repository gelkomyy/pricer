class ProjectModel {
  final int id;
  String status;
  String projectName;
  String clientName;
  num totalPrice;
  num pricePerHour;
  num hours;
  num minutes;

  ProjectModel({
    required this.pricePerHour,
    required this.id,
    required this.status,
    required this.projectName,
    required this.clientName,
    required this.totalPrice,
    required this.hours,
    required this.minutes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'status': status,
      'projectName': projectName,
      'clientName': clientName,
      'totalPrice': totalPrice,
      'pricePerHour': pricePerHour,
      'hours': hours,
      'minutes': minutes,
    };
  }
}
