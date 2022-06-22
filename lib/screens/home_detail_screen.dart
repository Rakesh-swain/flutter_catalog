import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import '../models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailScreen extends StatelessWidget {
  final Item catalog;
  HomeDetailScreen({required this.catalog});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)),
          ],
        ).p16(),
      ),
    );
  }
}
