import 'dart:developer';

class Tampon {
  int? id;
  late String title;
  late String date;
  late String forme;
  late double longueur;
  late double largeur;
  late double diametre;
  late String contenu;
  String? image;
  late String hasLogo;
  late String logo;
  late String logoAlign;

  Tampon({
    this.id = 0,
    required this.title,
    required this.date,
    required this.forme,
    required this.longueur,
    required this.largeur,
    required this.diametre,
    required this.contenu,
    required this.image,
    required this.hasLogo,
    required this.logo,
    required this.logoAlign,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'date': date,
      'forme': forme,
      'longueur': longueur,
      'largeur': largeur,
      'diametre': diametre,
      'contenu': contenu,
      'image': image,
      'hasLogo': hasLogo,
      'logo': logo,
      'logoAlign': logoAlign,
    };
  }

  Tampon.empty() {
    // id = '';
    title = '';
    date = '';
    forme = '';
    longueur = 0;
    largeur = 0;
    diametre = 0;
    contenu = '';
    image = '';
    hasLogo = '';
    logo = '';
    logoAlign = '';
  }
  Tampon.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    title = map['title'];
    date = map['date'];
    forme = map['forme'];
    longueur = map['longueur'];
    largeur = map['largeur'];
    diametre = map['diametre'];
    contenu = map['contenu'];
    image = map['image'];
    hasLogo = map['hasLogo'];
    logo = map['logo'];
    logoAlign = map['logoAlign'];
  }
}
