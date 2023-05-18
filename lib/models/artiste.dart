
class Artiste {
  int? id;
  String? nom;
  String? prenom;

  Artiste({this.id, this.nom, this.prenom});

  Artiste.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id']);
    nom = json['nom'];
    prenom = json['prenom'];
  }

 
  Map <String,dynamic> toJson(){
   return {
    "id":id.toString(),
           "nom":nom,
          "prenom":prenom,
        
 
};
}
}