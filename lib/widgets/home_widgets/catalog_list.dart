import 'package:flutter/material.dart';
import 'package:flutter_catalog/screens/home_detail_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/catalog.dart';
import '../themes.dart';
import './catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeDetailScreen(catalog: catalog))),
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
    return VxBox(
      child: Row(
        children: [
          Hero(
              tag: Key(catalogs.id.toString()),
              child: CatalogImage(image: catalogs.image)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalogs.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalogs.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalogs.price}".text.bold.xl.make(),
                  ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              MyTheme.darkBluishColor),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      child: "Add to Cart".text.make()),
                ],
              ).pOnly(right: 10.0)
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}
