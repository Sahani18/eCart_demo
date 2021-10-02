import 'package:flutter/material.dart';

import '../modals/Catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key key, this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price}",
          style: TextStyle(
            fontSize: 14,fontWeight: FontWeight.bold,
            color: Colors.deepPurple.shade800
          ),
        ),
      ),
    );
  }
}
