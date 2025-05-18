import 'package:flutter/material.dart';
import 'package:labnova/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.isLoading = false,
  });
  final Function()? onPressed;
  final String text;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        fixedSize: Size(
          MediaQuery.of(context).size.width * 0.9,
          50,
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextThemes.TextStyle24.copyWith(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
