import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingWidget extends StatelessWidget {
  CustomLoadingWidget({
    super.key,
    this.color = const Color(0xff723881),
  });
  Color color;
  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.fourRotatingDots(
      color: color,
      size: 64,
    );
  }
}
