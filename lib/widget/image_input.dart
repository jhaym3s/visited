import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as devicePath;

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _selectImage;
  Future _getImage() async {
    final picker = ImagePicker();
    PickedFile _imageFile = await picker.getImage(source: ImageSource.camera,maxWidth: 600 );
    setState(() {
      _selectImage = File(_imageFile.path);
    });
    final appDir = await devicePath.getApplicationDocumentsDirectory();
    final tempFileName = path.basename(_imageFile.path);
   final saveImage = await _selectImage.copy('${appDir.path}/$tempFileName');
   widget.onSelectImage(saveImage);
  }
  // File _storedImage;
  //
  // Future<void> _takePicture() async {
  //   final picker = ImagePicker();
  //   final imageFile = await picker.getImage(
  //     source: ImageSource.camera,
  //     maxWidth: 600,
  //   );
  //   if (imageFile == null) {
  //     return;
  //   }
  //   setState(() {
  //     _storedImage = File(imageFile.path);
  //   });
  //   final appDir = await devicePath.getApplicationDocumentsDirectory();
  //   final fileName = path.basename(imageFile.path);
  //   final savedImage = await _storedImage.copy('${appDir.path}/$fileName');
  //   widget.onSelectImage(savedImage);
  // }

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
            child: _selectImage != null ?
            Image.file(_selectImage, fit: BoxFit.cover,width: double.infinity,height: double.infinity,) :Text("What's up"),
            alignment: Alignment.center,
          ),
        ),
        Expanded(child: FlatButton.icon(onPressed: _getImage, icon: Icon(Icons.camera_alt),label:
        Text("Camera"),color: Theme.of(context).primaryColor,))
      ],
    );
  }
}
