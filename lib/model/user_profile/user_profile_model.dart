class ModelUser {
  final String uID;
  final String name;
  final String petName;
  final String petType;
  String typeOfUser = 'User';
  ModelUser(
      // this.typeOfUser,
      {
    required this.uID,
    required this.name,
    required this.petName,
    required this.petType,
  });

  Map<String, dynamic> toJson() => {
        "TypeOfUser": typeOfUser,
        "UserId": uID,
        "Name": name,
        "PetName": petName,
        "PetType": petType,
      };

  static ModelUser fromJson(Map<String, dynamic> json) => ModelUser(
        // typeOfUser : json["UserId"],
        uID: json["UserId"],
        name: json["Name"],
        petName: json["PetName"],
        petType: json["PetType"],
      );
}
