import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    controller.addListener(() => setState(() {}));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 219, 235),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 188, 194),
        title: const Text('Cree Un TamPon'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Title',
                labelText: 'Title',
                border: const OutlineInputBorder(),
                suffixIcon: controller.text.isEmpty
                    ? Container(
                        width: 0,
                      )
                    : IconButton(
                        onPressed: () => controller.clear(),
                        icon: const Icon(Icons.close),
                      ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(3)),
            const Text(
              'La Forme :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                  width: 160,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 136, 225, 233),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(3.0)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                  width: 160,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 136, 225, 233),
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
