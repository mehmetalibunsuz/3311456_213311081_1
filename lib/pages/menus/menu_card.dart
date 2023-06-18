import 'package:flutter/material.dart';

class CardMenus extends StatelessWidget {
  final String title;
  final String title1;
  final String title2;
  final String title3;
  final String title4;
  final String backroundImage;
  final String littleImage;
  void Function()? onTap;
  CardMenus(
      {super.key,
      required this.title,
      required this.title1,
      required this.title2,
      required this.title3,
      required this.title4,
      required this.backroundImage,
      required this.littleImage,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: 200,
            width: 370,
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: Image.asset(
                backroundImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: 200,
            width: 370,
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                ),
                child: Image.asset(littleImage),
              ),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white, fontFamily: 'BrunoAce', fontSize: 25),
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            right: 20,
            left: 20,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context)
                            .colorScheme
                            .primaryContainer
                            .withOpacity(0.6),
                      ),
                      child: Text(
                        title1,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontFamily: 'BebasNeue',
                            fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context)
                            .colorScheme
                            .primaryContainer
                            .withOpacity(0.6),
                      ),
                      child: Text(
                        title2,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontFamily: 'BebasNeue',
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context)
                            .colorScheme
                            .primaryContainer
                            .withOpacity(0.6),
                      ),
                      child: Text(
                        title3,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontFamily: 'BebasNeue',
                            fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context)
                            .colorScheme
                            .primaryContainer
                            .withOpacity(0.6),
                      ),
                      child: Text(
                        title4,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontFamily: 'BebasNeue',
                            fontSize: 20),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
