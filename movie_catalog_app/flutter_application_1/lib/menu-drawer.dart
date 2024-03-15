import 'package:flutter_application_1/FavoritesScreen.dart';
import 'package:flutter_application_1/WatchlistScreen.dart';

import 'basic-navigation.dart';
import 'main.dart';
import 'rating-screen.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Niklaus Mikaelson',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            accountEmail: Text('klaus@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/390089/film-movie-motion-picture-390089.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 20, color: Colors.orange),
            ),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(
              'Favorites',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FavoritesScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.movie),
            title: Text(
              'Rating',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RatingScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.watch_later),
            title: Text(
              'Watchlist',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WatchlistScreen()));
            },
          ),
        ],
      ),
    );
  }
}
