import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      color: AppColors.surface,
      child: Column(
        children: [
          Text("Connect with me", style: AppTextStyles.header)
              .animate()
              .fadeIn()
              .moveY(begin: 20),
          const SizedBox(height: 32),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: PortfolioData.socialLinks.map((link) {
              IconData icon;
              switch (link.platform.toLowerCase()) {
                case 'linkedin':
                  icon = FontAwesomeIcons.linkedin;
                  break;
                case 'github':
                  icon = FontAwesomeIcons.github;
                  break;
                case 'codeforces':
                  icon = FontAwesomeIcons.code; // Approximation
                  break;
                case 'discord':
                  icon = FontAwesomeIcons.discord;
                  break;
                case 'stackoverflow':
                  icon = FontAwesomeIcons.stackOverflow;
                  break;
                case 'facebook':
                  icon = FontAwesomeIcons.facebook;
                  break;
                case 'instagram':
                  icon = FontAwesomeIcons.instagram;
                  break;
                default:
                  icon = FontAwesomeIcons.link;
              }

              return IconButton(
                onPressed: () async {
                  final uri = Uri.parse(link.url);
                  if (await canLaunchUrl(uri)) launchUrl(uri);
                },
                icon: FaIcon(icon, size: 32, color: AppColors.textPrimary),
                tooltip: link.platform,
              ).animate().fadeIn(delay: 200.ms).scale();
            }).toList(),
          ),
          const SizedBox(height: 48),
          Text(
            "© ${DateTime.now().year} Ahmed El Banna. All rights reserved.",
            style: AppTextStyles.body.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
