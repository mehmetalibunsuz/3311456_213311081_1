import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'components/profile_menu_tile.dart';
import 'components/profilepic_tile.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      // Kullanıcı oturum açmamışsa veya kayıtlı değilse burada yönlendirme yapabilirsiniz
      return const Center(child: Text('Oturum açmış bir kullanıcı bulunamadı.'));
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Bir şeyler ters gitti');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (!snapshot.hasData || snapshot.data!.data() == null) {
            // Firestore'dan gelen veri yok veya boş ise hata mesajı gösterilebilir
            return const Text('Kullanıcı verisi bulunamadı.');
          }

          final user = snapshot.data!.data()! as Map<String, dynamic>;

          return ListView(
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
                    text: 'Boy: ${user['height']}',
                    iconImage: "assets/account/cake.png",
                    onPressed: () {},
                  ),
                  ProfileTile(
                    text: 'Kilo: ${user['weight']}',
                    iconImage: "assets/account/mail.png",
                    onPressed: () {},
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
