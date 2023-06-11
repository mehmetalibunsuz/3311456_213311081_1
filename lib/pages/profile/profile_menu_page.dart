import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health/components/constants.dart';
import 'package:health/pages/profile/nofitications.dart';
import 'package:share_plus/share_plus.dart';
import 'account.dart';
import 'components/profile_menu_tile.dart';
import 'components/profilepic_tile.dart';
import '../../feedback/feedback.dart';

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
                      builder: (context) => ProfilePage(),
                    ));
                  },
                ),
                ProfileTile(
                  text: "Notifications",
                  iconImage: "assets/account/notification.png",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Notifications(),
                    ));
                  },
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
                  iconImage: "assets/account/help.png",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FeedbackScreen(),
                    ));
                  },
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileTile(
                  text: "share app",
                  iconImage: "assets/account/share.png",
                  onPressed: () {
                    Share.share('com.example.health');
                  },
                ),
                ProfileTile(
                  text: "Log out",
                  iconImage: "assets/account/logout.png",
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    GoogleSignIn().signOut();
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
