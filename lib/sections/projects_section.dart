import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 40, 
        vertical: isMobile ? 20 : 40
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Top Projects",
            style: AppTextStyles.header,
          ).animate().fadeIn(duration: 800.ms).moveX(begin: -20, duration: 800.ms),
          const SizedBox(height: 16),
          Text(
            "Some of the key projects I've worked on.",
            style: AppTextStyles.body,
          ).animate().fadeIn(delay: 300.ms, duration: 800.ms),
          const SizedBox(height: 48),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = constraints.maxWidth > 1200
                  ? 3
                  : constraints.maxWidth > 800
                      ? 2
                      : 1;
              
              // Adjust aspect ratio based on card content and width
              double aspectRatio = crossAxisCount == 1 ? 1.8 : 1.3;
              if (screenWidth < 500) aspectRatio = 1.3; // Very small screens

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 24,
                  mainAxisSpacing: 24,
                  childAspectRatio: aspectRatio, 
                ),
                itemCount: PortfolioData.projects.length,
                itemBuilder: (context, index) {
                  return ProjectCard(project: PortfolioData.projects[index])
                      .animate(delay: (150 * index).ms)
                      .fadeIn(duration: 800.ms)
                      .scale(duration: 800.ms);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
