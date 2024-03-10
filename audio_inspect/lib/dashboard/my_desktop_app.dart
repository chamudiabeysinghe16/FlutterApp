import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class MyDesktopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DesktopFilePicker(),
    );
  }
}

class DesktopFilePicker extends StatefulWidget {
  @override
  _DesktopFilePickerState createState() => _DesktopFilePickerState();
}

class _DesktopFilePickerState extends State<DesktopFilePicker> {
  String? pickedFilePath;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        pickedFilePath = result.files.single.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Desktop File Picker Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickFile,
              child: Text('Browse File'),
            ),
            SizedBox(height: 20),
            Text(pickedFilePath ?? 'No file selected'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MyDesktopApp());
}
