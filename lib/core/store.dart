import 'package:shopping_app/modals/Catalog.dart';
import 'package:shopping_app/modals/cart_model.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  CatalogModal catalog;
  CartModel cart;

  MyStore(){
    catalog=CatalogModal();
    cart=CartModel();
    cart.catalog=catalog;
  }

}