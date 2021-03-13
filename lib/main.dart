import 'package:flutter/material.dart';
import 'package:places_and_cities/screens/add_places_screen.dart';
import './screens/places_list_screen.dart';
import './providers/great_places.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GreatPlaces(),)
      ],
      child: MaterialApp(
        title: 'Places you have been to',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.white,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlacesScreen.routeName: (context)=> AddPlacesScreen(),
        },
      ),
    );
  }
}

