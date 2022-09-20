import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:tampons/Core/Models/tampon.dart';
import 'package:pdf/widgets.dart' as pw;

Future<File?> pickFile(BuildContext context) async {
  try {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      return File(pickedImage.path);
    } else {
      showSnackBar(context, 'Vous n\'avez choisi aucune image!');
      return null;
    }
  } catch (e) {
    showSnackBar(context, e.toString());
  }
}

showSnackBar(BuildContext context, String text, {Color bgColor = Colors.red}) {
  final snackBar = SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    backgroundColor: bgColor,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

generatePdf(Tampon tampon) async {
  final pdf = pw.Document();

  pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return buildTampon(tampon); // Center
      }));
  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/${tampon.title}.pdf';
  final File file = File(path);
  await file.writeAsBytes(await pdf.save());
  OpenFilex.open(file.path);
}

pw.Widget buildTampon(Tampon tampon) {
  switch (tampon.forme) {
    case 'rectangle':
      return pw.ClipRRect(
        child: pw.Container(
          width: 28.85 * tampon.longueur,
          height: 28.85 * tampon.largeur,
          alignment: pw.Alignment.center,
          color: PdfColor.fromHex('#333333'),
          child: pw.Transform(
            alignment: pw.Alignment.center,
            transform: Matrix4.rotationY(180),
            child: pw.Text(tampon.contenu,
                style: pw.TextStyle(color: PdfColor.fromRYB(0, 0, 0))),
          ),
        ),
      );
    case 'carre':
      return pw.ClipRRect(
        child: pw.Container(
          width: 28.85 * tampon.largeur,
          height: 28.85 * tampon.largeur,
          alignment: pw.Alignment.center,
          color: PdfColor.fromHex('#333333'),
          child: pw.Transform(
            alignment: pw.Alignment.center,
            transform: Matrix4.rotationY(180),
            child: pw.Text(tampon.contenu,
                style: pw.TextStyle(color: PdfColor.fromRYB(0, 0, 0))),
          ),
        ),
      );
    case 'circle':
      return pw.ClipRRect(
        horizontalRadius: tampon.diametre * 28.85 / 2,
        verticalRadius: tampon.diametre * 28.85 / 2,
        child: pw.Container(
          width: 28.85 * tampon.diametre,
          height: 28.85 * tampon.diametre,
          color: PdfColor.fromHex('#333333'),
          child: pw.Transform(
            alignment: pw.Alignment.center,
            transform: Matrix4.rotationY(180),
            child: pw.Center(
              child: pw.Text(
                tampon.contenu,
                style: pw.TextStyle(
                  color: PdfColor.fromRYB(0, 0, 0),
                ),
              ),
            ),
          ),
        ),
      );
    case 'oval':
      return pw.ClipOval(
        child: pw.Container(
          width: 28.85 * tampon.longueur,
          height: 28.85 * tampon.largeur,
          color: PdfColor.fromHex('#333333'),
          child: pw.Transform(
            alignment: pw.Alignment.center,
            transform: Matrix4.rotationY(180),
            child: pw.Center(
              child: pw.Text(
                tampon.contenu,
                style: pw.TextStyle(
                  color: PdfColor.fromRYB(0, 0, 0),
                ),
              ),
            ),
          ),
        ),
      ); // Center
    default:
      return pw.ClipRRect(
        child: pw.Container(
          width: 28.85 * tampon.longueur,
          height: 28.85 * tampon.largeur,
          alignment: pw.Alignment.center,
          color: PdfColor.fromHex('#333333'),
          child: pw.Transform(
            alignment: pw.Alignment.center,
            transform: Matrix4.rotationY(180),
            child: pw.Text(tampon.contenu,
                style: pw.TextStyle(color: PdfColor.fromRYB(0, 0, 0))),
          ),
        ),
      );
  }
}
