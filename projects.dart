import 'package:flutter/material.dart';
import 'package:flutter_portfolio_application/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  int _getCrossAxisCount(double width) {
    if (width < 600) return 1;
    if (width < 900) return 2;
    return 3;
  }

  double _getChildAspectRatio(double width) {
    if (width < 600) return 1 / 1.2;
    if (width < 900) return 3 / 2.8;
    return 4 / 2.8;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = _getCrossAxisCount(screenWidth);
    final aspectRatio = _getChildAspectRatio(screenWidth);

    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: buildAppBar(context),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurpleAccent),
              child: Text("Navigation", style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            _drawerItem(context, '/tech_journey', 'Tech Journey'),
            _drawerItem(context, '/projects', 'Projects'),
            _drawerItem(context, '/profile', 'Profile'),
            _drawerItem(context, '/connect', 'Connect'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Every dataset tells a story. Let's dive into mine and discover how I transform lives with data!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              childAspectRatio: aspectRatio,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: List.generate(projects.length, (index) {
                final project = projects[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ProjectDetailPage(project: project)),
                  ),
                  child: ProjectCard(project: project),
                );
              }),
            ),
            const SizedBox(height: 20),
            const Text(
              'OTHER PROJECTS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              childAspectRatio: aspectRatio,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: List.generate(otherProjects.length, (index) {
                final project = otherProjects[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ProjectDetailPage(project: project)),
                  ),
                  child: ProjectCard(project: project),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _drawerItem(BuildContext context, String route, String title) {
  return ListTile(
    title: Text(title),
    onTap: () {
      Navigator.pop(context); // Close drawer
      Navigator.pushNamed(context, route);
    },
  );
}
