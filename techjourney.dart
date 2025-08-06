import 'package:flutter/material.dart';
import 'package:flutter_portfolio_application/app_bar.dart';

class TechJourney extends StatelessWidget {
  const TechJourney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: buildAppBar(context),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurpleAccent),
              child: Text(
                "Navigation",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            _drawerItem(context, '/tech_journey', 'Tech Journey'),
            _drawerItem(context, '/projects', 'Projects'),
            _drawerItem(context, '/profile', 'Profile'),
            _drawerItem(context, '/connect', 'Connect'),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          bool isMobile = screenWidth < 600;
          double titleFontSize = isMobile ? 22 : 30;
          double bodyFontSize = isMobile ? 14 : 16;
          double sectionPadding = isMobile ? 8 : 16;

          return SingleChildScrollView(
            padding: EdgeInsets.all(sectionPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'MY JOURNEY INTO TECH SPACE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Growing up as a child, it has always been my earnest desire to solve mysteries and complex problems breaking them down into bits and bytes to address their root causes, mitigating future problems. "
                  "I've always loved crunching numbers and finding the missing link to every puzzle. This passion led me into the tech ecosystem.",
                  style: TextStyle(fontSize: bodyFontSize, color: Colors.white),
                ),
                const SizedBox(height: 20),
                Text(
                  "Today I transform businesses, improve livelihoods and contribute to environmental sustainability all with the power of Data. With 4+ years of tech experience I have sharpened and shaped my application of cutting-edge tools (including Python, SQL, Flutter, HTML, Figma, Power BI, Tableau, AWS, Firebase, Google Analytics, GCP, SAP ERP, among others) across various domains - Agriculture, Health, WASH, Manufacturing Industry, Finance, Energy & Environmental Resources Management.",
                  style: TextStyle(fontSize: bodyFontSize, color: Colors.white),
                ),
                const SizedBox(height: 30),
                Text(
                  "Curious? Travel with me into the Tech Space and explore how my diverse background meets your data needs.",
                  style: TextStyle(fontSize: bodyFontSize, color: Colors.white),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Professional Experience',
                    style: TextStyle(
                      fontSize: titleFontSize,
                      color: Colors.lightBlueAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _experienceSection(
                  context,
                  title: 'Backend Developer & BI Analyst - Aqualinqs Digital Agency (Consultant)',
                  duration: '09/2022 - 04/2025',
                  achievements: [
                    'Built 10+ Flutter-based apps including EcoMine Watch and DeafCan Talk.',
                    'Improved deployment speed by 35% and reporting systems by 20% using SQL, Python, and Figma.',
                  ],
                  fontSize: bodyFontSize,
                ),
                _experienceSection(
                  context,
                  title: 'Data Scientist & Product Designer - Best Sight Opticals Limited',
                  duration: '08/2023 - 07/2024',
                  achievements: [
                    'Led CRM & predictive analytics model (with 85% accuracy), resulting in a 20% reduction in customer attrition.',
                    'Managed 30+ API integrations, enhancing data flow across 20 applications.',
                    'Built a CRM dashboard with Firebase and Flutter improving retention by 40%',
                  ],
                  fontSize: bodyFontSize,
                ),
                _experienceSection(
                  context,
                  title: 'Chief Data Specialist/M&E Advisor - Agriculture & Climate Empowerment Centre',
                  duration: '09/2021 - 06/2023',
                  achievements: [
                    'Designed and implemented a Data Governance & Project Monitoring System for a USAID 500K USD bio-energy project in Sierra Leone — achieving 100% KPI compliance.',
                    'Applied NLP techniques to analyze survey data, improving climate justice policy recommendations by 30%',
                    'Analyzed and managed 200+ datasets, built coastal resources management dashboards with Power BI, Tableau, R & SQL, influencing coastal policy and environmental justice reforms in Ghana and Sierra Leone',
                  ],
                  fontSize: bodyFontSize,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _experienceSection(
    BuildContext context, {
    required String title,
    required String duration,
    required List<String> achievements,
    required double fontSize,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: fontSize + 4,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            duration,
            style: TextStyle(fontSize: fontSize, color: Colors.white),
          ),
          const SizedBox(height: 8),
          ...achievements.map((ach) => _achievementBullet(ach, fontSize)),
        ],
      ),
    );
  }

  Widget _achievementBullet(String text, double fontSize) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("\u2022 ", style: TextStyle(fontSize: 20)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: fontSize, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(BuildContext context, String route, String label) {
    return ListTile(
      title: Text(label),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
