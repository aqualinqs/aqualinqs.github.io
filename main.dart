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
        '/tech_journey': (context) => TechJourney(),
        '/profile': (context) => Profile(),
        '/projects': (context) => Projects(),
        '/connect': (context) => Connect(),
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
          final screenSize = MediaQuery.of(context).size;
          final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

          final fontSizeMultiplier = screenSize.width / 400;

          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.05,
              vertical: screenSize.height * 0.05,
            ),
            child: Flex(
              direction: isPortrait ? Axis.vertical : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome! To My World of Creativity',
                        style: TextStyle(
                          fontSize: 20 * fontSizeMultiplier,
                          color: Colors.cyan,
                          shadows: [
                            const Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Colors.lightBlue,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.01),
                      Text(
                        'SHAMMAH AGYARE',
                        style: TextStyle(
                          fontSize: 26 * fontSizeMultiplier,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan,
                          shadows: [
                            const Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Colors.lightBlue,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                      Text(
                        'Consulting Analyst | Environmental Researcher | UI/UX Designer | Product Developer',
                        style: TextStyle(
                          fontSize: 14 * fontSizeMultiplier,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            const Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 1.0,
                              color: Colors.white24,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                      Text(
                        'Passionate about making sustainable impacts worldwide through technology, design and systems thinking. '
                        'Proficient in SQL, Python, Excel, STATA, Power BI, Tableau, Cloud Computing, GIS, HTML, Flutter, Django, Figma, MIS & CRM systems. '
                        'Looking for a BI Analyst who can transform your "UGH-OH!" INTO WOW-AHA!',
                        style: TextStyle(
                          fontSize: 12 * fontSizeMultiplier,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                      Text(
                        "LET'S CONNECT TO UNLOCK THIS MYSTERY!",
                        style: TextStyle(
                          fontSize: 14 * fontSizeMultiplier,
                          color: Colors.white,
                          shadows: [
                            const Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Colors.white10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          IconButton(
                              onPressed: () => _launchURL('https://github.com/aqualinqs/aqualinqs'),
                              icon: Image.asset('assets/icons/github.png', width: 30, height: 30)),
                          IconButton(
                              onPressed: () => _launchURL('https://linkedin.com/in/shammah-agyare'),
                              icon: Image.asset('assets/icons/linkedin.png', width: 25, height: 25)),
                          IconButton(
                              onPressed: () => _launchURL('https://wa.me/233558457631'),
                              icon: Image.asset('assets/icons/whatsApp.png', width: 25, height: 25)),
                          IconButton(
                              onPressed: () => _launchURL('https://www.instagram.com/ms.shammah/'),
                              icon: Image.asset('assets/icons/insta.png', width: 25, height: 25)),
                          IconButton(
                              onPressed: () => _launchURL(
                                  'https://mail.google.com/mail/?view=cm&to=agyareshammah@gmail.com&su=[Type subject]&body=[Type message here and send]'),
                              icon: Image.asset('assets/icons/message2.png', width: 25, height: 25)),
                        ],
                      ),
                      SizedBox(height: screenSize.height * 0.02),
                      Text(
                        "OR FIRST EXPLORE FOR MORE!",
                        style: TextStyle(
                          fontSize: 14 * fontSizeMultiplier,
                          color: Colors.white,
                          shadows: [
                            const Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Colors.white10,
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: IconButton(
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: isPortrait ? 0 : screenSize.width * 0.05, height: isPortrait ? screenSize.height * 0.05 : 0),
                const Flexible(
                  flex: 1,
                  child: ProfileImage(),
                ),
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
          onPressed: () => Navigator.pushNamed(context, '/'),
          child: const Text(
            "S'Tech Portfolio",
            style: TextStyle(
              fontSize: 20,
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
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pushNamed(context, '/tech_journey'),
            child: const Text('Tech Journey',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent))),
        TextButton(
            onPressed: () => Navigator.pushNamed(context, '/projects'),
            child: const Text('Projects',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent))),
        TextButton(
            onPressed: () => Navigator.pushNamed(context, '/profile'),
            child: const Text('Profile',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent))),
        TextButton(
            onPressed: () => Navigator.pushNamed(context, '/connect'),
            child: const Text('Connect',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent))),
      ],
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final imgSize = screenSize.width * 0.4;

    return Container(
      decoration: BoxDecoration(
        color: Colors.cyanAccent,
        borderRadius: BorderRadius.circular(150),
        boxShadow: const [
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
          height: imgSize,
          width: imgSize * 0.77,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
