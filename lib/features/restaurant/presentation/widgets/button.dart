import 'package:flutter/material.dart';
import 'package:hackathon_msa_clean_architecture_bloc/core/utils/button.dart';
import 'package:hackathon_msa_clean_architecture_bloc/core/utils/typo.dart';

class CustomElevatedButton extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final Function onPressed;

  const CustomElevatedButton({
    super.key,
    required this.imagePath,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: btnPill,
      onPressed: () {
        onPressed();
      },
      child: Row(
        children: [
          Image.asset(imagePath, height: 22),
          const SizedBox(width: 8),
          Text(
            buttonText,
            style: cate,
          ),
        ],
      ),
    );
  }
}
