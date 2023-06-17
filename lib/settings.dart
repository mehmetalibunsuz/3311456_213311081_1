import 'package:flutter/material.dart';
import 'package:health/components/tabBar.dart';
import 'package:health/deneme.dart';
import 'package:health/textBox.dart';
import 'components/constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyTabBarIcon(
                  text: 'S E T T I N G S',
                  image: 'assets/account/settings.png'),
              Icon(
                Icons.settings,
                size: 70,
                color: Colors.grey.shade600,
              ),
              Text(
                'Settings',
                textAlign: TextAlign.center,
                style: kLabelTextStyle,
              ),
              const SizedBox(height: 20),
              Text(
                'Details',
                style: kLabelTextStyle,
              ),
              SettingsTextBox(
                text: 'Türkçe',
                sectionName: 'Language',
                onPressed: () {},
              ),
              SettingsTextBox(
                text: 'Türkiye',
                sectionName: 'country',
                onPressed: () {},
              ),
              SettingsTextBox(
                text: 'Metric',
                sectionName: 'measurement unit',
                onPressed: () {},
              ),
              NotificationButton(text: 'Stop All Notifications'),
              NotificationButton(text: 'Update Notifications'),
              NotificationButton(text: 'Update Notifications'),
              NotificationButton(text: 'Update Notifications'),
            ],
          ),
        ),
      ),
    );
  }
}
