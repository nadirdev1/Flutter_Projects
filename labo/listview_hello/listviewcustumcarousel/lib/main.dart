import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListWithCarousel(),
    );
  }
}

class ListWithCarousel extends StatelessWidget {
  final List<String> items = List.generate(10, (index) => 'Article $index');
  final List<String> carouselImages = [
    'https://via.placeholder.com/400x200?text=Promo+1',
    'https://via.placeholder.com/400x200?text=Promo+2',
    'https://via.placeholder.com/400x200?text=Promo+3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste avec Carousel'),
      ),
      body: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            if (index == 3) {
              // Insérer un carousel après le 3ème article
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: CarouselSlider(
                  items: carouselImages.map((image) {
                    return Image.network(
                      image,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: false,
                    enlargeCenterPage: true,
                  ),
                ),
              );
            }

            // Afficher un article
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: Icon(Icons.article),
                title: Text(items[index]),
                subtitle: Text('Détails de ${items[index]}'),
              ),
            );
          },
          childCount: items.length, // Nombre total d'éléments
        ),
      ),
    );
  }
}