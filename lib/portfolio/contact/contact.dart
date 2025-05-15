import 'package:flutter/material.dart';
import '../components/social_icon.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  final List<SocialIcon> socialLinks = const [
    SocialIcon(assetPath: 'assets/icons/img_fb.svg', semanticLabel: 'Facebook'),
    SocialIcon(assetPath: 'assets/icons/img_insta.svg', semanticLabel: 'Instagram'),
 
    SocialIcon(assetPath: 'assets/icons/img_linkedin.svg', semanticLabel: 'LinkedIn'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 35,
            children: socialLinks
                .map(
                  (icon) => SocialIcon(
                    assetPath: icon.assetPath,
                    semanticLabel: icon.semanticLabel,
                    onTap: () {
                      
                      debugPrint('${icon.semanticLabel} ícone clicado');
                    },
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 25),
          const Text(
            '© 2025 All rights reserved',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
