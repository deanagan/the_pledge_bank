
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PledgeMoneyIcon extends StatelessWidget {
  final double size;
  final Color? color;

  const PledgeMoneyIcon({this.size = 25.0, super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/pay.svg',
      width: 24,
      height: 24,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}


