import 'package:flutter/material.dart';
import 'package:shopping_app/modals/Catalog.dart';
import 'package:shopping_app/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogDetail extends StatefulWidget {
  final Item catalog;

  const CatalogDetail({Key key, @required this.catalog}) : super(key: key);

  @override
  _CatalogDetailState createState() => _CatalogDetailState();
}

class _CatalogDetailState extends State<CatalogDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: context.cardColor,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${widget.catalog.price}"
                  .text
                  .xl4
                  .color(Colors.deepPurple.shade800)
                  .bold
                  .make(),
              AddToCart(catalog: widget.catalog,).wh(120, 50),
            ],
          ).p32(),
        ),
        backgroundColor: context.canvasColor,

        appBar: AppBar(
          backgroundColor: Colors.transparent,

        ),
        body: Column(
          children: [
            Hero(
              tag: Key(widget.catalog.id.toString()),
              child: Image.network(widget.catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 25,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: SingleChildScrollView(
                  child: Container(
                    color: context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        widget.catalog.name.text.xl4
                            .color(context.accentColor)
                            .bold
                            .make(),
                        widget.catalog.desc.text.lg
                            .textStyle(context.captionStyle)

                            .make(),
                        12.heightBox,
                        widget.catalog.about.text.lg.color(context.accentColor)
                            .textStyle(context.captionStyle)
                            .make()
                            .p16(),
                        10.heightBox,
                      ],
                    ).py64(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
