import 'package:flutter/material.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'menu_card.dart';

class Menus extends StatefulWidget {
  const Menus({super.key});

  @override
  State<Menus> createState() => _MenusState();
}

class _MenusState extends State<Menus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) => print(date),
              leftMargin: 20,
              monthColor: Colors.blueGrey,
              dayColor: Colors.teal[200],
              activeDayColor: Colors.white,
              activeBackgroundDayColor: Color.fromARGB(255, 195, 132, 255),
              dotsColor: Color(0xFF333A47),
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en_ISO',
            ),
            const CardMenus(
              backroundImage: 'assets/login/sleep.png',
              littleImage: 'assets/login/moon.png',
              title: 'SLEEP TRACKING',
              title1: 'Sleep Time : 22:00',
              title2: 'Sleep Duration : 7h30min',
              title3: 'Wake up Time : 07:00',
              title4: 'One Daydream',
            ),
            const CardMenus(
              backroundImage: 'assets/login/waterback.png',
              littleImage: 'assets/login/littlewater.png',
              title: 'Water Reminder',
              title1: 'daily goal : 2000 ml',
              title2: 'Consumed Today : 1400 ml',
              title3: 'Remaining : 600 ml',
              title4: 'One Daydream',
            ),
            const CardMenus(
              backroundImage: 'assets/login/sleep.png',
              littleImage: 'assets/login/moon.png',
              title: 'SLEEP TRACKING',
              title1: 'Sleep Time : 22:00',
              title2: 'Sleep Duration : 7h30min',
              title3: 'Wake up Time : 07:00',
              title4: 'One Daydream',
            ),
          ],
        ),
      ),
    );
  }
}
