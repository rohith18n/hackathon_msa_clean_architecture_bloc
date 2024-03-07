import 'package:flutter/material.dart';
import 'package:hackathon_msa_clean_architecture_bloc/core/utils/typo.dart';

class CustomProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String productPrice;
  final List<Widget> ratingStars;

  const CustomProductCard({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.productPrice,
    required this.ratingStars,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imagePath,
            height: 80,
            width: 60, // Set the desired height
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: product,
                ),
                const SizedBox(height: 2),
                Text(
                  productPrice,
                  style: price,
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(children: ratingStars),
        ],
      ),
    );
  }
}
