import 'package:flutter/foundation.dart';
import '../models/cart.dart';
import '../models/menu_item.dart';

class CartProvider with ChangeNotifier {
  final Cart _cart = Cart();

  Cart get cart => _cart;
  List<CartItem> get items => _cart.items;
  double get total => _cart.total;
  int get itemCount => _cart.itemCount;
  bool get isEmpty => _cart.isEmpty;

  void addItem(MenuItem menuItem) {
    _cart.addItem(menuItem);
    notifyListeners();
  }

  void removeItem(String menuItemId) {
    _cart.removeItem(menuItemId);
    notifyListeners();
  }

  void updateQuantity(String menuItemId, int quantity) {
    _cart.updateQuantity(menuItemId, quantity);
    notifyListeners();
  }

  void clear() {
    _cart.clear();
    notifyListeners();
  }
}
