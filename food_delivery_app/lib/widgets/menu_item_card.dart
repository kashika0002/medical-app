import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_item.dart';
import '../providers/cart_provider.dart';
import '../theme/app_theme.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItem menuItem;
  final VoidCallback onAddToCart;

  const MenuItemCard({
    super.key,
    required this.menuItem,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menu Item Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Veg/Non-veg indicator
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: menuItem.isVeg ? AppColors.successGreen : AppColors.primaryRed,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Icon(
                      menuItem.isVeg ? Icons.circle : Icons.restaurant,
                      size: 12,
                      color: menuItem.isVeg ? AppColors.successGreen : AppColors.primaryRed,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    menuItem.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    menuItem.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textGray,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '₹${menuItem.price.toStringAsFixed(0)}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: onAddToCart,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    ),
                    child: const Text('ADD'),
                  ),
                ],
              ),
            ),
            // Menu Item Image
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                menuItem.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: AppColors.borderGray,
                    child: const Icon(
                      Icons.fastfood,
                      size: 40,
                      color: AppColors.textLight,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
