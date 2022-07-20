import 'package:flutter/material.dart';
import 'package:my_book_finder/components/components.dart';
import 'package:my_book_finder/layout/main_layout.dart';
import 'package:my_book_finder/styles/colors/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel(
      {required this.image, required this.body, required this.title});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List boarding = [
    OnBoardingModel(
        image: 'assets/images/onboard 1.png',
        body: 'Find The Books You Like',
        title: 'My Book Finder'),
    OnBoardingModel(
        image: 'assets/images/onboard 2.png',
        body: 'The Collection You Will love',
        title: 'My Book Finder'),
    OnBoardingModel(
        image: 'assets/images/onboard 3.png',
        body: 'Get The Right Books',
        title: 'My Book Finder'),
  ];

  PageController pageController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  controller: pageController,
                  itemCount: boarding.length,
                  itemBuilder: (context, index) {
                    return onBoardItem(boarding[index]);
                  },
                ),
              ),
            ],
          ),
        ));
  }

  Widget onBoardItem(OnBoardingModel board) {
    return Column(
      children: [
        Image.asset(
          board.image,
          width: double.infinity,
          height: 302,
        ),
        Text(
          board.title,
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          board.body,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(
          height: 20,
        ),
        SmoothPageIndicator(
          effect: WormEffect(activeDotColor: secondaryColor),
          controller: pageController,
          count: boarding.length,
        ),
        SizedBox(
          height: 90,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                navigateAndFinish(context, MainLayout());
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FloatingActionButton(
              backgroundColor: secondaryColor,
              onPressed: () {
                if (isLast) {
                  setState(() {
                    navigateAndFinish(context, MainLayout());
                  });
                } else {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 750),
                      curve: Curves.easeInOut);
                }
              },
              child: Icon(Icons.arrow_forward),
            )
          ],
        )
      ],
    );
  }
}
