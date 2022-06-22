import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/themes.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      backgroundColor: Theme.of(context).canvasColor,
    );
  }
}
