
import 'package:flutter/cupertino.dart';
import '../models/places_model.dart';

class GreatPlaces with ChangeNotifier{

  List<Places> _places = [];

  List<Places> get places {
    return [..._places];
  }
}

