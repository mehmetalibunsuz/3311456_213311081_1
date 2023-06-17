import 'package:flutter/material.dart';
import 'package:health/components/constants.dart';
import 'package:health/pages/bmi/calculator_page.dart';
import 'package:health/pages/fitness/fitness_page.dart';
import 'package:health/pages/stopWatch.dart';
import '../../waterReminder/water_page.dart';
import 'components/mid_comp.dart';
import 'components/run_card.dart';
import 'tabBar/tabBar.dart';

class AnaEkran extends StatelessWidget {
  const AnaEkran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                MyTabBar(),
                const SizedBox(height: 15),
                const RunCard(),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MidComp(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FitPage(),
                        ));
                      },
                      image: 'assets/fitness/anaEkran.jpg',
                      text: 'LET\'S ACHIEVE\nYOUR DESIRED BODY SHAPE',
                    ),
                    MidComp(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CalculatorScreen(),
                          ));
                        },
                        image: 'assets/fitness/bmi.jpg',
                        text: 'CAL\nCU\nLA\nTE\nBMI'),
                  ],
                ),
                Stack(
                  children: [
                    Image.asset(
                      'assets/steps/womans.png',
                      height: 210,
                      width: 900,
                      alignment: const Alignment(1, -25),
                    ),
                    Positioned(
                      left: 50,
                      top: 30,
                      child: Column(
                        children: [
                          const Text(
                            'START A RUN!',
                            style: kLabelTextStyle,
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Watch(),
                              ));
                            },
                            child: Container(
                                width: 95,
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [Colors.purple, Colors.blue])),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 30,
                                      color: Colors.black.withOpacity(0.7),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 30,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_right,
                                      size: 30,
                                      color: Colors.black.withOpacity(0.4),
                                    ),
                                  ],
                                )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
