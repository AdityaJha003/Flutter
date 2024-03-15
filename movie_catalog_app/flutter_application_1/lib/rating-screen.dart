import 'menu-drawer.dart';
import 'package:flutter/material.dart';

class RatingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Movie Ratings'),
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
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    RatingBox(
                        title: 'Oppenheimer', rating: '9/10', stars: '4.8/5.0'),
                    RatingBox(
                        title: 'Dune 2', rating: '8/10', stars: '4.0/5.0'),
                    RatingBox(
                        title: 'Interstellar',
                        rating: '10/10',
                        stars: '4.9/5.0'),
                    RatingBox(
                        title: 'Moon Knight', rating: '6/10', stars: '3.9/5.0'),
                    RatingBox(
                        title: 'Kung Fu Panda',
                        rating: '6/10',
                        stars: '4.3/5.0'),
                    RatingBox(title: 'KGF', rating: '5/10', stars: '4.5/5.0'),
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

class RatingBox extends StatelessWidget {
  final String title;
  final String rating;
  final String stars;

  const RatingBox(
      {Key? key,
      required this.title,
      required this.rating,
      required this.stars})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Color.fromARGB(255, 233, 209, 136),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Rating: $rating',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 16,
              color: Color.fromARGB(255, 10, 9, 9),
            ),
          ),
          Text(
            'Stars: $stars',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 16,
              color: const Color.fromARGB(255, 194, 66, 66),
            ),
          ),
        ],
      ),
    );
  }
}
