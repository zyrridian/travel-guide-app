import 'package:flutter/material.dart';
import 'package:travel_guide_app/core/utils/popular_place_dummy.dart';
import 'package:travel_guide_app/features/places/widgets/place_card.dart';

class PlaceListScreen extends StatelessWidget {
  const PlaceListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Places'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.68,
          ),
          itemCount: places.length,
          itemBuilder: (context, index) {
            final place = places[index];
            return PlaceCard(
              image: place.image,
              title: place.title,
              location: place.location,
              rating: place.rating,
              reviews: place.reviews,
            );
          },
        ),
      ),
    );
  }
}
