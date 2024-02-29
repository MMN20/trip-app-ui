import 'package:flutter/material.dart';
import 'package:my_trip_app_ui/models/place.dart';

class MyPage extends StatelessWidget {
  const MyPage(
      {super.key,
      required this.place,
      required this.index,
      required this.totalPlaces});

  final Place place;
  final int index;
  final int totalPlaces;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('${place.imageUrl}'), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.black.withOpacity(0.9),
          Colors.black.withOpacity(0.2),
        ], begin: Alignment.bottomRight)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '$index',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 27),
                    ),
                    Text(
                      '/$totalPlaces',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${place.placeName}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      Row(
                        children: [
                          ...getTheStars(place.rating),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${place.rating}',
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Text(
                          '${place.description}',
                          style: TextStyle(
                              color: Colors.white70, fontSize: 15, height: 1.8),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'READ MORE',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getTheStars(int rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= rating; i++) {
      stars.add(const Icon(
        Icons.star,
        color: Colors.yellow,
        size: 15,
      ));
    }

    if (rating == 5) {
      return stars;
    }

    for (int i = 1; i <= 5 - rating; i++) {
      stars.add(Icon(
        Icons.star,
        size: 15,
        color: Colors.grey,
      ));
    }
    return stars;
  }
}
