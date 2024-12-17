import 'package:flutter/material.dart';

// footer
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: Colors.black, // footer bg color
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            'About us',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'FAQs',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),

          // Follow Us Section
          Text(
            'Follow us',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.facebook, color: Colors.amber, size: 40), // Facebook Icon
              const SizedBox(width: 16),
              Icon(Icons.camera_alt, color: Colors.amber, size: 40), // Instagram Icon
              const SizedBox(width: 16),
              Icon(Icons.alternate_email, color: Colors.amber, size: 40), // Twitter Icon
            ],
          ),
          const SizedBox(height: 20),

          // Terms of Service
          Text(
            'Terms of Service',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '@2024 All Rights Reserved',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}


