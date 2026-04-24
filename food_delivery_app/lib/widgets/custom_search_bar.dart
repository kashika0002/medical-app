import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final VoidCallback? onClear;

  const CustomSearchBar({
    super.key,
    this.hintText = 'Search',
    required this.onChanged,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: const Icon(Icons.search, color: AppColors.textLight),
        suffixIcon: onClear != null
            ? IconButton(
                icon: const Icon(Icons.clear, color: AppColors.textLight),
                onPressed: () {
                  onChanged('');
                  onClear!();
                },
              )
            : null,
      ),
    );
  }
}
