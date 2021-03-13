import 'dart:io';
import 'package:flutter/cupertino.dart';

class PlaceLocation{
  final double latitude,longitude;
  final String address;

  PlaceLocation({
    @required this.latitude, @required this.longitude,this.address
});

}

class Places{
  final File image;
  final PlaceLocation location;
  final String id,title;

  Places({
   @required this.image,@required this.title,@required this.location, @required this.id
});
}