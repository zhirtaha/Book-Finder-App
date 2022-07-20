import 'package:flutter/material.dart';

//build carousel image items
Widget buildCarouselImageItems(String carouselImage, int index) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15),
    color: Colors.grey,
    child: Image.network(
      carouselImage,
      fit: BoxFit.cover,
    ),
  );
}

//Navigate to a screen
void navigateTo(context, widget) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => widget));
}

//Navigate and remove previous screen
void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}
