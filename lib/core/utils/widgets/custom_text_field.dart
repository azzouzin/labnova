import 'package:flutter/material.dart';
import 'package:labnova/core/utils/styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.keyboardType,
  });
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextThemes.TextStyle16.copyWith(color: Colors.grey),
        labelText: labelText,
        labelStyle: TextThemes.TextStyle16.copyWith(color: Color(0xff8C8C8C)),
        fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Color(0xffE0E0E0),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
          ),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}
