import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tampons/Core/DB/database.dart';
import 'package:tampons/Core/Models/tampon.dart';

class TamponsProvider extends ChangeNotifier {
  List<Tampon>? tampons;

  Future<void> getAllTampons() async {
    tampons = await AppDB.getAllTampons();
    notifyListeners();
  }
}
