import 'package:flutter/material.dart';
import 'package:places_and_cities/widget/image_input.dart';

class AddPlacesScreen extends StatefulWidget {
  static const routeName = "addPlacesScreen";
  @override
  _AddPlacesScreenState createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  final _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
         Expanded(child:
         SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: [
         TextField(
             decoration: InputDecoration(
               labelText: "title",
               hintText: "Place you want to add"
             ),
             controller: _titleController,
         ),
                 ImageInput(),
               ],
             ),
           ),
         )),
          RaisedButton.icon(
              onPressed: (){}, icon: Icon(Icons.add), label: Text("Add"),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            elevation: 0,
            color: Colors.indigoAccent,
          ),
        ],
      ),
    );
  }
}
