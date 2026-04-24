import 'package:flutter/material.dart';
import '../models/order.dart';
import '../theme/app_theme.dart';
import 'home_screen.dart';

class OrderSuccessScreen extends StatelessWidget {
  final Order order;

  const OrderSuccessScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success Icon
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.successGreen.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  size: 80,
                  color: AppColors.successGreen,
                ),
              ),
              const SizedBox(height: 32),
              
              // Success Message
              const Text(
                'Order Placed!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 16),
              
              const Text(
                'Your order has been successfully placed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textGray,
                ),
              ),
              const SizedBox(height: 32),
              
              // Order Details Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderGray),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Order Details',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    const Divider(height: 24),
                    
                    _buildDetailRow(
                      'Order ID',
                      '#${order.id.substring(order.id.length - 8)}',
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      'Total Amount',
                      '₹${order.totalAmount.toStringAsFixed(0)}',
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      'Payment',
                      'Cash on Delivery',
                    ),
                    const SizedBox(height: 12),
                    _buildDetailRow(
                      'Status',
                      'Pending',
                      statusColor: AppColors.primaryRed,
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Delivery Info
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.backgroundGray,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: AppColors.primaryRed,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Delivery Address',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textLight,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            order.deliveryAddress,
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textDark,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const Spacer(),
              
              // Back to Home Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                      (route) => false,
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('Back to Home'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {Color? statusColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textGray,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: statusColor ?? AppColors.textDark,
          ),
        ),
      ],
    );
  }
}
