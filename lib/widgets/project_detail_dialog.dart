import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailDialog extends StatelessWidget {
  final Project project;

  const ProjectDetailDialog({super.key, required this.project});

  static void show(BuildContext context, Project project, VoidCallback onClosed) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      barrierColor: Colors.black.withValues(alpha: 0.8),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, anim1, anim2) => ProjectDetailDialog(project: project),
      transitionBuilder: (context, anim1, anim2, child) {
        return ScaleTransition(
          scale: CurvedAnimation(
            parent: anim1,
            curve: Curves.easeOutCubic,
          ),
          child: FadeTransition(
            opacity: anim1,
            child: child,
          ),
        );
      },
    ).then((_) {
      onClosed();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 600;

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: isMobile ? size.width * 0.95 : 600,
          constraints: BoxConstraints(maxHeight: size.height * 0.8),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white10, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 16, 12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: (project.imageUrl != null && project.imageUrl!.isNotEmpty)
                          ? Image.asset(
                              project.imageUrl!,
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  _buildPlaceholder(project.title),
                            )
                          : _buildPlaceholder(project.title),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        project.title,
                        style: GoogleFonts.outfit(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: AppColors.textSecondary),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.white10, height: 1),
              
              // Scrollable Body
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      // Description
                      Text(
                        "About Project",
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        project.description,
                        style: AppTextStyles.body.copyWith(
                          fontSize: 14,
                          color: AppColors.textPrimary.withValues(alpha: 0.9),
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Technologies
                      Text(
                        "Technologies",
                        style: GoogleFonts.outfit(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: project.technologies.map((tech) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: AppColors.primary.withValues(alpha: 0.2),
                              ),
                            ),
                            child: Text(
                              tech,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 24),
                      
                      // Links
                      _buildLinksSection(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLinksSection(BuildContext context) {
    final buttons = <Widget>[];

    if (project.playStoreLink != null) {
      buttons.add(_buildLinkButton("Google Play", project.playStoreLink!, FontAwesomeIcons.googlePlay));
    }
    if (project.appStoreLink != null) {
      buttons.add(_buildLinkButton("App Store", project.appStoreLink!, FontAwesomeIcons.appStore));
    }
    if (project.microsoftStoreLink != null) {
      buttons.add(_buildLinkButton("Microsoft Store", project.microsoftStoreLink!, FontAwesomeIcons.microsoft));
    }
    if (project.appGalleryLink != null) {
      buttons.add(_buildLinkButton("AppGallery", project.appGalleryLink!, FontAwesomeIcons.store));
    }
    if (project.demoLink != null) {
      buttons.add(_buildLinkButton("View Demo", project.demoLink!, FontAwesomeIcons.link));
    }

    if (buttons.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Project Links",
          style: GoogleFonts.outfit(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: buttons,
        ),
      ],
    );
  }

  Widget _buildLinkButton(String label, String url, IconData icon) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white10,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Colors.white10),
        ),
      ),
      icon: FaIcon(icon, size: 14, color: AppColors.textSecondary),
      label: Text(label, style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w500)),
      onPressed: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
    );
  }

  Widget _buildPlaceholder(String name) {
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
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: bgColor.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: bgColor.withValues(alpha: 0.5)),
      ),
      child: Text(
        initials,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: bgColor,
        ),
      ),
    );
  }
}
