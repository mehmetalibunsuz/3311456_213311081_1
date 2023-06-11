import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarTimeline(
        initialDate: DateTime(2023, 5, 15),
        firstDate: DateTime(2023, 5, 15),
        lastDate: DateTime(2023, 12, 31),
        onDateSelected: (date) => print(date),
        leftMargin: 20,
        monthColor: Colors.white,
        dayColor: Colors.white,
        activeDayColor: Colors.black,
        activeBackgroundDayColor: Colors.limeAccent[400],
        dotsColor: Colors.limeAccent[400]);
  }
}
