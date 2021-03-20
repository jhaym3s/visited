import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/places_model.dart';
import '../helper/db_helpers.dart';

class GreatPlaces with ChangeNotifier{

  List<Places> _places = [];

  List<Places> get places {
    return [..._places];
  }

  void addPlaces(String title, File image){
    final newPlaces =  Places(image: image, title: title, location: null, id: DateTime.now().toString());
    _places.add(newPlaces);
    notifyListeners();
    DBHelper.insert("user_places",
        {"id": newPlaces.id,
          "title": newPlaces.title,
          "image": newPlaces.image.path ,
        });
  }

  Future<void> fetchData()async {
    final dataList = await  DBHelper.getData("user_places.p-");
   _places = dataList.map((items) => Places(image: File(items["image"]), title: items["title"], location: null, id: items["id"])).toList();
   notifyListeners();
  }
}

