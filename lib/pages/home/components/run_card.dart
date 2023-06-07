import 'package:flutter/material.dart';
import 'package:health/components/constants.dart';
import 'package:health/statistics/statistics.dart';

class RunCard extends StatelessWidget {
  const RunCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Statistics(),
        ));
      },
      child: Stack(children: [
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width * 1.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            'assets/login/intro.jpg',
            width: MediaQuery.of(context).size.width * 1.0,
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.limeAccent[400]),
              child: Icon(
                Icons.run_circle,
                size: 50,
                color: Colors.black,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'RECENT ACTIVITY',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontFamily: 'BrunoAce'),
                    ),
                    Image.asset(
                      'assets/steps/fire.png',
                      height: 20,
                    )
                  ],
                ),
                const Text(
                  'Yesterday :2342 step',
                  style: kLabelTextStyle,
                ),
              ],
            )
          ],
        ),
        Positioned(
          top: 90,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Total Steps',
                style: kLabelTextStyle,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/steps/running.png',
                    height: 50,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    randomStep().toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: 'BrunoAce'),
                  ),
                  const Text(
                    'step',
                    style: kLabelTextStyle,
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
