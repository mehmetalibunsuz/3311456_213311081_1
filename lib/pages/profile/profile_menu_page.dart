import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health/components/constants.dart';
import 'package:health/pages/login/login_page.dart';
import 'account_page.dart';
import 'components/profile_menu_tile.dart';
import 'components/profilepic_tile.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const ProfilePic(),
            const SizedBox(height: 10),
            Text(
              user.email!,
              style: kLabelTextStyle,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileTile(
                  text: "My Account",
                  iconImage: "assets/exerciseNavBar/user.png",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AccountPage(),
                    ));
                  },
                ),
                ProfileTile(
                  text: "Notifications",
                  iconImage: "assets/account/notification.png",
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileTile(
                  text: "Settings",
                  iconImage: "assets/account/settings.png",
                  onPressed: () {},
                ),
                ProfileTile(
                  text: "Help Center",
                  iconImage: "assets/account/settings.png",
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileTile(
                  text: "Settings",
                  iconImage: "assets/account/settings.png",
                  onPressed: () {},
                ),
                ProfileTile(
                  text: "My Account",
                  iconImage: "assets/exerciseNavBar/user.png",
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
