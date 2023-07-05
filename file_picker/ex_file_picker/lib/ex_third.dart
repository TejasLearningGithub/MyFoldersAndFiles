import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

class MyFilePickerHomePage extends StatefulWidget {
  const MyFilePickerHomePage({Key? key}) : super(key: key);

  @override
  State<MyFilePickerHomePage> createState() => _MyFilePickerHomePageState();
}

class _MyFilePickerHomePageState extends State<MyFilePickerHomePage> {
  String _fileText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("File Picker"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _pickFile,
                child: const Text("Pick File"),
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              //ElevatedButton(
              //  onPressed: _pickMultipleFiles,
              //  child: const Text("Pick Multiple Files"),
              // ),
              const SizedBox(
                height: 10,
              ),
              // ElevatedButton(
              //   onPressed: _pickDirectory,
              //   child: const Text("Pick Directory"),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              //  ElevatedButton(onPressed: _saveAs, child: Text("Save As"),),
              //  SizedBox(height: 10,),
              Text(_fileText),
            ],
          ),
        ),
      ),
    );
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        // allowedExtensions: ['jpg', 'pdf', 'doc'],

        );

    if (result != null && result.files.single.path != null) {
      /// Load result and file details
      PlatformFile file = result.files.first;
      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);

      /// normal file
      File _file = File(result.files.single.path!);
      setState(() {
        _fileText = _file.path;
      });
      loadSelectedFiles(result.files);
    } else {
      /// User canceled the picker
    }
  }

  void loadSelectedFiles(List<PlatformFile> files) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => FileList(files: files, onOpenedFile: viewFile)));
  }

  // open the picked file
  void viewFile(PlatformFile file) {
    OpenFile.open(file.path);
  }
}

class FileList extends StatefulWidget {
  final List<PlatformFile> files;
  final ValueChanged<PlatformFile> onOpenedFile;
  const FileList({Key? key, required this.files, required this.onOpenedFile})
      : super(key: key);
  @override
  _FileListState createState() => _FileListState();
}

class _FileListState extends State<FileList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Selected Files'),
      ),
      body: ListView.builder(
        itemCount: widget.files.length,
        itemBuilder: (context, index) {
          final file = widget.files[index];
          return buildFile(file);
        },
      ),
    );
  }

  Widget buildFile(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
    return InkWell(
      onTap: () => widget.onOpenedFile(file),
      child: ListTile(
        leading: (file.extension == 'jpg' || file.extension == 'png')
            ? Image.file(
                File(file.path.toString()),
                width: 80,
                height: 80,
              )
            : const SizedBox(
                width: 80,
                height: 80,
              ),
        title: Text(file.name),
        subtitle: Text('${file.extension}'),
        trailing: Text(
          size,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
