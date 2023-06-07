import 'package:flutter/material.dart';
import 'package:health/pages/home/home.dart';
import 'package:health/pages/nutrition/nutrition.dart';
import 'package:health/pages/profile/profile_menu_page.dart';
import 'package:health/pages/toDo/toDo_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _controller = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (int index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            children: [
              const AnaEkran(),
              Nutrition(),
              const ToDoPage(),
              const ProfileMenu(),
            ],
          ),
          Positioned(
            bottom: 10,
            left: 20,
            right: 20,
            child: Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipOval(
                    child: Material(
                      color: Theme.of(context).colorScheme.primary,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _currentPageIndex = 0;
                          });
                          _controller.jumpToPage(0);
                        },
                        icon: Image.asset(
                          "assets/exerciseNavBar/home.png",
                          width: 30,
                          height: 30,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Material(
                      color: Theme.of(context).colorScheme.primary,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _currentPageIndex = 1;
                          });
                          _controller.jumpToPage(1);
                        },
                        icon: Image.asset(
                          "assets/exerciseNavBar/Calories.png",
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Material(
                      color: Theme.of(context).colorScheme.primary,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _currentPageIndex = 2;
                          });
                          _controller.jumpToPage(2);
                        },
                        icon: Image.asset(
                          "assets/exerciseNavBar/hamburger.png",
                          width: 30,
                          height: 30,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                  ClipOval(
                    child: Material(
                      color: Theme.of(context).colorScheme.primary,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _currentPageIndex = 3;
                          });
                          _controller.jumpToPage(3);
                        },
                        icon: Image.asset(
                          "assets/exerciseNavBar/user.png",
                          width: 30,
                          height: 30,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
