import 'package:flutter/material.dart';

class DuneDetailsPage extends StatelessWidget {
  final String title;
  final String imageUrl; // New argument to accept the image URL

  const DuneDetailsPage({Key? key, required this.title, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Placeholder data for movie details
    final Map<String, Map<String, String>> movieDetails = {
      'Dune 2': {
        'storyline':
            'Dune 2 is a science fiction film based on the second half of the novel "Dune" by Frank Herbert. The movie continues the story of Paul Atreides and his journey as he seeks to reclaim his family\'s place on the desert planet Arrakis. It explores themes of politics, religion, and environmentalism in a futuristic setting.',
        'characters':
            'Main Characters:\n1. Paul Atreides\n2. Lady Jessica\n3. Duncan Idaho\n4. Leto Atreides II\n5. Stilgar\n6. Chani\n7. Alia Atreides\n8. Gurney Halleck\n9. Baron Vladimir Harkonnen\n10. Emperor Shaddam IV',
      },
      // Add details for other movies as needed
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details'),
        backgroundColor: Colors.yellow,
      ),
      body: Container(
        color: Color.fromARGB(255, 255, 255, 204), // Light yellow background color
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
            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT761-OaAm-_6z4_dwOYxlmNPm98P8IDeuJbkFXZ8z9xg47WngQ0OK0xxhSlyx3ZUGkxs0&usqp=CAU"), // Use the provided image URL
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
