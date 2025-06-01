import 'package:flutter/material.dart';

class PayIcon extends StatelessWidget {
  final double size;

  const PayIcon({this.size = 25.0, super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icons/pay.png',
      width: size,
      height: size,
    );
  }
}
