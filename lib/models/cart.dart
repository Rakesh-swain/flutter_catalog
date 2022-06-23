import '../models/catalog.dart';

class CartModel {
  //Singleton class
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

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

  //Add Item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
