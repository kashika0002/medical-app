class CartItem {
  final MenuItem menuItem;
  int quantity;

  CartItem({
    required this.menuItem,
    this.quantity = 1,
  });

  double get totalPrice => menuItem.price * quantity;
}

class Cart {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(MenuItem menuItem) {
    final existingIndex = _items.indexWhere(
      (item) => item.menuItem.id == menuItem.id,
    );

    if (existingIndex != -1) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(CartItem(menuItem: menuItem));
    }
  }

  void removeItem(String menuItemId) {
    _items.removeWhere((item) => item.menuItem.id == menuItemId);
  }

  void updateQuantity(String menuItemId, int quantity) {
    if (quantity <= 0) {
      removeItem(menuItemId);
      return;
    }

    final index = _items.indexWhere((item) => item.menuItem.id == menuItemId);
    if (index != -1) {
      _items[index].quantity = quantity;
    }
  }

  void clear() {
    _items.clear();
  }

  double get total {
    return _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  int get itemCount {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }

  bool get isEmpty => _items.isEmpty;
}
