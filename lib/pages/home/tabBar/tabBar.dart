import 'package:flutter/material.dart';
import 'package:health/components/constants.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              maxRadius: 25,
              backgroundImage: AssetImage('assets/account/profil.jpg'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back,',
                  style: kLabelTextStyle,
                ),
                Text(
                  'MEHMET ALI BUNSUZ',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                      fontFamily: 'Bungee'),
                ),
              ],
            ),
          ],
        ),
        Image.asset(
          'assets/exerciseNavBar/anamenu.png',
          height: 35,
          color: Theme.of(context).colorScheme.primary,
        )
      ],
    );
  }
}
