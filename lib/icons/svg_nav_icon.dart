import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgNavIcon extends StatelessWidget {
  final String assetName;
  final double size;
  final Color? color;

  const SvgNavIcon({
    super.key,
    required this.assetName,
    this.size = 24.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = color ?? IconTheme.of(context).color;

    return SvgPicture.asset(
      assetName,
      width: size,
      height: size,
      colorFilter: iconColor != null
          ? ColorFilter.mode(iconColor, BlendMode.srcIn)
          : null,
    );
  }
}
