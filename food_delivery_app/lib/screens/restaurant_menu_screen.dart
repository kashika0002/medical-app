import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/restaurant.dart';
import '../models/menu_item.dart';
import '../providers/cart_provider.dart';
import '../services/firebase_service.dart';
import '../theme/app_theme.dart';
import '../widgets/menu_item_card.dart';
import '../widgets/common_widgets.dart';

class RestaurantMenuScreen extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantMenuScreen({super.key, required this.restaurant});

  @override
  State<RestaurantMenuScreen> createState() => _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  final FirebaseService _firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              if (cartProvider.itemCount == 0) return const SizedBox.shrink();
              
              return Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primaryRed,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.shopping_cart, size: 18, color: AppColors.white),
                    const SizedBox(width: 4),
                    Text(
                      '${cartProvider.itemCount}',
                      style: const TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Restaurant Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: AppColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.restaurant.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.restaurant.cuisine,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textGray,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.successGreen,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, size: 16, color: AppColors.white),
                          const SizedBox(width: 4),
                          Text(
                            widget.restaurant.rating.toString(),
                            style: const TextStyle(color: AppColors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.access_time, size: 16, color: AppColors.textLight),
                    const SizedBox(width: 4),
                    Text(
                      widget.restaurant.deliveryTime,
                      style: const TextStyle(color: AppColors.textGray),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          
          // Menu Items List
          Expanded(
            child: StreamBuilder<List<MenuItem>>(
              stream: _firebaseService.getMenuItems(widget.restaurant.id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingWidget(message: 'Loading menu...');
                }

                if (snapshot.hasError) {
                  return ErrorWidget(
                    message: 'Failed to load menu',
                    onRetry: () {
                      setState(() {});
                    },
                  );
                }

                final menuItems = snapshot.data ?? [];

                if (menuItems.isEmpty) {
                  return const EmptyWidget(
                    message: 'No menu items available',
                    icon: Icons.fastfood_outlined,
                  );
                }

                return ListView.builder(
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    final menuItem = menuItems[index];
                    return MenuItemCard(
                      menuItem: menuItem,
                      onAddToCart: () {
                        context.read<CartProvider>().addItem(menuItem);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${menuItem.name} added to cart'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
