import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'components/profile_menu_tile.dart';
import 'components/profilepic_tile.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Bir şeyler ters gitti');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> user =
                  document.data() as Map<String, dynamic>;
              return Column(
                children: [
                  const ProfilePic(),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileTile(
                        text: 'Name: ${user['first name']}',
                        iconImage: "assets/account/name.png",
                        onPressed: () {},
                      ),
                      ProfileTile(
                        text: 'Last Name: ${user['last name']}',
                        iconImage: "assets/account/name.png",
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileTile(
                        text: 'Age: ${user['age']}',
                        iconImage: "assets/account/cake.png",
                        onPressed: () {},
                      ),
                      ProfileTile(
                        text: 'Email: ${user['email']}',
                        iconImage: "assets/account/mail.png",
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ProfileTile(
                        text: 'Boy: ${user['age']}',
                        iconImage: "assets/account/cake.png",
                        onPressed: () {},
                      ),
                      ProfileTile(
                        text: 'Kilo: ${user['email']}',
                        iconImage: "assets/account/mail.png",
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
