// upload_song_screen.dart
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class UploadSongScreen extends StatefulWidget {
  @override
  _UploadSongScreenState createState() => _UploadSongScreenState();
}

class _UploadSongScreenState extends State<UploadSongScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController musicianController = TextEditingController();
  String? selectedFilePath;

  Future<void> pickSongFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'wav'], // Specify the file types here
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedFilePath = result.files.single.path;
      });
    }
  }

  void registerSong() {
    // Here you might send the song details to a server or a local database
    // For demonstration purposes, we will just pop the screen
    if (selectedFilePath != null &&
        titleController.text.isNotEmpty &&
        authorController.text.isNotEmpty &&
        musicianController.text.isNotEmpty) {
      // You would typically handle the upload here
      // For now, let's just pop back to the previous screen
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Song'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ElevatedButton(
              onPressed: pickSongFile,
              child: Text('Browse File'),
            ),
            SizedBox(height: 8),
            Text(selectedFilePath ?? 'No file selected'),
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: authorController,
              decoration: InputDecoration(labelText: 'Author'),
            ),
            TextField(
              controller: musicianController,
              decoration: InputDecoration(labelText: 'Musician'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: registerSong,
              child: Text('Register Song'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';

// class UploadSongScreen extends StatefulWidget {
//   @override
//   _UploadSongScreenState createState() => _UploadSongScreenState();
// }

// class _UploadSongScreenState extends State<UploadSongScreen> {
//   TextEditingController titleController = TextEditingController();
//   TextEditingController authorController = TextEditingController();
//   TextEditingController musicianController = TextEditingController();
//   String? selectedFilePath;

//   Future<void> pickSongFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['mp3', 'wav'], // Specify file types here
//     );

//     if (result != null && result.files.single.path != null) {
//       setState(() {
//         selectedFilePath = result.files.single.path!;
//       });
//     } else {
//       // User canceled the picker or something went wrong
//     }
//   }

//   Future<void> registerSong() async {
//     // TODO: Implement the logic to send data and the selected file to your server.
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Radio Monitoring System'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: pickSongFile,
//               child: Text('Browse File'),
//             ),
//             Text(selectedFilePath ?? 'No file selected'),
//             TextField(
//               controller: titleController,
//               decoration: InputDecoration(labelText: 'Title'),
//             ),
//             TextField(
//               controller: authorController,
//               decoration: InputDecoration(labelText: 'Author'),
//             ),
//             TextField(
//               controller: musicianController,
//               decoration: InputDecoration(labelText: 'Musician'),
//             ),
//             ElevatedButton(
//               onPressed: registerSong,
//               child: Text('Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(home: UploadSongScreen()));
// }
