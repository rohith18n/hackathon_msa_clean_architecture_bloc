import 'package:flutter/material.dart';
import 'color.dart';

final ButtonStyle btnPill = ElevatedButton.styleFrom(
  minimumSize: const Size(0, 0),
  backgroundColor: white,
  elevation: 0,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(18),
    ),
  ),
);
