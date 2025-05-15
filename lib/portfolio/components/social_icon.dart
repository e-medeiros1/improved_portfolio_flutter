import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcon extends StatelessWidget {
  final String assetPath;
  final String semanticLabel;
  final double size;
  final VoidCallback? onTap;

  const SocialIcon({
    super.key,
    required this.assetPath,
    required this.semanticLabel,
    this.size = 30,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        assetPath,
        semanticsLabel: semanticLabel,
        width: size,
        height: size,
        placeholderBuilder: (context) => const CircularProgressIndicator(),
      ),
    );
  }
}
