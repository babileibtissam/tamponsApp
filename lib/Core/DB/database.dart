import 'dart:developer';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:tampons/Core/Models/tampon.dart';

class AppDB {
  static late final Database database;

  static openDB() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'tampons.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tampons(id INTEGER PRIMARY KEY,title TEXT, date TEXT,forme TEXT,longueur REAL,largeur REAL,diametre REAL,granddiametre REAL,petitdiametre REAL,contenu TEXT,image TEXT,hasLogo TEXT,logo TEXT,logoAlign TEXT)',
        );
      },
      version: 1,
    );
  }

  static getAllTampons() async {
    List<Tampon> tampons = [];
    List<Map> list = await database.rawQuery('SELECT * FROM tampons');
    list.forEach((e) {
      tampons.add(Tampon.fromMap(e));
    });
    return tampons;
  }

  static insertTampon(Tampon tampon) async {
    await database.transaction((txn) async {
      int id = await txn.rawInsert(
          'INSERT INTO tampons(title, date, forme,longueur,largeur,diametre,contenu,hasLogo,logo,logoAlign) VALUES(\'${tampon.title}\', \'${DateTime.now().toIso8601String().split('T')[0]}\', \'${tampon.forme}\',${tampon.longueur},${tampon.largeur},${tampon.diametre},\'${tampon.contenu}\',\'${tampon.hasLogo}\',\'${tampon.logo}\',\'${tampon.logoAlign}\')');
      return id;
    });
  }

  static updateTampon(Tampon tampon, int id) async {
    int count = await database.rawUpdate(
        'UPDATE tampons SET title = ?, date = ?, forme = ?, longueur = ?, largeur = ?,diametre = ?, contenu = ?, hasLogo = ?,logo = ?,logoAlign = ? WHERE id = ?',
        [
          tampon.title,
          DateTime.now().toIso8601String().split('T')[0],
          tampon.forme,
          tampon.longueur,
          tampon.largeur,
          tampon.diametre,
          tampon.contenu,
          tampon.hasLogo,
          tampon.logo,
          tampon.logoAlign,
          id
        ]);
    return count;
  }

  static deleteTampon(String id) async {
    int count =
        await database.rawDelete('DELETE FROM tampons WHERE id = ?', [id]);
    return count;
  }

// Delete the database
  dynamic deleteDatabase(dynamic path) async {
    return await deleteDatabase(path);
  }
}
