import 'package:flutter/material.dart';
import 'package:places_and_cities/screens/add_places_screen.dart';

class PlacesListScreen extends StatefulWidget {
  @override
  _PlacesListScreenState createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends State<PlacesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: (){
            Navigator.of(context).pushNamed(AddPlacesScreen.routeName);
          }),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
