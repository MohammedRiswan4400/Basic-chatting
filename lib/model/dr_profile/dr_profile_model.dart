class ModelDoctor {
  final String uid;
  final String name;
  final String experiance;
  final String education;
  final String professional;
  final String speciality;
  final DateTime lasetAcctive;
  final bool isOnline;
  String typeOfUser = 'Doctor';

  ModelDoctor({
    required this.uid,
    required this.name,
    required this.experiance,
    required this.education,
    required this.professional,
    required this.speciality,
    required this.lasetAcctive,
    this.isOnline = false,
  });

  Map<String, dynamic> toJson() => {
        "TypeOfUser": typeOfUser,
        "DrId": uid,
        "Name": name,
        "Experiance": experiance,
        "Education": education,
        "Professional": professional,
        "Speciality": speciality,
        "lasetActive": lasetAcctive,
        "isOnline": isOnline,
      };

  static ModelDoctor fromJson(Map<String, dynamic> json) => ModelDoctor(
        uid: json["DrId"],
        name: json["Name"],
        experiance: json["Experiance"],
        professional: json["Professional"],
        education: json["Education"],
        isOnline: json["isOnline"] ?? false,
        speciality: json["Speciality"],
        lasetAcctive: json["lasetActive"].toDate(),
      );
}
