import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  final String title;

  const SecondScreen({required this.title, super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).primaryTextTheme.bodyMedium,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text("abc")],
      ),
    );
  }
}
