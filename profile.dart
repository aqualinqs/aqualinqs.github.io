import 'package:flutter/material.dart';
import 'package:flutter_portfolio_application/app_bar.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: buildAppBar(context),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment:
                  isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Hi there! Meet Shammah Agyare',
                    style: TextStyle(
                      fontSize: isMobile ? 24 : 30,
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Guess What? You're interacting with the most versatile and multidisciplinary product developer & designer based in Ghana. With over 4 years of experience, I’ve engineered powerful full-stack applications and crafted meaningful user experiences for diverse sectors like health tech, climate resilience, and sustainable development.",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(height: 30),
                Text(
                  "Specializing in Flutter and Django, I merge predictive analytics, real-time dashboards, and intuitive design to build impact-driven solutions across Africa. I thrive on API integrations, data pipelines, and inclusive, accessible design principles. Sounds Interesting, right? "
                  "Come along; Let’s build tech that matters!",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(height: 40),
                Text(
                  'Education & Certifications',
                  style: TextStyle(
                    fontSize: isMobile ? 24 : 30,
                    color: Colors.lightBlueAccent,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: isMobile ? TextAlign.center : TextAlign.left,
                ),
                const SizedBox(height: 10),
                _educationBullet('MicroMasters in Data Analysis – MITx Online'),
                _educationBullet('AI Developer Certification – IBM'),
                _educationBullet('Postgrad in Project Management – UC Berkeley'),
                _educationBullet('UX Design – Google | Frontend – Microsoft'),
                _educationBullet('Data Engineering – Trestle Academy Ghana'),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _educationBullet(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("\u2022 ", style: TextStyle(fontSize: 20, color: Colors.white)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
