class User {
  int iduser;
  String nom;
  String prenom;
  String username;
  String email;
  String password;
  String role;
  //then those value usign this constructor 
 User(
  this.iduser,
  this.nom,
  this.prenom,
  this.username,
  this.email,
  this.password,
  this.role,
 );

 factory User.fromJson(Map <String, dynamic> json) 
 => User(
  int.parse(json["iduser"]),
  json["nom"],
  json["prenom"],
  json["username"],
  json["email"],
  json["password"],
  json["role"],
 );

//  factory User.fromJson(Map<String, dynamic> json)
//   :iduser=json["iduser"],
//   nom=json["nom"],
//   prenom=json["prenom"],
//   username=json["username"],
//   email=json["email"],
//   password=json["password"],
//   role=json["iduser"];


 Map <String,dynamic> toJson() =>
 {
  "iduser":iduser.toString(),
  "nom":nom,
  "prenom":prenom,
  "username":username,
  "email":email,
  "password":password,
  "role":role,
 };
}