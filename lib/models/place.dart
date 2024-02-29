// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_trip_app_ui/data/data.dart';

class Place {
  String placeName;
  int rating;
  String description;
  String imageUrl;
  Place({
    required this.placeName,
    required this.rating,
    required this.description,
    required this.imageUrl,
  });

  static List<Place> getAllPlaces() {
    List<Place> places = [];
    for (Map<String, dynamic> place in data) {
      places.add(Place(
          placeName: place['placeName'],
          rating: place['rating'],
          description: place['description'],
          imageUrl: place['imageUrl']));
    }
    return places;
  }
}
