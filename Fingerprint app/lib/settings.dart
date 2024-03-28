import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.indigo.shade800,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Settings',style: TextStyle(color: Colors.white, fontFamily: 'Caveat'),),
        backgroundColor: Colors.indigo.shade800,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildListItem(Icons.remove_circle_outline, 'Remove Ads'),
          _buildListItem(Icons.language, 'English'),
          _buildListItem(Icons.notifications_none, 'Notifications'),
          _buildListItem(Icons.star_border, 'Rate Us'),
          _buildListItem(Icons.apps, 'More Apps'),
          _buildListItem(Icons.share, 'Share This App'),
          _buildListItem(Icons.email, 'Contact Us'),
          _buildListItem(Icons.info_rounded, 'Privacy Policy'),

           GestureDetector(
        onTap: () {
           SystemNavigator.pop();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
          decoration: const BoxDecoration(
          ),
          child: Row(
            children: [
              Icon(Icons.exit_to_app, color: Theme.of(context).secondaryHeaderColor),
              const SizedBox(width: 30),
              Text(
                'Exit',
                style: const TextStyle(fontSize: 20,color: Colors.white, fontFamily: 'Caveat'),
              ),
            ],
          ),
        ),
      ),

        ],
      ),
    );
  }

  Widget _buildListItem(IconData icon, String text,) {
    return GestureDetector(
      onTap: () {

      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: const BoxDecoration(
        ),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).secondaryHeaderColor),
            const SizedBox(width: 30),
            Text(
              text,
              style: const TextStyle(fontSize: 20,color: Colors.white, fontFamily: 'Caveat'),
            ),
          ],
        ),
      ),
    );
  }
}
