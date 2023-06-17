import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health/components/tabBar.dart';
import 'package:health/pages/profile/components/textBox.dart';
import 'package:health/components/constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  Future<void> editField(String filed) async {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(currentUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>;
              return ListView(
                children: [
                  const MyTabBarIcon(
                      text: 'PROFILE', image: 'assets/exerciseNavBar/user.png'),
                  Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.grey.shade600,
                  ),
                  Text(
                    currentUser.email!,
                    textAlign: TextAlign.center,
                    style: kLabelTextStyle,
                  ),
                  const SizedBox(height: 40),
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Text(
                      'My Details',
                      style: kLabelTextStyle,
                    ),
                  ),
                  MyTextBox(
                    text: userData['username'],
                    sectionName: 'username',
                    onPressed: () => editField('username'),
                  ),
                  MyTextBox(
                    text: userData['firstname'],
                    sectionName: 'firstname',
                    onPressed: () => editField('username'),
                  ),
                  MyTextBox(
                    text: userData['lastname'],
                    sectionName: 'lastname',
                    onPressed: () => editField('username'),
                  ),
                  MyTextBox(
                    text: userData['age'].toString(),
                    sectionName: 'age',
                    onPressed: () => editField('bio'),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error${snapshot.error}'),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
