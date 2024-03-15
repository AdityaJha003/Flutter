import 'menu-drawer.dart';
import 'package:flutter/material.dart';

class WatchlistScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Watch Later'),
          backgroundColor: Color.fromARGB(255, 219, 243, 33),
        ),
        drawer: MenuDrawer(),
        backgroundColor: Color.fromARGB(255, 236, 237, 183),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    WatchlistItem(
                      title: '3 Idiots',
                      rating: '8.4',
                      releaseDate: '2009-12-25', // Release date for 3 Idiots
                    ),
                    WatchlistItem(
                      title: 'Scar Face',
                      rating: '8.3',
                      releaseDate: '1983-12-09', // Release date for Scar Face
                    ),
                    WatchlistItem(
                      title: 'Dark Knight',
                      rating: '9.0',
                      releaseDate: '2008-07-18', // Release date for Dark Knight
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WatchlistItem extends StatelessWidget {
  final String title;
  final String rating;
  final String releaseDate;

  const WatchlistItem({
    Key? key,
    required this.title,
    required this.rating,
    required this.releaseDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Rating: $rating',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Release Date: $releaseDate',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
