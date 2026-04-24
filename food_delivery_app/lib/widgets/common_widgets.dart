import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LoadingWidget extends StatelessWidget {
  final String? message;

  const LoadingWidget({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: AppColors.primaryRed),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: const TextStyle(
                color: AppColors.textGray,
                fontSize: 14,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class EmptyWidget extends StatelessWidget {
  final String message;
  final IconData icon;

  const EmptyWidget({
    super.key,
    required this.message,
    this.icon = Icons.restaurant_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 80,
            color: AppColors.textLight,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textGray,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class ErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const ErrorWidget({
    super.key,
    required this.message,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 60,
            color: AppColors.primaryRed,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textGray,
              fontSize: 14,
            ),
          ),
          if (onRetry != null) ...[
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ],
      ),
    );
  }
}
