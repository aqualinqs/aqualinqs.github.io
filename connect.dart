import 'package:flutter/material.dart';
import 'package:flutter_portfolio_application/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class Connect extends StatefulWidget {
  const Connect({super.key});

  @override
  State<Connect> createState() => _ConnectState();
}

class _ConnectState extends State<Connect> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Message sent successfully!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isMobile
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    _headerText(),
                    const SizedBox(height: 20),
                    _buildFormCard(isMobile),
                  ],
                ),
              )
            : Row(
                children: [
                  Expanded(child: _headerText()),
                  _buildFormCard(isMobile),
                ],
              ),
      ),
    );
  }

  Widget _headerText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'SUCCESS STORIES LOADING....',
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget _buildFormCard(bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 400,
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Colors.blueGrey,
            spreadRadius: 4.0,
            blurRadius: 10,
            offset: Offset(1.0, 1.0),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Text(
              'GET IN TOUCH',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Do you have a data need I can help you with?",
              style: TextStyle(fontSize: 15, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text("LET'S CHAT HERE"),
            const SizedBox(height: 16),

            // Name
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
            ),
            const SizedBox(height: 12),

            // Email
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) {
                if (value == null || value.isEmpty) return 'Please enter your email';
                final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                if (!regex.hasMatch(value)) return 'Enter a valid email';
                return null;
              },
            ),
            const SizedBox(height: 12),

            // Phone
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Phone Number'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 12),

            // Message
            TextFormField(
              controller: _messageController,
              decoration: const InputDecoration(labelText: 'Message'),
              maxLines: 4,
              validator: (value) => value!.isEmpty ? 'Please enter a message' : null,
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _submitForm,
              child: const Text("Send"),
            ),

            const SizedBox(height: 16),
            const Text(
              'Your DATA with my intelligence - Together we are an OCEAN',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () => _launchURL('https://github.com/aqualinqs/aqualinqs'),
                    icon: Image.asset('assets/icons/github.png', width: 40, height: 40)),
                IconButton(
                    onPressed: () => _launchURL('https://linkedin.com/in/shammah-agyare'),
                    icon: Image.asset('assets/icons/linkedin.png', width: 30, height: 30)),
                IconButton(
                    onPressed: () => _launchURL('https://wa.me/233558457631'),
                    icon: Image.asset('assets/icons/whatsApp.png', width: 30, height: 30)),
                IconButton(
                    onPressed: () => _launchURL('https://www.instagram.com/ms.shammah/'),
                    icon: Image.asset('assets/icons/insta.png', width: 30, height: 30)),
              ],
            )
          ],
        ),
      ),
    );
  }

  ListTile _drawerItem(BuildContext context, String route, String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
