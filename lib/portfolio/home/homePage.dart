import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/app_colors.dart';
import '../utils/theme_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactsKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          // Header
          _buildHeader(isMobile),

          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // Home Section
                  Container(
                    key: _homeKey,
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 20 : 100,
                      vertical: 40,
                    ),
                    child: const HeroSection(),
                  ),

                  // Projects Section
                  Container(
                    key: _projectsKey,
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 20 : 100,
                      vertical: 40,
                    ),
                    child: const WorkSection(),
                  ),

                  // Contacts Section
                  Container(
                    key: _contactsKey,
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 20 : 100,
                      vertical: 40,
                    ),
                    child: const ContactSection(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isMobile) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo/Name
          Text(
            "Erilândio Santos",
            style: TextStyle(
              fontSize: isMobile ? 18 : 24,
              fontWeight: FontWeight.bold,
              color: theme.textTheme.bodyLarge?.color,
            ),
          ),

          // Navigation Menu
          if (isMobile) _buildMobileMenu() else _buildDesktopMenu(),
        ],
      ),
    );
  }

  Widget _buildDesktopMenu() {
    return Row(
      children: [
        _buildNavItem("Home", () => _scrollToSection(_homeKey)),
        const SizedBox(width: 32),
        _buildNavItem("Projects", () => _scrollToSection(_projectsKey)),
        const SizedBox(width: 32),
        _buildNavItem("Contacts", () => _scrollToSection(_contactsKey)),
        const SizedBox(width: 32),
        _buildThemeToggle(),
      ],
    );
  }

  Widget _buildMobileMenu() {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildThemeToggle(),
        const SizedBox(width: 16),
        PopupMenuButton<String>(
          icon: Icon(Icons.menu, color: theme.textTheme.bodyLarge?.color),
          color: theme.scaffoldBackgroundColor,
          onSelected: (String value) {
            switch (value) {
              case 'Home':
                _scrollToSection(_homeKey);
                break;
              case 'Projects':
                _scrollToSection(_projectsKey);
                break;
              case 'Contacts':
                _scrollToSection(_contactsKey);
                break;
            }
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem<String>(
              value: 'Home',
              child:
                  Text('Home', style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
            ),
            PopupMenuItem<String>(
              value: 'Projects',
              child: Text('Projects',
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
            ),
            PopupMenuItem<String>(
              value: 'Contacts',
              child: Text('Contacts',
                  style: TextStyle(color: theme.textTheme.bodyLarge?.color)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildThemeToggle() {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return IconButton(
          icon: Icon(
            themeProvider.isDarkMode ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            themeProvider.toggleTheme();
          },
          tooltip:
              themeProvider.isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
        );
      },
    );
  }

  Widget _buildNavItem(String title, VoidCallback onTap) {
    return HoverableNavItem(
      title: title,
      onTap: onTap,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class HoverableNavItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const HoverableNavItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  State<HoverableNavItem> createState() => _HoverableNavItemState();
}

class _HoverableNavItemState extends State<HoverableNavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            widget.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: theme.textTheme.bodyLarge?.color,
              decoration: isHovered ? TextDecoration.underline : TextDecoration.none,
              decorationColor: Colors.redAccent,
            ),
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    final theme = Theme.of(context);

    Widget textContent = Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Olá, Eu sou o Eri,\nDesenvolvedor Flutter e FlutterFlow',
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: isMobile ? 24 : 32,
            color: theme.textTheme.bodyLarge?.color,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 20),
        Text(
          'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. '
          'Velit officia consequat duis enim velit mollit. '
          'Exercitation veniam consequat sunt nostrud amet.',
          style: TextStyle(
            fontSize: isMobile ? 14 : 16,
            height: 1.5,
            color: theme.textTheme.bodyMedium?.color,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 30),
        SizedBox(
          width: isMobile ? double.infinity : 200,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Downloading resume...',
                    style: TextStyle(color: theme.scaffoldBackgroundColor),
                  ),
                  backgroundColor: theme.textTheme.bodyLarge?.color,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.headerButton,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
            ),
            child: Text(
              'Baixar currículo',
              style: TextStyle(
                color: theme.scaffoldBackgroundColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );

    Widget imageContent = ClipRRect(
      borderRadius: BorderRadius.circular(121.5),
      child: Image.asset(
        'assets/images/img_ellipse_1.png',
        width: 243,
        height: 243,
        fit: BoxFit.cover,
      ),
    );

    if (isMobile) {
      return Column(
        children: [
          textContent,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: textContent,
        ),
        const SizedBox(width: 60),
        Expanded(
          flex: 1,
          child: imageContent,
        ),
      ],
    );
  }
}

class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      constraints: const BoxConstraints(
        minHeight: 300,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Projects',
            style: theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Here are some of my recent projects and work samples.',
            style: TextStyle(
              fontSize: 16,
              color: theme.textTheme.bodyMedium?.color,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.dividerColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'Project Showcase Area',
                style: TextStyle(color: theme.textTheme.bodyLarge?.color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      constraints: const BoxConstraints(
        minHeight: 300,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Contact Me',
            style: theme.textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.textTheme.bodyLarge?.color,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Let\'s get in touch and discuss your next project.',
            style: TextStyle(
              fontSize: 16,
              color: theme.textTheme.bodyMedium?.color,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.dividerColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'Contact Form Area',
                style: TextStyle(color: theme.textTheme.bodyLarge?.color),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
