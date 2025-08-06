import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  final isMobile = MediaQuery.of(context).size.width < 600;

  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.deepPurpleAccent,
    title: TextButton(
      onPressed: () => Navigator.pushNamed(context, '/'),
      child: Text(
        "S'Tech Portfolio",
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.blueAccent,
          shadows: [
            Shadow(
              offset: Offset(1.0, 1.0),
              blurRadius: 3.0,
              color: Colors.blueGrey,
            ),
          ],
        ),
      ),
    ),
    actions: isMobile
        ? [
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
              ),
            ),
          ]
        : _buildNavButtons(context),
  );
}

// Add this widget to the main Scaffold where AppBar is used (especially in homepage, profile, etc.)
Drawer buildAppDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: Colors.deepPurpleAccent,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(color: Colors.deepPurple),
          child: Center(
            child: Text(
              'Navigation',
              style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        _drawerItem(context, 'Home', '/'),
        _drawerItem(context, 'Tech Journey', '/tech_journey'),
        _drawerItem(context, 'Projects', '/projects'),
        _drawerItem(context, 'Profile', '/profile'),
        _drawerItem(context, 'Connect', '/connect'),
      ],
    ),
  );
}

List<Widget> _buildNavButtons(BuildContext context) {
  return [
    _navButton(context, 'Tech Journey', '/tech_journey'),
    _navButton(context, 'Projects', '/projects'),
    _navButton(context, 'Profile', '/profile'),
    _navButton(context, 'Connect', '/connect'),
  ];
}

Widget _navButton(BuildContext context, String label, String route) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: TextButton(
      onPressed: () => Navigator.pushNamed(context, route),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.lightBlueAccent,
        ),
      ),
    ),
  );
}

Widget _drawerItem(BuildContext context, String label, String route) {
  return ListTile(
    title: Text(label, style: const TextStyle(color: Colors.white)),
    onTap: () {
      Navigator.pop(context); // close the drawer
      Navigator.pushNamed(context, route);
    },
  );
}
