import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomMessengers {
  static void showseccessSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
            const Gap(10),
            Text(message),
          ],
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  static void showErrorSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.error,
              color: Colors.white,
            ),
            const Gap(10),
            Text(message),
          ],
        ),
        backgroundColor: Colors.red,
      ),
    );
  }
}
