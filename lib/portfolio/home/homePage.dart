import 'package:flutter/material.dart';

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

    return Scaffold(
      body: Column(
        children: [
          // Custom Header/AppBar
          _buildHeader(isMobile),
          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 100,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    // Home Section
                    Container(
                      key: _homeKey,
                      child: const HeroSection(),
                    ),
                    const SizedBox(height: 80),

                    // Projects Section
                    Container(
                      key: _projectsKey,
                      child: const WorkSection(),
                    ),
                    const SizedBox(height: 80),

                    // Contacts Section
                    Container(
                      key: _contactsKey,
                      child: const ContactSection(),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 100,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
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
              color: Colors.black87,
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
      ],
    );
  }

  Widget _buildMobileMenu() {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.menu, color: Colors.black87),
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
        const PopupMenuItem<String>(
          value: 'Home',
          child: Text('Home'),
        ),
        const PopupMenuItem<String>(
          value: 'Projects',
          child: Text('Projects'),
        ),
        const PopupMenuItem<String>(
          value: 'Contacts',
          child: Text('Contacts'),
        ),
      ],
    );
  }

  Widget _buildNavItem(String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Padding(
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: isMobile ? 1 : 2,
            child: Column(
              crossAxisAlignment:
                  isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                Text(
                  'Olá, Eu sou o Eri,\nDesenvolvedor Flutter e FlutterFlow',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: isMobile ? 24 : 32,
                      ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                SizedBox(height: isMobile ? 16 : 20),
                Text(
                  'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. '
                  'Velit officia consequat duis enim velit mollit. '
                  'Exercitation veniam consequat sunt nostrud amet.',
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 16,
                    height: 1.5,
                  ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                SizedBox(height: isMobile ? 24 : 30),
                SizedBox(
                  width: isMobile ? double.infinity : null,
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Downloading resume...')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 24 : 20, vertical: isMobile ? 16 : 10),
                      minimumSize: Size(isMobile ? double.infinity : 0, 50),
                    ),
                    child: const Text(
                      'Baixar currículo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: isMobile ? 0 : 40,
            height: isMobile ? 40 : 0,
          ),
          Flexible(
            flex: isMobile ? 0 : 1,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: isMobile ? 200 : 243,
                maxHeight: isMobile ? 200 : 243,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(isMobile ? 100 : 121.5),
                child: Image.asset(
                  'assets/images/img_ellipse_1.png',
                  width: isMobile ? 200 : 243,
                  height: isMobile ? 200 : 243,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder sections for demonstration
class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Here are some of my recent projects and work samples.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          // Add your project widgets here
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text('Project Showcase Area'),
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
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Text(
            'Contact Me',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Let\'s get in touch and discuss your next project.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          // Add your contact form or information here
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text('Contact Form Area'),
            ),
          ),
        ],
      ),
    );
  }
}
