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
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 40,
        vertical: 40,
      ),
      color: AppColors.surface,
      child: Column(
        children: [
          Text("Connect with me", style: AppTextStyles.header)
              .animate()
              .fadeIn(duration: 800.ms)
              .moveY(begin: 20, duration: 800.ms),
          const SizedBox(height: 32),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: PortfolioData.socialLinks.map((link) {
              IconData icon;
              VoidCallback? onPressed;
              
              switch (link.platform.toLowerCase()) {
                case 'whatsapp':
                  icon = FontAwesomeIcons.whatsapp;
                  onPressed = () async {
                    final uri = Uri.parse(link.url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri, mode: LaunchMode.externalApplication);
                    }
                  };
                  break;
                case 'email':
                  icon = FontAwesomeIcons.envelope;
                  onPressed = () async {
                    final uri = Uri.parse(link.url);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  };
                  break;
                case 'linkedin':
                  icon = FontAwesomeIcons.linkedin;
                  onPressed = () async {
                    final uri = Uri.parse(link.url);
                    if (await canLaunchUrl(uri)) launchUrl(uri);
                  };
                  break;
                case 'github':
                  icon = FontAwesomeIcons.github;
                  onPressed = () async {
                    final uri = Uri.parse(link.url);
                    if (await canLaunchUrl(uri)) launchUrl(uri);
                  };
                  break;
                case 'codeforces':
                  icon = FontAwesomeIcons.code;
                  onPressed = () async {
                    final uri = Uri.parse(link.url);
                    if (await canLaunchUrl(uri)) launchUrl(uri);
                  };
                  break;
                case 'discord':
                  icon = FontAwesomeIcons.discord;
                  onPressed = () async {
                    final uri = Uri.parse(link.url);
                    if (await canLaunchUrl(uri)) launchUrl(uri);
                  };
                  break;
                case 'stackoverflow':
                  icon = FontAwesomeIcons.stackOverflow;
                  onPressed = () async {
                    final uri = Uri.parse(link.url);
                    if (await canLaunchUrl(uri)) launchUrl(uri);
                  };
                  break;
                default:
                  icon = FontAwesomeIcons.link;
                  onPressed = () async {
                    final uri = Uri.parse(link.url);
                    if (await canLaunchUrl(uri)) launchUrl(uri);
                  };
              }

              return IconButton(
                onPressed: onPressed,
                icon: FaIcon(icon, size: 32, color: AppColors.textPrimary),
                tooltip: link.platform,
              ).animate().fadeIn(delay: 200.ms, duration: 800.ms).scale(duration: 800.ms);
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
