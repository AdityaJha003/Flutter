import 'package:flutter/material.dart';

class OppenheimerDetailsPage extends StatelessWidget {
  final String title;
  final String imageUrl; // New argument to accept the image URL

  const OppenheimerDetailsPage(
      {Key? key, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder data for movie details
    final Map<String, Map<String, String>> movieDetails = {
      'Oppenheimer': {
        'storyline':
            'Oppenheimer is a biographical drama film about the life of J. Robert Oppenheimer, the American theoretical physicist who played a key role in the development of the atomic bomb during World War II. The movie explores his work on the Manhattan Project, as well as his complex personal and professional life.',
        'characters':
            'Main Characters:\n1. J. Robert Oppenheimer\n2. Leslie Groves\n3. Edward Teller\n4. Niels Bohr\n5. Kitty Oppenheimer\n6. General Dwight D. Eisenhower\n7. Harry S. Truman\n8. Enrico Fermi\n9. Richard Feynman\n10. Klaus Fuchs',
      },
      // Add details for other movies as needed
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details'),
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        color:
            Color.fromARGB(255, 255, 255, 204), // Light yellow background color
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            // Display the image
            Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYagvTRBy5IJFmQ-Tze_mZWlddGZ2N05Y-shukmZReXqa2yZ9IR17NSZs9n-jxzEZVmYg&usqp=CAU"), // Use the provided image URL
            SizedBox(height: 20),
            Text(
              'Storyline:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              movieDetails[title]?['storyline'] ?? 'No storyline available',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Characters:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              movieDetails[title]?['characters'] ?? 'No characters available',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
