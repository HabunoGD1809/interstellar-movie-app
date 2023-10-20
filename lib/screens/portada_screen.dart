import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PortadaScreen extends StatefulWidget {
  static const routeName = '/portada';

  @override
  _PortadaScreenState createState() => _PortadaScreenState();
}

class _PortadaScreenState extends State<PortadaScreen> {
  final List<String> imagenes = [
    'assets/images/carousel/1.jpeg',
    'assets/images/carousel/2.jpeg',
    'assets/images/carousel/3.jpg',
    'assets/images/carousel/4.png',
    'assets/images/carousel/5.jpg',
    'assets/images/carousel/6.jpg',
    'assets/images/carousel/7.jpg',
    'assets/images/carousel/8.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
        ),
        items: imagenes.map((imagen) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(imagen),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}