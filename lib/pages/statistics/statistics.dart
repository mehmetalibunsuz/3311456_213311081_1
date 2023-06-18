import 'package:flutter/material.dart';
import 'package:health/components/tabBar.dart';
import 'package:health/components/constants.dart';
import 'package:health/components/graph/graph_bar.dart';
import 'package:health/pages/statistics/components/long_containers.dart';
import 'components/short_containers.dart';

class Statistics extends StatefulWidget {
  const Statistics({super.key});

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const MyTabBarIcon(
                    text: 'STATISTICS', image: 'assets/steps/running.png'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        LongContainer(
                          title: 'Total Steps',
                          image: 'assets/steps/running.png',
                          numbers: '${randomStep()}',
                          subtitle: 'Step',
                          color: const Color.fromARGB(255, 244, 255, 90),
                          title2: 'Calories',
                          image2: 'assets/steps/fire.png',
                          numbers2: '${randomKcal()}',
                          subtitle2: 'kcal',
                        ),
                        const SizedBox(height: 2),
                        const ShortContainer(
                          color: Color.fromARGB(255, 255, 102, 31),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const ShortContainer(
                          color: Color.fromARGB(255, 176, 92, 255),
                        ),
                        const SizedBox(height: 2),
                        LongContainer(
                          title: 'Total Distance',
                          image: 'assets/steps/distance.png',
                          numbers: '3.4',
                          subtitle: 'kilometer',
                          title2: 'Heart Rate',
                          image2: 'assets/steps/heart.png',
                          numbers2: '${randomBpm()}',
                          subtitle2: 'Bpm',
                          color: const Color.fromARGB(255, 118, 248, 106),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const BarGraph(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
