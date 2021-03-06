import 'package:shopping_app/core/store.dart';
import 'package:shopping_app/modals/Catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //catalog fields
  CatalogModal _catalog;

  //Collections od IDs- store ids of items

  final List<int> _itemIds = [];

  //get catalog
  CatalogModal get catalog => _catalog;

  set catalog(CatalogModal newCatalog) {
    _catalog = newCatalog;
  }

  //get items in the cart

  List<Item> get item => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price

  num get totalPrice => item.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);

  @override
  perform() {
    store.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store.cart._itemIds.remove(item.id);
  }
}
