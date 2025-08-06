import 'package:flutter/material.dart';
import 'package:flutter_portfolio_application/connect.dart';
import 'package:flutter_portfolio_application/profile.dart';
import 'package:flutter_portfolio_application/projects.dart';
import 'package:flutter_portfolio_application/tech_journey.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "S'Tech Portfolio",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        scaffoldBackgroundColor: const Color.fromARGB(255, 1, 54, 145),
      ),
      routes: {
        '/': (context) => const HomePage(),
        '/tech_journey': (context) => const TechJourney(),
        '/profile': (context) => const Profile(),
        '/projects': (context) => const Projects(),
        '/connect': (context) => const Connect(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
          final screenWidth = constraints.maxWidth;
          final padding = screenWidth < 600 ? 16.0 : 80.0;

          return Padding(
            padding: EdgeInsets.all(padding),
            child: Flex(
              direction: isPortrait ? Axis.vertical : Axis.horizontal,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome! To My World of Creativity',
                          style: TextStyle(
                            fontSize: isPortrait ? 28 : 40,
                            color: Colors.cyan,
                            shadows: [
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                                color: Colors.lightBlue,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'SHAMMAH AGYARE',
                          style: TextStyle(
                            fontSize: isPortrait ? 35 : 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                            shadows: [
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                                color: Colors.lightBlue,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Consulting Analyst | Environmental Researcher | UI/UX Designer | Product Developer',
                            style: TextStyle(
                              fontSize: isPortrait ? 16 : 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 1.0,
                                  color: Colors.white24,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            'Passionate about making sustainable impacts worldwide through technology, design and systems thinking. Proficient in SQL, Python, Excel, STATA, Power BI, Tableau, Cloud Computing, GIS, HTML, Flutter, Django, Figma, MIS & CRM systems. Looking for a BI Analyst who can transform your "UGH-OH!" INTO WOW-AHA!',
                            style: TextStyle(
                              fontSize: isPortrait ? 13 : 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "LET'S CONNECT TO UNLOCK THIS MYSTERY!",
                            style: TextStyle(
                              fontSize: isPortrait ? 13 : 15,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 3.0,
                                  color: Colors.white10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: [
                            IconButton(onPressed: () => _launchURL('https://github.com/aqualinqs/aqualinqs'), icon: Image.asset('assets/icons/github.png', width: 40, height: 40)),
                            IconButton(onPressed: () => _launchURL('https://linkedin.com/in/shammah-agyare'), icon: Image.asset('assets/icons/linkedin.png', width: 30, height: 30)),
                            IconButton(onPressed: () => _launchURL('https://wa.me/233558457631'), icon: Image.asset('assets/icons/whatsApp.png', width: 30, height: 30)),
                            IconButton(onPressed: () => _launchURL('https://www.instagram.com/ms.shammah/'), icon: Image.asset('assets/icons/insta.png', width: 30, height: 30)),
                            IconButton(onPressed: () => _launchURL('https://mail.google.com/mail/?view=cm&to=agyareshammah@gmail.com&su=[Type subject]&body=[Type message here and send]'), icon: Image.asset('assets/icons/message2.png', width: 30, height: 30)),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "OR FIRST EXPLORE FOR MORE!",
                            style: TextStyle(
                              fontSize: isPortrait ? 13 : 15,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 3.0,
                                  color: Colors.white10,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              icon: const Icon(Icons.keyboard_arrow_down_rounded,
                                color: Colors.white,
                                size: 40,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/');
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if (!isPortrait)
                  const ProfileImage(),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          child: const Text(
            "S'Tech Portfolio",
            style: TextStyle(
              shadows: [
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 3.0,
                  color: Colors.blueGrey,
                ),
              ],
              fontSize: 20,
              color: Colors.blueAccent,
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/tech_journey');
            },
            child: const Text('Tech Journey', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/projects');
            },
            child: const Text('Projects', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: const Text('Profile', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/connect');
            },
            child: const Text('Connect', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
          ),
        ),
      ],
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.cyanAccent,
        borderRadius: BorderRadius.circular(150),
        boxShadow: [
          BoxShadow(
            color: Colors.cyan,
            spreadRadius: 1.0,
            blurRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(150),
        child: Image.asset(
          'assets/images/profilepic.jpg',
          height: 350,
          width: 270,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

