import 'package:flutter/material.dart';
import '../widgets/item_widget.dart';
import '../models/catalog.dart';

import '../widgets/drawer.dart';

class HomeScreen extends StatelessWidget {
  final dummyList = List.generate(6, (index) => CatalogModel.items[0]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Catalog App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
