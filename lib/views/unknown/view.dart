import 'package:flutter/material.dart';

class UnknownView extends StatefulWidget {
  const UnknownView({super.key});

  @override
  State<UnknownView> createState() => _UnknownViewState();
}

class _UnknownViewState extends State<UnknownView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("404"),
    );
  }
}
