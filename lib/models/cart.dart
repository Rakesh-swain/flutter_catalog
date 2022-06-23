import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
import '../models/catalog.dart';

class CartModel {
  //catalog field
  CatalogModel? _catalog;

  //collection of IDs (store Ids of each Item)
  final List<int> _itemIds = [];

  //Get catalog
  CatalogModel get catalog => _catalog!;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get item in the cart
  List<Item> get items => _itemIds.map((id) => _catalog!.getById(id)).toList();

  //Get total Price
  num get totalPrice =>
      items.fold(0, (total, currentitem) => total + currentitem.price);

  //Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart!._itemIds.add(item.id);
  }
}
