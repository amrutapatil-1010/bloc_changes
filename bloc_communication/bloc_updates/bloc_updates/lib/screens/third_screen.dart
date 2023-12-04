import 'package:flutter/material.dart';

class ThirdScreen extends StatefulWidget {
  final String title;

  const ThirdScreen({required this.title, super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
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
