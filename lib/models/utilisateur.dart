class UtilisateurI {
  int iduser;
  String nom;
  String prenom;
  String username;
  String email;
  String password;
  String role;

  UtilisateurI(
      this.iduser,
      this.nom,
      this.prenom,
      this.username,
      this.email,
      this.password,
      this.role);

  factory UtilisateurI.fromJson(Map<String, dynamic> json) =>
  UtilisateurI(
   int.parse(json["iduser"]),
    json["nom"],
   json["prenom"],
    json["username"],
   json["email"],
    json["password"],
    json["role"],
 );

  Map<String, dynamic> toJson() =>{
    
"iduser":iduser.toString(),
  "nom":nom,
  "prenom":prenom,
  "username":username,
  "email":email,
  "password":password,
  "role":role,
  };
}