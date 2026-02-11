import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/data/portfolio_data.dart';
import 'package:portfolio/widgets/project_card.dart';
import 'package:portfolio/sections/contact_section.dart';
import 'package:portfolio/sections/experience_section.dart';
import 'package:portfolio/sections/home_section.dart';
import 'package:portfolio/sections/projects_section.dart';
import 'package:portfolio/sections/skills_section.dart';
import 'package:portfolio/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ahmed El Banna | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          brightness: Brightness.dark,
          surface: AppColors.surface,
          background: AppColors.background,
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final projectsKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  bool _showBackToTopButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _showBackToTopButton = _scrollController.offset >= 400;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToProjects() {
    if (projectsKey.currentContext != null) {
      Scrollable.ensureVisible(
        projectsKey.currentContext!,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 800;
    
    // Project Grid Layout
    int crossAxisCount = screenWidth > 1500 ? 4 : screenWidth > 1100 ? 3 : screenWidth > 800 ? 2 : 1;
    double aspectRatio = crossAxisCount == 1 ? 1.8 : 1.3;
    if (screenWidth < 500) aspectRatio = 1.3;

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: HomeSection(onViewProjects: _scrollToProjects),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          const SliverToBoxAdapter(child: Divider(color: Colors.white10, height: 1)),
          
          // Experience Header
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 40,
                vertical: isMobile ? 40 : 80,
              ).copyWith(bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Experience", style: AppTextStyles.header)
                      .animate().fadeIn(duration: 800.ms).moveX(begin: -20, duration: 800.ms),
                  const SizedBox(height: 12),
                  Text("My professional journey and career milestones.", style: AppTextStyles.body)
                      .animate().fadeIn(delay: 300.ms, duration: 800.ms),
                ],
              ),
            ),
          ),
          
          // Experience List
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 40),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final experience = PortfolioData.experiences[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 32.0),
                    child: RepaintBoundary(
                      child: ExperienceCard(experience: experience, isMobile: isMobile)
                          .animate()
                          .fadeIn(duration: 800.ms, curve: Curves.easeOutQuad)
                          .slideX(begin: 0.1, end: 0, duration: 800.ms, curve: Curves.easeOutQuad),
                    ),
                  );
                },
                childCount: PortfolioData.experiences.length,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          const SliverToBoxAdapter(child: Divider(color: Colors.white10, height: 1)),

          // Projects Header
          SliverToBoxAdapter(
            key: projectsKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 40,
                vertical: isMobile ? 40 : 80, // Reduced top padding not needed here 
              ).copyWith(bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Top Projects", style: AppTextStyles.header)
                      .animate().fadeIn(duration: 800.ms).moveX(begin: -20, duration: 800.ms),
                  const SizedBox(height: 16),
                  Text("Some of the key projects I've worked on.", style: AppTextStyles.body)
                      .animate().fadeIn(delay: 300.ms, duration: 800.ms),
                ],
              ),
            ),
          ),

          // Projects Grid
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 40),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: aspectRatio,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return RepaintBoundary(
                    child: ProjectCard(project: PortfolioData.projects[index])
                        .animate()
                        .fadeIn(duration: 800.ms, curve: Curves.easeOutQuad)
                        .slideY(begin: 0.1, end: 0, duration: 800.ms, curve: Curves.easeOutQuad),
                  );
                },
                childCount: PortfolioData.projects.length,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 60)), // Extra space
          const SliverToBoxAdapter(child: Divider(color: Colors.white10, height: 1)),
          
          const SliverToBoxAdapter(child: SkillsSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 30)),
          const SliverToBoxAdapter(child: Divider(color: Colors.white10, height: 1)),
          const SliverToBoxAdapter(child: ContactSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 50)),
        ],
      ),
      floatingActionButton: _showBackToTopButton
          ? FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: AppColors.primary,
              child: const Icon(Icons.arrow_upward, color: Colors.white),
            )
          : null,
    );
  }
}
