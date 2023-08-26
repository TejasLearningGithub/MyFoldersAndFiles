import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ExImageirst extends StatefulWidget {
  const   ExImageirst({super.key});

  @override
  State<ExImageirst> createState() => _ExImageirstState();
}

class _ExImageirstState extends State<ExImageirst> {
  File? _imageFile;
  bool _isUploading = false;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    setState(() {
      _isUploading =
          true; // Show progress indicator immediately after picking image
    });

    // Simulating a delay to show progress indicator while image picker dialog is open
    await Future.delayed(Duration(seconds: 2));

    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        _imageFile = File(pickedFile.path);
        _isUploading =
            false; // Hide progress indicator after image is processed
      });
    } else {
      setState(() {
        _isUploading =
            false; // Hide progress indicator if image picker is canceled
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upload Example Second'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: _imageFile != null
                      ? ClipOval(
                          child: Image.file(
                            _imageFile!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Icon(
                          Icons.person,
                          size: 100,
                          color: Colors.grey,
                        ),
                ),
                SizedBox(height: 20),
                _isUploading
                    ? Positioned(
                        top: 50,
                        left: 55,
                        child:
                            CircularProgressIndicator()) // Show circular progress indicator while uploading
                    : Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.blue,
                              width: 2,
                            )),
                        child: IconButton(
                            onPressed: _pickImage, icon: Icon(Icons.edit)),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
