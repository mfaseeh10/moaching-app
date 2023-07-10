 part of'model.dart';


class UserModel
{
  final String? email;
  final String? conformEmail;
  final String? firstName;
  final String? lastName;
  final String? password;
  final String? conformPassword;

  UserModel({this.email , this.password , this.lastName ,this.firstName , this.conformEmail , this.conformPassword});



  factory UserModel.loginFromJson(Map<String, dynamic> json)=> UserModel(
      email: json["email"].toString(),
      password: json["password"].toString(),
  );


  factory UserModel.registerFromJson(Map<String, dynamic> json)=> UserModel(
    email: json["Email"].toString(),
    password: json["Password"].toString(),
    firstName: json["Firstname"].toString(),
    lastName: json["Lastname"].toString(),
  );

  Map<String, dynamic> toJson() =>
      {
        "Firstname":firstName,
        "Lastname":lastName,
        "Email":email,
        "Password":password
      };

}