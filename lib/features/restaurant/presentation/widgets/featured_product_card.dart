import 'package:flutter/material.dart';

class FeaturedProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final double rating;

  const FeaturedProductCard({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imagePath,
              height: 200,
              fit: BoxFit.cover, // Ensure the image fits the box
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2, // Maximum of 2 lines for the product name
                  overflow: TextOverflow.ellipsis, // Ellipsis for overflow
                ),
                const SizedBox(height: 4), // Add spacing between rows
                Row(
                  children: [
                    Image.asset(
                      'assets/star.png',
                      height: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
