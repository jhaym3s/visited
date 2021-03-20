import 'dart:io';
import 'package:flutter/material.dart';
import '../providers/great_places.dart';
import '../widget/image_input.dart';
import 'package:provider/provider.dart';

class AddPlacesScreen extends StatefulWidget {
  static const routeName = "addPlacesScreen";
  @override
  _AddPlacesScreenState createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  File _imagePicked;
  final _titleController = TextEditingController();
  void _selectImage(File pickedImage) {
    _imagePicked = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _imagePicked == null) {
      return;
    }
    Provider.of<GreatPlaces>(context,listen: false)
        .addPlaces(_titleController.text, _imagePicked);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        labelText: "title", hintText: "Place you want to add"),
                    controller: _titleController,
                  ),
                  ImageInput(_selectImage),
                ],
              ),
            ),
          )),
          RaisedButton.icon(
            onPressed: _savePlace,
            icon: Icon(Icons.add),
            label: Text("Add Place"),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            elevation: 0,
            color: Colors.indigoAccent,
          ),
        ],
      ),
    );
  }
}
