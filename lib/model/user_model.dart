import 'package:appscrip/model/adress_model.dart';
import 'package:appscrip/model/company_model.dart';

class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  String? phone;
  String? website;
  Address? address;
  Company? company;

  UserModel({
    required this.email,
    required this.name,
    this.id,
    this.address,
    this.phone,
    this.username,
    this.website,
    this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      username: json["username"],
      email: json["email"],
      phone: json["phone"],
      website: json["website"],
      address: json["address"] != null
          ? Address.fromJson(
              json["address"],
            )
          : null,
      company: json["company"] != null
          ? Company.fromJson(
              json["company"],
            )
          : null,
    );
  }
}
