import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/core/analytics/analytics_tracker.dart';
import 'package:portfolio/utils/url_helper.dart' as url_helper;
import 'package:url_launcher/url_launcher.dart';

class ProjectCard extends StatefulWidget {
  final Project project;

  const ProjectCard({super.key, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    // Check if we have a valid asset image
    String? imageUrl = widget.project.imageUrl;
    bool hasImage = imageUrl != null && imageUrl.isNotEmpty;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {
          url_helper.navigateToProject(widget.project.slug);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered ? AppColors.primary : Colors.transparent,
              width: 1.5,
            ),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                )
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: hasImage
                        ? Image.asset(
                            imageUrl,
                            width: 48,
                            height: 48,
                            cacheWidth: 100, // Optimize decoding
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                _buildPlaceholder(),
                          )
                        : _buildPlaceholder(),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.project.title,
                      style: AppTextStyles.subHeader.copyWith(fontSize: 18),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                widget.project.description,
                style: AppTextStyles.body.copyWith(fontSize: 13),
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              if (widget.project.stats != null) ...[
                const SizedBox(height: 8),
                Text(
                  widget.project.stats!,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
              const SizedBox(height: 12),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: widget.project.technologies.map((tech) { // Show all tags
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      tech,
                      style: const TextStyle(fontSize: 10, color: AppColors.textPrimary),
                    ),
                  );
                }).toList(),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (widget.project.playStoreLink != null)
                    _LinkButton(
                      icon: FontAwesomeIcons.googlePlay,
                      url: widget.project.playStoreLink!,
                      tooltip: 'Google Play',
                      projectId: widget.project.slug,
                      type: 'store',
                    ),
                  if (widget.project.appStoreLink != null)
                    _LinkButton(
                      icon: FontAwesomeIcons.appStore,
                      url: widget.project.appStoreLink!,
                      tooltip: 'App Store',
                      projectId: widget.project.slug,
                      type: 'store',
                    ),
                  if (widget.project.microsoftStoreLink != null)
                    _LinkButton(
                      icon: FontAwesomeIcons.microsoft,
                      url: widget.project.microsoftStoreLink!,
                      tooltip: 'Microsoft Store',
                      projectId: widget.project.slug,
                      type: 'store',
                    ),
                  if (widget.project.appGalleryLink != null)
                    _LinkButton(
                      icon: FontAwesomeIcons.store,
                      url: widget.project.appGalleryLink!,
                      tooltip: 'AppGallery',
                      projectId: widget.project.slug,
                      type: 'store',
                    ),
                  if (widget.project.demoLink != null)
                    _LinkButton(
                      icon: FontAwesomeIcons.link,
                      url: widget.project.demoLink!,
                      tooltip: 'Demo/Drive',
                      projectId: widget.project.slug,
                      type: 'demo',
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    // Generate initials
    String name = widget.project.title;
    String initials = "";
    if (name.isNotEmpty) {
      List<String> parts = name.trim().split(" ");
      if (parts.length > 1) {
        initials = "${parts[0][0]}${parts[1][0]}";
      } else {
        initials = parts[0].length > 1 ? parts[0].substring(0, 2) : parts[0];
      }
    }
    initials = initials.toUpperCase();

    // Generate a deterministic color based on the name
    int hash = name.codeUnits.fold(0, (prev, element) => prev + element);
    List<Color> colors = [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.teal,
      Colors.orange,
      Colors.purple,
      Colors.pink,
      Colors.indigo,
    ];
    Color bgColor = colors[hash % colors.length];

    return Container(
      width: 48,
      height: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: bgColor.withValues(alpha: 0.5)),
      ),
      child: Text(
        initials,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: bgColor,
        ),
      ),
    );
  }
}

class _LinkButton extends StatelessWidget {
  final FaIconData icon;
  final String url;
  final String tooltip;
  final String projectId;
  final String type;

  const _LinkButton({
    required this.icon,
    required this.url,
    required this.tooltip,
    required this.projectId,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      tooltip: tooltip,
      icon: FaIcon(icon, size: 32, color: AppColors.textSecondary),
      onPressed: () async {
        AnalyticsTracker.trackProjectLinkClick(
          projectId: projectId,
          url: url,
          type: type,
        );
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      hoverColor: AppColors.primary.withValues(alpha: 0.1),
    );
  }
}