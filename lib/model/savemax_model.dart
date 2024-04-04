part 'savemax_model.g.dart';

class SaveMaxModel {
  int id;
  String name;
  Employer employee;

  SaveMaxModel({required this.id, required this.name, required this.employee});

  factory SaveMaxModel.fromJson(Map<String, dynamic> json) {
    return SaveMaxModel(
      id: json['id'],
      name: json['name'],
      employee: Employer.fromJson(json['employee']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'employee': employee.toJson(),
    };
  }
}

class Employer {

  int employerId;
  String employerName;

  Employer({required this.employerId, required this.employerName});

  factory Employer.fromJson(Map<String, dynamic> json) {
    return Employer(
      employerId: json['employerId'],
      employerName: json['employerName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'employerId': employerId,
      'employerName': employerName,
    };
  }
}
