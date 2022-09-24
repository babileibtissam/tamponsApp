import 'package:flutter/material.dart';

Widget buildBoxs() => Row(
      children: [
        Expanded(child: buildBox()),
        const SizedBox(width: 10),
        Expanded(child: buildBox()),
      ],
    );

Widget buildBox() {
  return Column(
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
        const Padding(padding: EdgeInsets.all(8)),
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
      ]);
}
