import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final bool hideBackButton;

  const AppHeader({
    super.key, 
    this.showBackButton = true,
    this.onBackPressed,
    this.hideBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.red[700]!, Colors.red[500]!],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showBackButton && !hideBackButton)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: onBackPressed ?? () => Navigator.pop(context),
            ),
          Text(
            'HemoGlobe',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
        ],
      ),
    );
  }
} 