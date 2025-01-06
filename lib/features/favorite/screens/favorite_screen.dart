import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_guide_app/core/utils/popular_place_dummy.dart';
import 'package:travel_guide_app/features/home/widgets/popular_place_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Favorites',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.68,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return PopularPlaceCard(
                      image: places[index].image,
                      title: places[index].title,
                      location: places[index].location,
                      rating: places[index].rating,
                      reviews: places[index].reviews,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
