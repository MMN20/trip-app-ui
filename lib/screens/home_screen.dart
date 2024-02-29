import 'package:flutter/material.dart';
import 'package:my_trip_app_ui/models/place.dart';
import 'package:my_trip_app_ui/widgets/my_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final places = Place.getAllPlaces();

    return Scaffold(
      body: PageView(
        children: [
          ...List.generate(places.length, (index) {
            Place place = places[index];
            return MyPage(
                place: place, index: index + 1, totalPlaces: places.length);
          })
        ],
      ),
    );
  }
}
