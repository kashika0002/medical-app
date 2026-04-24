import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../theme/app_theme.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 80,
                    color: AppColors.textLight,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.textGray,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Add items from a restaurant to see them here',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartProvider.items.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartProvider.items[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            // Item Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                cartItem.menuItem.imageUrl,
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 60,
                                    height: 60,
                                    color: AppColors.borderGray,
                                    child: const Icon(Icons.fastfood, size: 30),
                                  );
                                },
                              ),
                            ),
                            const SizedBox(width: 12),
                            
                            // Item Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItem.menuItem.name,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '₹${cartItem.menuItem.price.toStringAsFixed(0)}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.textGray,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                            // Quantity Controls
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    cartProvider.updateQuantity(
                                      cartItem.menuItem.id,
                                      cartItem.quantity - 1,
                                    );
                                  },
                                  icon: const Icon(Icons.remove_circle_outline),
                                  color: AppColors.primaryRed,
                                ),
                                Text(
                                  '${cartItem.quantity}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    cartProvider.updateQuantity(
                                      cartItem.menuItem.id,
                                      cartItem.quantity + 1,
                                    );
                                  },
                                  icon: const Icon(Icons.add_circle_outline),
                                  color: AppColors.primaryRed,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              
              // Bottom Summary
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          Text(
                            '₹${cartProvider.total.toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryRed,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CheckoutScreen(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Text('Proceed to Checkout'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
