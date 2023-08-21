import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                  autoPlay: true, enlargeCenterPage: true, viewportFraction: 1),
              items: [
                Image.asset("home/banner_1.png"),
                Image.asset("home/banner_2.png"),
                Image.asset("home/banner_3.png"),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "Embark on an Epic Journey into the World of Fate/Grand Order!\n Dive into the captivating universe of Fate/Grand Order (FGO) with [Your App Name]. Immerse yourself in the rich lore, iconic characters, and thrilling battles that have captured the hearts of millions worldwide. Whether you're a seasoned Master or a newcomer to the Grand Order, this app is your one-stop companion for all things FGO.",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
