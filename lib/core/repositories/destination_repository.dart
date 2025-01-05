import 'package:travel_guide_app/core/models/destination.dart';

class DestinationRepository {
  Future<List<Destination>> fetchDestinations() async {
    // Simulating network call
    await Future.delayed(Duration(seconds: 2));

    // Example list of destinations
    return [
      Destination(
        name: 'Eiffel Tower',
        location: 'Paris, France',
        imageUrl: 'https://example.com/eiffel.jpg',
        rating: 4.9,
      ),
      Destination(
        name: 'Bondi Beach',
        location: 'Sydney, Australia',
        imageUrl: 'https://example.com/bondi.jpg',
        rating: 4.7,
      ),
    ];
  }
}
