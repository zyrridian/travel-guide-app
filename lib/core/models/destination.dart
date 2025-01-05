class Destination {
  final String name;
  final String location;
  final String imageUrl;
  final double rating;

  Destination({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.rating,
  });

  // Convert JSON to Destination object
  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      name: json['name'],
      location: json['location'],
      imageUrl: json['imageUrl'],
      rating: json['rating'],
    );
  }
}
