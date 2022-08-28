import 'package:flutter/material.dart';
import 'package:tampons/UI/Views/second_screen.dart';
import 'package:tampons/UI/Widgets/search.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 219, 235),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 188, 194),
        title: const Text('TamPons'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            height: 180,
            width: 160,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 136, 225, 233),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(6.0),
            child: Text(
              'first tampon',
              style: TextStyle(
                color: Color.fromARGB(223, 70, 69, 69),
              ),
            ),
          ),
          const Text(
            '3/09/2022',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            new MaterialPageRoute(builder: (context) => SecondScreen()),
          );
        },
        backgroundColor: const Color.fromARGB(255, 1, 188, 194),
        child: const Icon(Icons.add),
      ),
    );
  }
}
