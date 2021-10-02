import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:velocity_x/velocity_x.dart';

class OrderPlaced extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Lottie.asset("assets/done.json")
              .p64()
              .backgroundColor(context.canvasColor),
          20.squareBox,
          "Order Placed".text.xl5.make(),

        ],
      ),
    );
  }
}
