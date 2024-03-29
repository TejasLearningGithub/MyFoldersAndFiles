import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselStackoverflow extends StatefulWidget {
  const CarouselStackoverflow({super.key});

  @override
  State<CarouselStackoverflow> createState() => _CarouselStackoverflowState();
}

class _CarouselStackoverflowState extends State<CarouselStackoverflow> {
  List list = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  final CarouselController _carouselController = CarouselController();
  var _currentCarouselPage = 0;
  bool? _dotIndicator;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CarouselSlider.builder(
              itemCount: list.length,
              carouselController: _carouselController,
              itemBuilder: (context, index, realIndex) {
                return SizedBox(
                  // height: 10,
                  //width: 275,
                  //color: list[index],

                  child: Column(
                    children: [
                      SizedBox(
                        height: 118,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25), // Image border

                        child: Image.network(
                          list[index],
                          width: 265,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                disableCenter: false,
                //enlargeFactor: 15.0,
                aspectRatio: 1,
                autoPlay: true,
                viewportFraction: 0.7,
                //enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentCarouselPage = index;
                  });
                },
                autoPlayInterval: const Duration(seconds: 3),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: list.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _carouselController.animateToPage(entry.key),
                  child: Container(
                    width: 10,
                    height: 10,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        //color: (Colors.green).withOpacity(0.4),
                        color: _currentCarouselPage == entry.key
                            ? Colors.red
                            : Colors.amber),
                    child: _currentCarouselPage == entry.key
                        ? Text("$_currentCarouselPage/${list.length}")
                        : null,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
