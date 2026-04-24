import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/restaurant.dart';
import '../providers/cart_provider.dart';
import '../services/firebase_service.dart';
import '../theme/app_theme.dart';
import '../widgets/restaurant_card.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/common_widgets.dart';
import 'restaurant_menu_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseService _firebaseService = FirebaseService();
  String _searchQuery = '';
  String _currentCity = 'Mumbai';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Food Delivery',
              style: TextStyle(fontSize: 16),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.location_on, size: 14, color: AppColors.primaryRed),
                const SizedBox(width: 4),
                Text(
                  _currentCity,
                  style: const TextStyle(fontSize: 12, color: AppColors.textGray),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Badge(
              backgroundColor: AppColors.primaryRed,
              textColor: AppColors.white,
              child: const Icon(Icons.shopping_cart, color: AppColors.textDark),
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomSearchBar(
              hintText: 'Search for restaurants',
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              onClear: () {
                setState(() {
                  _searchQuery = '';
                });
              },
            ),
          ),

          // Restaurant List
          Expanded(
            child: StreamBuilder<List<Restaurant>>(
              stream: _firebaseService.getRestaurants(_currentCity),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingWidget(message: 'Loading restaurants...');
                }

                if (snapshot.hasError) {
                  return ErrorWidget(
                    message: 'Failed to load restaurants',
                    onRetry: () {
                      setState(() {});
                    },
                  );
                }

                var restaurants = snapshot.data ?? [];

                // Filter by search query
                if (_searchQuery.isNotEmpty) {
                  restaurants = restaurants
                      .where((restaurant) =>
                          restaurant.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
                          restaurant.cuisine.toLowerCase().contains(_searchQuery.toLowerCase()))
                      .toList();
                }

                if (restaurants.isEmpty) {
                  return const EmptyWidget(
                    message: 'No restaurants found',
                    icon: Icons.restaurant_outlined,
                  );
                }

                return ListView.builder(
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    final restaurant = restaurants[index];
                    return RestaurantCard(
                      name: restaurant.name,
                      imageUrl: restaurant.imageUrl,
                      rating: restaurant.rating,
                      deliveryTime: restaurant.deliveryTime,
                      cuisine: restaurant.cuisine,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RestaurantMenuScreen(
                              restaurant: restaurant,
                            ),
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
