import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:health/components/constants.dart';

class SuIcmeyiHatirlatici extends StatefulWidget {
  const SuIcmeyiHatirlatici({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SuIcmeyiHatirlaticiState createState() => _SuIcmeyiHatirlaticiState();
}

class _SuIcmeyiHatirlaticiState extends State<SuIcmeyiHatirlatici> {
  final int _dailyGoal = 3000; // Günlük su ihtiyacı
  int _currentAmount = 0; // İçilen su miktarı
  double _percent = 0.0; // İçilen su miktarının yüzdesi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 23, 23),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 25,
                    )),
                const Text(
                  'Back',
                  style: kLabelTextStyle,
                )
              ],
            ),
            CircularPercentIndicator(
              radius: 170,
              lineWidth: 30,
              progressColor: Colors.blue,
              backgroundColor: Colors.blueGrey.shade800,
              circularStrokeCap: CircularStrokeCap.round,
              percent: _percent,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'the amount of water you drink',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    '$_currentAmount ml',
                    style: const TextStyle(
                        fontFamily: 'BebasNeue',
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10.0),
                  const Text(
                    'the amount of water you should drink daily',
                    style: TextStyle(
                        fontSize: 17.0,
                        fontFamily: 'BebasNeue',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    '$_dailyGoal ml',
                    style: const TextStyle(
                        fontFamily: 'BebasNeue',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                //copywith değer değişirken aynı özellikleri kopyalar
                activeTrackColor: Colors.blue,
                overlayColor: Colors.blue,
                inactiveTrackColor: Colors.blueGrey.shade800,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 13),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 20),
                thumbColor: Colors.blue,
                trackHeight: 25,
              ),
              child: Slider(
                value: _currentAmount.toDouble(),
                min: 0.0,
                max: _dailyGoal.toDouble(),
                divisions: _dailyGoal ~/ 100,
                onChanged: (double value) {
                  setState(() {
                    _currentAmount = value.toInt();
                    _percent = _currentAmount / _dailyGoal;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${_currentAmount.toDouble()} ml',
              style: const TextStyle(
                  fontFamily: 'BebasNeue',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: LottieBuilder.network(
                'https://assets5.lottiefiles.com/packages/lf20_F5A6if.json',
                height: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
