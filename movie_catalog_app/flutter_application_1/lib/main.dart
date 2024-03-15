import 'package:flutter_application_1/DuneDetailsPage.dart';
import 'package:flutter_application_1/OppenheimerDetailsPage.dart';

import 'menu-drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      debugShowCheckedModeBanner: false,
      home: Material(
        // Wrap Scaffold in Material widget
        color: Colors.blue, // Set background color of Material widget to blue
        child: Scaffold(
          appBar: AppBar(
            title: Text('TOP IMDB MOVIES'),
            backgroundColor: Color.fromARGB(255, 201, 235, 67),
            actions: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Icon(Icons.video_file),
              )
            ],
          ),
          drawer: MenuDrawer(),
          backgroundColor: Color.fromARGB(255, 236, 237, 183),
          bottomNavigationBar: Theme(
            data: ThemeData(
              canvasColor: Color.fromARGB(255, 199, 219,
                  48), // Set background color of the navigation bar items
            ),
            child: BottomNavigationBar(
              backgroundColor: Color.fromARGB(255, 8, 8,
                  8), // Set background color of the bottom navigation bar
              selectedItemColor: Colors.black, // Set color of the selected item
              unselectedItemColor:
                  Colors.black, // Set color of the unselected items
              selectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold), // TextStyle for selected label
              unselectedLabelStyle: TextStyle(
                  fontWeight:
                      FontWeight.normal), // TextStyle for unselected labels
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.airline_seat_flat), label: 'Action'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Romance'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.stadium), label: 'Horror'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.house), label: 'Family Drama'),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      MovieBox(
                        title: 'Oppenheimer',
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYagvTRBy5IJFmQ-Tze_mZWlddGZ2N05Y-shukmZReXqa2yZ9IR17NSZs9n-jxzEZVmYg&usqp=CAU',
                      ),
                      MovieBox(
                        title: 'Dune 2',
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT761-OaAm-_6z4_dwOYxlmNPm98P8IDeuJbkFXZ8z9xg47WngQ0OK0xxhSlyx3ZUGkxs0&usqp=CAU',
                      ),
                      MovieBox(
                        title: 'Interstellar',
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVg3BafuuOyGxrpe9jR5VCCLU92tl4O9xt_lO31yV4V8IwQWUgXk1G4htGk7wXRdws2o8&usqp=CAU',
                      ),
                      MovieBox(
                        title: 'Moon Knight',
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQd7lSwJNaV1lp6gZKoI-b0jYtOwTLq9_ZRuQA6qNpI9UIdM9XWCt3hdHiJaQuMmhnfmfg&usqp=CAU',
                      ),
                      MovieBox(
                        title: 'Kung Fu Panda',
                        image:
                            'https://images.augustman.com/wp-content/uploads/sites/6/2023/12/13161517/kung-fu-panda-4.jpeg',
                      ),
                      MovieBox(
                        title: 'KGF 2',
                        image:
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSAlT252GFGkOV9SDi2X6p-7X6oRes2qT7u-9jUHJ3nBZstw6selbGtfhP7qdZ3G2Ab14&usqp=CAU',
                      ),
                    ],
                  ),
                  const Text(
                    'Get some Popcorn and',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black, // Set text color to black
                      fontWeight: FontWeight.bold, // Make text bold
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Select a movie to binge !!!',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black, // Set text color to black
                      fontWeight: FontWeight.bold, // Make text bold
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MovieBox extends StatelessWidget {
  final String title;
  final String image;

  const MovieBox({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the movie details page based on the title
        if (title == 'Oppenheimer') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OppenheimerDetailsPage(
                      title: title,
                      imageUrl: image, // Pass the image URL to the detail page
                    )),
          );
        } else if (title == 'Dune 2') {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DuneDetailsPage(
                      title: title,
                      imageUrl: image, // Pass the image URL to the detail page
                    )),
          );
        }
      },
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 103.3,
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(image))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
