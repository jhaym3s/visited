import 'package:flutter/material.dart';
import '../providers/great_places.dart';
import '../screens/add_places_screen.dart';
import 'package:provider/provider.dart';

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
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlacesScreen.routeName);
              }),
        ],
      ),
       body: Consumer<GreatPlaces>(
        child: const Center(child:
        Text("Share pictures of places you have been to"),),
        builder: (context, greatPlaces, child) => greatPlaces.places.isEmpty
            ? child
            : ListView.builder(
          itemCount: greatPlaces.places.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(greatPlaces.places[index].image),
                  ),
                  title: Text(greatPlaces.places[index].title) ,
                  onTap: (){},
                ),),
      ),
      backgroundColor: Colors.white,
    );
  }
}
