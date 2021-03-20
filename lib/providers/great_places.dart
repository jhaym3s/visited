import 'dart:io';
import 'package:flutter/cupertino.dart';
import '../models/places_model.dart';

class GreatPlaces with ChangeNotifier{

  List<Places> _places = [];

  List<Places> get places {
    return [..._places];
  }

  void addPlaces(String title, File image){
    final newPlaces =  Places(image: image, title: title, location: null, id: DateTime.now().toString());
    _places.add(newPlaces);
    notifyListeners();
  }
}

