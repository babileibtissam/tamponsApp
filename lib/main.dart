import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tampons/Core/DB/database.dart';
import 'package:tampons/Core/Providers/tampons_provider.dart';
import 'UI/Views/tampons_view.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  await AppDB.openDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // Provider<TamponsProvider>(create: (_) => TamponsProvider()),
          ChangeNotifierProvider(create: (context) => TamponsProvider()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FirstScreen(),
        ));
  }
}
