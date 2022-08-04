import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_book_finder/src/components/components.dart';
import 'package:my_book_finder/src/styles/colors/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final carouselImages = [
    'assets/images/book cover1.jpeg',
    'assets/images/book cover2.jpeg',
    'assets/images/book cover3.jpeg',
    'assets/images/book cover4.jpeg'
  ];

  int activeIndex = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              'My Book Finder',
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              'Find Your Favorite Book',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Stack(children: [
                CarouselSlider.builder(
                  carouselController: carouselController,
                  itemCount: carouselImages.length,
                  options: CarouselOptions(
                      height: 360,
                      enlargeCenterPage: true,
                      onPageChanged: ((index, reason) {
                        setState(() {
                          activeIndex = index;
                        });
                      })),
                  itemBuilder: ((context, index, realIndex) {
                    final carouselImage = carouselImages[index];
                    return buildCarouselImageItems(carouselImage, index);
                  }),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      setState(() {     
                      carouselController.previousPage();
                      });
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: secondaryColor,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                      carouselController.nextPage();
                      });
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ]),
            ),
            AnimatedSmoothIndicator(
                effect: WormEffect(activeDotColor: secondaryColor),
                activeIndex: activeIndex,
                count: carouselImages.length)
          ],
        ),
      ),
    );
  }
}
