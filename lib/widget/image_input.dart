import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storageImage;
 Future<void> takePicture()async{
    final picker = ImagePicker();
    PickedFile imageFile = await picker.getImage(source: ImageSource.camera,maxWidth: 600);
    setState(() {
      if (imageFile != null) {
        _storageImage = File(imageFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 150,height: 150,
            decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey)),
            child: _storageImage != null ?
            Image.file(_storageImage, fit: BoxFit.cover,width: double.infinity,height: double.infinity,) :Text("What's up"),
            alignment: Alignment.center,
          ),
        ),
        Expanded(child: FlatButton.icon(onPressed: takePicture, icon: Icon(Icons.camera_alt),label:
        Text("Camera"),color: Theme.of(context).primaryColor,))
      ],
    );
  }
}
