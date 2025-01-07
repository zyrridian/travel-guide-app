import 'package:flutter/material.dart';
import 'package:travel_guide_app/core/utils/popular_place_dummy.dart';
import 'package:travel_guide_app/features/home/widgets/banner_card.dart';
import 'package:travel_guide_app/features/places/screens/place_list_screen.dart';
import 'package:travel_guide_app/features/places/widgets/place_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showNotification = false;

  void toggleNotification() {
    setState(() {
      _showNotification = !_showNotification;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 8),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orangeAccent,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Good Morning',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Nunito',
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              'Hello, John!',
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: toggleNotification,
                        icon: Icon(Icons.notifications_outlined),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search_outlined),
                        SizedBox(width: 8),
                        Text(
                          'Search here...',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Chip(
                          label: Text('Mountains'),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(width: 8),
                        Chip(
                          label: Text('Beaches'),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(width: 8),
                        Chip(
                          label: Text('Historical Buildings'),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(width: 8),
                        Chip(
                          label: Text('Park'),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Popular Places',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlaceListScreen(),
                          ),
                        ),
                        child: Text(
                          'view all',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w300,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 269,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: PlaceCard(
                            image: places[index].image,
                            title: places[index].title,
                            location: places[index].location,
                            rating: places[index].rating,
                            reviews: places[index].reviews,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 16),
                  BannerCard(),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
          if (_showNotification)
            Positioned(
              top: 60,
              right: 16,
              child: Container(
                width: 250,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey,
                    width: 0.5,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Icon(Icons.message, color: Colors.blue),
                      title: Text('New Message'),
                      subtitle: Text('You have a new message!'),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.update, color: Colors.green),
                      title: Text('System Update'),
                      subtitle: Text('Your system is up to date.'),
                    ),
                    SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _showNotification = false;
                        });
                      },
                      child: Text(
                        'Close',
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
