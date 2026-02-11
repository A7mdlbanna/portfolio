import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/utils/constants.dart';

class HomeSection extends StatelessWidget {
  final VoidCallback? onViewProjects;
  final VoidCallback? onContactMe;

  const HomeSection({super.key, this.onViewProjects, this.onContactMe});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;

    return Container(
      constraints: const BoxConstraints(minHeight: 600),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 40,
        vertical: isMobile ? 20 : 40
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: isMobile ? 80 : 100,
              backgroundColor: AppColors.primary,
              backgroundImage: const NetworkImage(
                  'https://avatars.githubusercontent.com/u/71278733?v=4'), // GitHub avatar based on user ID in markdown
            ).animate().scale(delay: 200.ms, duration: 800.ms, curve: Curves.easeOutBack),
            const SizedBox(height: 24),
            Text(
              "Hi, I'm Ahmed El Banna",
              style: AppTextStyles.header.copyWith(
                fontSize: isMobile ? 32 : 48
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 300.ms, duration: 800.ms).slideY(begin: 0.2, end: 0, duration: 800.ms),
            Text(
              "Senior Flutter Developer",
              style: AppTextStyles.subHeader.copyWith(
                color: AppColors.primary,
                fontSize: isMobile ? 20 : 24
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 600.ms, duration: 800.ms).slideY(begin: 0.2, end: 0, duration: 800.ms),
            const SizedBox(height: 16),
            Text(
              PortfolioData.bio,
              style: AppTextStyles.body.copyWith(
                  fontSize: isMobile ? 16 : 18
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 900.ms, duration: 800.ms),
            const SizedBox(height: 32),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: onViewProjects,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text("View Projects", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                OutlinedButton(
                  onPressed: onContactMe,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    side: const BorderSide(color: AppColors.primary, width: 2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  child: const Text("Contact Me", style: TextStyle(fontSize: 18, color: AppColors.primary)),
                ),
              ],
            ).animate().fadeIn(delay: 1000.ms, duration: 800.ms).slideY(begin: 0.2, end: 0, duration: 800.ms),
          ],
        ),
      ),
    );
  }
}
