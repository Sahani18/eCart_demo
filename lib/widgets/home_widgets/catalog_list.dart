import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/product_detail.dart';
import 'package:shopping_app/modals/Catalog.dart';

import 'package:velocity_x/velocity_x.dart';
import 'add_to_cart.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModal.item.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModal.item[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CatalogDetail(catalog: catalog)));
            },
            child: CatalogItem(catalog: catalog),
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key key, this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(
              image: catalog.image,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(context.accentColor).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}"
                        .text
                        .lg
                        .color(Colors.deepPurple.shade800)
                        .bold
                        .make(),
                    AddToCart(catalog: catalog),
                  ],
                ).pOnly(right: 8),
              ],
            ),
          ),
        ],
      ),
    ).color(context.cardColor).square(150).roundedLg.make().py16();
  }
}

