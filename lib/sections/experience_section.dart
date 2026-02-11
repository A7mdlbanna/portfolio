import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/models/experience_model.dart';
import 'package:portfolio/utils/constants.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 40,
        vertical: isMobile ? 40 : 80,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Experience",
            style: AppTextStyles.header,
          ).animate().fadeIn().moveX(begin: -20),
          const SizedBox(height: 12),
          Text(
            "My professional journey and career milestones.",
            style: AppTextStyles.body,
          ).animate().fadeIn(delay: 200.ms),
          const SizedBox(height: 32),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: PortfolioData.experiences.length,
            separatorBuilder: (context, index) => const SizedBox(height: 32),
            itemBuilder: (context, index) {
              final experience = PortfolioData.experiences[index];
              return ExperienceCard(experience: experience, isMobile: isMobile)
                  .animate()
                  .fadeIn(delay: (450 + (index * 150)).ms, duration: 800.ms)
                  .slideX(begin: 0.1, end: 0, duration: 800.ms);
            },
          ),
        ],
      ),
    );
  }
}

class ExperienceCard extends StatefulWidget {
  final Experience experience;
  final bool isMobile;

  const ExperienceCard({
    super.key,
    required this.experience,
    required this.isMobile,
  });

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered ? AppColors.primary : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
          ],
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.isMobile) ...[
              Text(
                widget.experience.role,
                style: AppTextStyles.subHeader.copyWith(
                  color: AppColors.primary,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                widget.experience.company,
                style: AppTextStyles.body.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              _buildPeriodBadge(),
            ] else ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.experience.role,
                        style: AppTextStyles.subHeader.copyWith(
                          color: AppColors.primary,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.experience.company,
                        style: AppTextStyles.body.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  _buildPeriodBadge(),
                ],
              ),
            ],
            const SizedBox(height: 16),
            ...widget.experience.description.map((desc) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Icon(
                          Icons.circle,
                          size: 6,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          desc,
                          style: AppTextStyles.body.copyWith(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodBadge() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (widget.experience.type != null) ...[
          Container(
             padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
             decoration: BoxDecoration(
               color: AppColors.primary.withValues(alpha: 0.1),
               borderRadius: BorderRadius.circular(12),
               border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
             ),
             child: Text(
               widget.experience.type!,
               style: const TextStyle(
                 color: AppColors.primary,
                 fontSize: 12,
                 fontWeight: FontWeight.w600,
               ),
             ),
           ),
          const SizedBox(height: 8),
        ],
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.textSecondary.withValues(alpha: 0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.calendar_today, size: 14, color: AppColors.textSecondary),
              const SizedBox(width: 8),
              Text(
                widget.experience.period,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
