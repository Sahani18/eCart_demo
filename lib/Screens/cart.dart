import 'package:flutter/material.dart';
import 'package:shopping_app/Screens/order_placed.dart';
import 'package:shopping_app/core/store.dart';
import 'package:shopping_app/modals/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [


          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context,dynamic,status){
              return "\$${_cart.totalPrice}"
                  .text
                  .xl3.bold
                  .color(context.theme.accentColor)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              // _cart.item==0?SnackBar(content: ScaffoldMessenger(
              //   child: "Add item".text.make(),
              // )) :
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => OrderPlaced()));
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.theme.buttonColor),
              shape: MaterialStateProperty.all(StadiumBorder()),
            ),
            child: "Place Order".text.xl.make(),
          ).wh(120, 45),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.item.isEmpty
        ? "Cart is Empty".text.xl3.color(context.accentColor).makeCentered()
        : ListView.builder(
            itemCount: _cart.item?.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  child: _cart.item[index].image.circularNetworkImage(
                    bgColor: context.backgroundColor,
                  ),
                ),
                title: _cart.item[index].name.text.make(),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    RemoveMutation(_cart.item[index]);
                  },
                ),
              );
            },
          );
  }
}
