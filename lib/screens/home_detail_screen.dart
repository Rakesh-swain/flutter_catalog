import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/home_widgets/add_to_cart.dart';
import '../models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailScreen extends StatelessWidget {
  final Item catalog;
  HomeDetailScreen({required this.catalog});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog).wh(120, 50),
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width: context.screenWidth,
                color: context.cardColor,
                child: Column(children: [
                  catalog.name.text.xl4.color(context.accentColor).bold.make(),
                  catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  "If you are experimental and love installing custom ROMs and mods, it is prudent to select a device that the developer community fancy. Before you make a choice, you may want to consider its average screen-on time and standby time."
                      .text
                      .textStyle(context.captionStyle)
                      .align(TextAlign.justify)
                      .make()
                      .p16(),
                ]).py64(),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
