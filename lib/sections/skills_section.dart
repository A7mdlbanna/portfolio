import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/utils/constants.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Languages and Tools",
            style: AppTextStyles.header,
          ).animate().fadeIn(duration: 800.ms).moveY(begin: 20),
          const SizedBox(height: 16),
          Text(
            "Technologies I use to bring ideas to life.",
            style: AppTextStyles.body,
          ).animate().fadeIn(delay: 300.ms, duration: 800.ms),
          const SizedBox(height: 32),
          Column(
            children: PortfolioData.skills.map((category) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Column(
                  children: [
                    Text(
                      category.title,
                      style: AppTextStyles.subHeader.copyWith(color: AppColors.primary),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: category.skills.map((skill) {
                        return Chip(
                          label: Text(
                            skill,
                            style: const TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          backgroundColor: AppColors.surface,
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: AppColors.primary.withValues(alpha: 0.5), width: 1),
                          ),
                        ).animate().fadeIn(delay: 400.ms, duration: 600.ms).scale(duration: 600.ms);
                      }).toList(),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
