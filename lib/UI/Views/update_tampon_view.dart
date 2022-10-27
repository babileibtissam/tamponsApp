import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tampons/Core/DB/database.dart';
import 'package:tampons/Core/Models/tampon.dart';
import 'package:tampons/Core/Providers/tampons_provider.dart';
import 'package:tampons/Core/Utils/helpers.dart';
import 'package:tampons/UI/Widgets/app_input.dart';
import 'package:path/path.dart' as path;

class UpdateTamponView extends StatefulWidget {
  late Tampon tampon;
  UpdateTamponView({Key? key, required this.tampon}) : super(key: key);

  @override
  State<UpdateTamponView> createState() => _UpdateTamponViewState();
}

class _UpdateTamponViewState extends State<UpdateTamponView> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final longueurController = TextEditingController();
  final largeurController = TextEditingController();
  final sidesController = TextEditingController();
  final diametreController = TextEditingController();
  late Tampon tampon;
  File? image;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    tampon = widget.tampon;
    titleController.text = tampon.title;
    contentController.text = tampon.contenu;
    longueurController.text = tampon.longueur.toString();
    largeurController.text = tampon.largeur.toString();
    sidesController.text = tampon.largeur.toString();
    diametreController.text = tampon.diametre.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 219, 235),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 188, 194),
        title: const Text('Créer un Tampon'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            children: [
              AppInput(
                textController: titleController,
                hintText: 'Titre',
                labelText: 'Titre',
                onChange: (v) {
                  tampon.title = v;
                },
                inputValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Le titre est requis';
                  }
                  return null;
                },
              ),
              const Padding(padding: EdgeInsets.all(3)),
              const SizedBox(height: 10),
              const Text(
                'La Forme :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
              ),
              GridView.count(
                crossAxisCount: 2,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.all(10),
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tampon.forme = 'rectangle';
                      });
                    },
                    child: Card(
                      color: tampon.forme == 'rectangle'
                          ? const Color.fromARGB(255, 225, 250, 251)
                          : const Color.fromARGB(255, 181, 224, 226),
                      elevation: 8,
                      child: Image.asset('assets/shapes/rectangle.png'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tampon.forme = 'carre';
                      });
                    },
                    child: Card(
                      color: tampon.forme == 'carre'
                          ? const Color.fromARGB(255, 225, 250, 251)
                          : const Color.fromARGB(255, 181, 224, 226),
                      elevation: 8,
                      child: Image.asset('assets/shapes/carre.png'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tampon.forme = 'circle';
                      });
                    },
                    child: Card(
                      color: tampon.forme == 'circle'
                          ? const Color.fromARGB(255, 225, 250, 251)
                          : const Color.fromARGB(255, 181, 224, 226),
                      elevation: 8,
                      child: Image.asset('assets/shapes/circle.png'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tampon.forme = 'oval';
                      });
                    },
                    child: Card(
                      color: tampon.forme == 'oval'
                          ? const Color.fromARGB(255, 225, 250, 251)
                          : const Color.fromARGB(255, 181, 224, 226),
                      elevation: 8,
                      child: Image.asset('assets/shapes/oval.png'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              tampon.forme == 'rectangle'
                  ? Row(
                      children: [
                        Expanded(
                          child: AppInput(
                            textController: longueurController,
                            hintText: 'Longueur',
                            labelText: 'Longueur',
                            inputType: TextInputType.number,
                            formatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChange: (v) {
                              if (v.isNotEmpty) {
                                tampon.longueur = double.parse(v);
                              }
                            },
                            inputValidator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'la longueur est requise!';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: AppInput(
                            textController: largeurController,
                            hintText: 'Largeur',
                            labelText: 'Largeur',
                            inputType: TextInputType.number,
                            onChange: (v) {
                              if (v.isNotEmpty) {
                                tampon.largeur = double.parse(v);
                              }
                            },
                            formatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            inputValidator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'la largeur est requise!';
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    )
                  : const SizedBox(),
              tampon.forme == 'carre'
                  ? Row(
                      children: [
                        Expanded(
                          child: AppInput(
                            textController: largeurController,
                            hintText: 'côtés',
                            labelText: 'côtés',
                            inputType: TextInputType.number,
                            formatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChange: (v) {
                              if (v.isNotEmpty) {
                                tampon.largeur = double.parse(v);
                              }
                            },
                            inputValidator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'la coté est requise!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              tampon.forme == 'circle'
                  ? Row(
                      children: [
                        Expanded(
                          child: AppInput(
                            textController: diametreController,
                            hintText: 'diamètre',
                            labelText: 'diamètre',
                            inputType: TextInputType.number,
                            formatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChange: (v) {
                              if (v.isNotEmpty) {
                                tampon.diametre = double.parse(v);
                              }
                            },
                            inputValidator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'le diamètre est requis!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              tampon.forme == 'oval'
                  ? Row(
                      children: [
                        Expanded(
                          child: AppInput(
                            textController: longueurController,
                            hintText: 'grand diamètre',
                            labelText: 'grand diamètre',
                            inputType: TextInputType.number,
                            formatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChange: (v) {
                              if (v.isNotEmpty) {
                                tampon.longueur = double.parse(v);
                              }
                            },
                            inputValidator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'le grand diamètre est requis!';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: AppInput(
                            textController: largeurController,
                            hintText: 'petit diamètre',
                            labelText: 'petit diamètre',
                            inputType: TextInputType.number,
                            formatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChange: (v) {
                              if (v.isNotEmpty) {
                                tampon.largeur = double.parse(v);
                              }
                            },
                            inputValidator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'le petit diamètre est requis!';
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    )
                  : const SizedBox(),
              const SizedBox(height: 20),
              const Text(
                'Le contenu :',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              AppInput(
                textController: contentController,
                lines: 5,
                onChange: (v) {
                  tampon.contenu = v;
                },
                inputValidator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'le contenu est requis!';
                  }
                  return null;
                },
              ),
              // const Padding(
              //   padding: EdgeInsets.all(4.0),
              // ),
              // const SizedBox(height: 10),
              // Row(
              //   children: [
              //     const Text(
              //       'Logo: ',
              //       style: TextStyle(
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //     const SizedBox(width: 20),
              //     ElevatedButton(
              //       style: ButtonStyle(
              //         backgroundColor: MaterialStateProperty.all(
              //             const Color.fromRGBO(181, 224, 226, 1)),
              //       ),
              //       onPressed: () async {
              //         image = await pickFile(context);
              //         setState(() {});
              //       },
              //       child: const Text(
              //         'Choisir un logo',
              //         style: TextStyle(
              //           color: Colors.black,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // const SizedBox(height: 20),
              // image != null
              //     ? Container(
              //         color: const Color.fromRGBO(181, 224, 226, 1),
              //         child: Image.file(
              //           File(image!.path),
              //           fit: BoxFit.contain,
              //         ),
              //       )
              //     : const SizedBox(),
              // const SizedBox(height: 20),
              // image != null
              //     ? Row(
              //         children: [
              //           Expanded(
              //             child: ListTile(
              //               selectedColor:
              //                   const Color.fromRGBO(181, 224, 226, 1),
              //               contentPadding: const EdgeInsets.all(0),
              //               horizontalTitleGap: 0,
              //               title: const Text('Gauche'),
              //               leading: Radio<String>(
              //                 value: 'Gauche',
              //                 groupValue: tampon.logoAlign,
              //                 onChanged: (String? value) {
              //                   setState(() {
              //                     tampon.logoAlign = value!;
              //                   });
              //                 },
              //               ),
              //             ),
              //           ),
              //           Expanded(
              //             child: ListTile(
              //               contentPadding: const EdgeInsets.all(0),
              //               horizontalTitleGap: 0,
              //               title: const Text('Milieu'),
              //               leading: Radio<String>(
              //                 value: 'Milieu',
              //                 groupValue: tampon.logoAlign,
              //                 onChanged: (String? value) {
              //                   setState(() {
              //                     tampon.logoAlign = value!;
              //                   });
              //                 },
              //               ),
              //             ),
              //           ),
              //           Expanded(
              //             child: ListTile(
              //               contentPadding: const EdgeInsets.all(0),
              //               horizontalTitleGap: 0,
              //               title: const Text('Droite'),
              //               leading: Radio<String>(
              //                 value: 'Droite',
              //                 groupValue: tampon.logoAlign,
              //                 onChanged: (String? value) {
              //                   setState(() {
              //                     tampon.logoAlign = value!;
              //                   });
              //                 },
              //               ),
              //             ),
              //           ),
              //         ],
              //       )
              //     : const SizedBox(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      primary: const Color.fromARGB(255, 39, 171, 176),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        AppDB.updateTampon(tampon, tampon.id!);
                        Provider.of<TamponsProvider>(context, listen: false)
                            .getAllTampons()
                            .then((_) {
                          showSnackBar(context, 'Votre tampon a été modifié!',
                              bgColor: Colors.green);
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.save,
                        ),
                        Text('Enregistrer'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      primary: const Color.fromARGB(255, 39, 171, 176),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await generatePdf(tampon);
                        showSnackBar(context, 'Votre pdf a été crée!',
                            bgColor: Colors.green);
                      }
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.picture_as_pdf_outlined),
                        Text('PDF'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
