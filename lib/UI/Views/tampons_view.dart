import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tampons/Core/Providers/tampons_provider.dart';
import 'package:tampons/UI/Views/create_tampon_view.dart';
import 'package:tampons/UI/Views/update_tampon_view.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    Provider.of<TamponsProvider>(context, listen: false).getAllTampons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 219, 235),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 188, 194),
        title: const Text('Tampons Generator'),
      ),
      body: Consumer<TamponsProvider>(builder: (_, tamponsProvider, __) {
        final tampons = tamponsProvider.tampons;
        if (tampons == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (tampons.isEmpty) {
          return const Center(
            child: Text('Aucun tampon crée !'),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1 / 8,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: tampons.length,
              itemBuilder: (BuildContext ctx, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UpdateTamponView(tampon: tampons[index])),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 132, 213, 216),
                            borderRadius: BorderRadius.circular(15)),
                        child: Image.asset(
                            'assets/shapes/${tampons[index].forme}.png'),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '  ${tampons[index].title}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '  ${tampons[index].date}',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                );
              }),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondScreen()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 1, 188, 194),
        child: const Icon(Icons.add),
      ),
    );
  }
}
