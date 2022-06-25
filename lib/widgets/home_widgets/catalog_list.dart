import 'package:flutter/material.dart';
import 'package:flutter_catalog/screens/home_detail_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import './catalog_image.dart';
import 'add_to_cart.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20),
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeDetailScreen(catalog: catalog))),
                child: CatalogItem(
                  catalogs: catalog,
                ),
              );
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
              final catalog = CatalogModel.items[index];
              return InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomeDetailScreen(catalog: catalog))),
                child: CatalogItem(
                  catalogs: catalog,
                ),
              );
            },
          );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalogs;

  CatalogItem({required this.catalogs});
  @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
          tag: Key(catalogs.id.toString()),
          child: CatalogImage(image: catalogs.image)),
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          catalogs.name.text.lg.color(context.accentColor).bold.make(),
          catalogs.desc.text.textStyle(context.captionStyle).make(),
          10.heightBox,
          ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalogs.price}".text.bold.xl.make(),
              AddToCart(catalog: catalogs),
            ],
          ).pOnly(right: 10.0)
        ],
      ).p(context.isMobile ? 0 : 16))
    ];
    return VxBox(
      child: context.isMobile
          ? Row(
              children: children2,
            )
          : Column(
              children: children2,
            ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }
}
