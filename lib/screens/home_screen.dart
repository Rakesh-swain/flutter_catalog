import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalog App')),
      body: const Center(child: Text('Welcome to flutter code')),
      drawer: const Drawer(),
    );
  }
}
