import 'package:flutter/material.dart';
import 'package:haber/Variables/variables.dart';

class DetayScreen extends StatefulWidget {
  String veri1, veri2, veri3, veri4, veri5, veri6, veri7, veri8;
  DetayScreen({
    required this.veri1,
    required this.veri2,
    required this.veri3,
    required this.veri4,
    required this.veri5,
    required this.veri6,
    required this.veri7,
    required this.veri8,
  });

  @override
  State<DetayScreen> createState() => _DetayScreenState();
}

class _DetayScreenState extends State<DetayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: Image.network(widget.veri1),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(widget.veri2), Text(widget.veri3)],
            ),
            SizedBox(
              height: 10,
            ),
            Text(widget.veri4),
            SizedBox(
              height: 10,
            ),
            Text(widget.veri5),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text(widget.veri7)],
            ),
          ],
        ),
      ),
    );
  }
}
