import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'artists_screen.dart'; // Ensure you have this file in your project.

// Assuming you have a global list for registered artists somewhere in your app.
List<Artist> registeredArtists = [];

class Artist {
  String name;
  String details;

  Artist({required this.name, required this.details});
}

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController detailsController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController singerController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController musicianController = TextEditingController();
  String? selectedFilePath;

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'mp3',
        'wav',
        'flac',
        'aac'
      ], // Specify any file types you want to allow
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        selectedFilePath = result.files.single.path;
      });
    }
  }

  void registerArtist() {
    // Validate form inputs and then create a new Artist instance
    Artist newArtist = Artist(
      name: nameController.text, // nameController is a TextEditingController
      details: detailsController
          .text, // detailsController is a TextEditingController
    );

    // Add to a global list (this could instead be a database save operation)
    registeredArtists.add(newArtist);

    // Possibly notify the user
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Artist registered successfully!')));

    // Then navigate to the ArtistsScreen if you want to show the updated list
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => ArtistsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register Song',
          style: TextStyle(
            color: Colors.white, // Text color
            fontSize: 24.0, // Font size
            fontWeight: FontWeight.bold, // Font weight
            fontStyle: FontStyle.italic, // Font style
            fontFamily: 'times new roman', // Font family
          ),
        ),
        backgroundColor: Colors.blue,
      ),

      // If you want the AppBar to be transparent, uncomment the following line
      // backgroundColor: Colors.transparent,
      // elevation: 0, // Removes shadow

      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/background1.jpeg', // Replace with your background image asset
            fit: BoxFit.cover, // Cover the entire widget bounds
          ),
          SingleChildScrollView(
            // return Scaffold(
            //   appBar: AppBar(
            //     title: Text(
            //       'Register Song',
            //       style: TextStyle(
            //         color: Colors.white, // Text color
            //         fontSize: 24.0, // Font size
            //         fontWeight: FontWeight.bold, // Font weight
            //         fontStyle: FontStyle.italic, // Font style
            //         fontFamily: 'times new roman', // Font family
            //       ),
            //     ),
            //     backgroundColor: Colors.blue,
            //   ),
            //   body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                  onPressed: pickFile,
                  child: Text('Browse File'),
                ),
                SizedBox(height: 10),
                Text(selectedFilePath ?? 'No file selected'),
                SizedBox(height: 16),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    hintText: 'Title of the song',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    prefixIcon: Icon(
                      Icons.music_note,
                      color: Colors.blueAccent,
                    ),
                    suffixIcon: titleController.text.isEmpty
                        ? Container(width: 0)
                        : IconButton(
                            icon: Icon(Icons.clear, color: Colors.blueAccent),
                            onPressed: () {
                              titleController
                                  .clear(); // Clear the text field content
                            },
                          ),
                  ),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: singerController,
                  decoration: InputDecoration(
                    labelText: 'Singer',
                    hintText: "Singer's Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.deepPurple,
                    ),
                    suffixIcon: singerController.text.isEmpty
                        ? Container(width: 0)
                        : IconButton(
                            icon: Icon(Icons.clear, color: Colors.deepPurple),
                            onPressed: () {
                              singerController
                                  .clear(); // Clear the text field content
                            },
                          ),
                  ),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: authorController,
                  decoration: InputDecoration(
                    labelText: 'Author',
                    hintText: 'Author of the song',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelStyle: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    prefixIcon: Icon(
                      Icons.create,
                      color: Colors.blueAccent,
                    ),
                    suffixIcon: authorController.text.isEmpty
                        ? Container(width: 0)
                        : IconButton(
                            icon: Icon(Icons.clear, color: Colors.blueAccent),
                            onPressed: () {
                              authorController
                                  .clear(); // Clear the text field content
                            },
                          ),
                  ),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: musicianController,
                  decoration: InputDecoration(
                    labelText: 'Musician',
                    hintText: 'Musician of the song',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors
                        .white, // Choose a light color for the fill for better contrast
                    labelStyle: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                    prefixIcon: Icon(
                      Icons.create,
                      color: Colors.blueAccent,
                    ),
                    suffixIcon: authorController.text.isEmpty
                        ? Container(width: 0)
                        : IconButton(
                            icon: Icon(Icons.clear, color: Colors.blueAccent),
                            onPressed: () {
                              authorController
                                  .clear(); // Clear the text field content
                            },
                          ),
                  ),
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: registerArtist,
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 18, // Increase the font size
                      fontWeight: FontWeight.bold, // Make the text bold
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent, // Button background color
                    onPrimary: Colors.white, // Button text (and icon) color
                    shadowColor: Colors.blueAccent.shade100, // Shadow color
                    elevation: 10, // Shadow depth
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 32, vertical: 12), // Button padding
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register Artist'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(
//                 labelText: 'Artist Name',
//               ),
//             ),
//             TextField(
//               controller: detailsController,
//               decoration: InputDecoration(
//                 labelText: 'Details',
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: registerArtist,
//               child: Text('Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:dashboard/artists_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'artists_registry.dart';

// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController authorController = TextEditingController();
//   final TextEditingController musicianController = TextEditingController();
//   String? selectedFilePath;

//   void pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: [
//         'mp3',
//         'wav',
//         'flac',
//         'aac'
//       ], // Specify any file types you want to allow
//     );

//     if (result != null && result.files.single.path != null) {
//       setState(() {
//         selectedFilePath = result.files.single.path;
//       });
//     }
//   }

 


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Register Song',
//           style: TextStyle(
//             color: Colors.white, // Text color
//             fontSize: 24.0, // Font size
//             fontWeight: FontWeight.bold, // Font weight
//             fontStyle: FontStyle.italic, // Font style
//             fontFamily: 'times new roman', // Font family
//           ),
//         ),
//         backgroundColor: Colors.blue,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             ElevatedButton(
//               onPressed: pickFile,
//               child: Text('Browse File'),
//             ),
//             SizedBox(height: 8),
//             Text(selectedFilePath ?? 'No file selected'),
//             TextField(
//               controller: titleController,
//               decoration: InputDecoration(labelText: 'Title'),
//             ),
//             TextField(
//               controller: titleController,
//               decoration: InputDecoration(labelText: 'Singer'),
//             ),
//             TextField(
//               controller: authorController,
//               decoration: InputDecoration(labelText: 'Author'),
//             ),
//             TextField(
//               controller: musicianController,
//               decoration: InputDecoration(labelText: 'Musician'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: registerArtist,
//               child: Text('Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }






// // register_screen.dart
// import 'package:flutter/material.dart';
// import 'artists_registry.dart'; // Import the artists registry

// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController authorController = TextEditingController();
//   final TextEditingController musicianController = TextEditingController();
//   String? selectedFilePath;

//   void registerArtist() {
//     final artist = Artist(
//       title: titleController.text,
//       author: authorController.text,
//       musician: musicianController.text,
//     );
//     setState(() {
//       registeredArtists.add(artist);
//       titleController.clear();
//       authorController.clear();
//       musicianController.clear();
//       selectedFilePath = null; // Reset the file path
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register Artist'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 // Placeholder action to 'select' a file
//                 setState(() {
//                   selectedFilePath = 'dummy_song.mp3';
//                 });
//               },
//               child: Text('Browse File'),
//             ),
//             SizedBox(height: 8),
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
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: registerArtist,
//               child: Text('Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// register_screen.dart
// import 'package:dashboard/artists_registry.dart';
// import 'package:flutter/material.dart';
// import 'artists_registry.dart';

// class RegisterScreen extends StatefulWidget {
//   @override
//   _RegisterScreenState createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController artistController = TextEditingController();

//   void registerArtist() {
//     if (artistController.text.isNotEmpty) {
//       setState(() {
//         registeredArtists.add(artistController.text);
//         artistController.clear();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register Artist'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: artistController,
//               decoration: InputDecoration(
//                 labelText: 'Artist Name',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.clear),
//                   onPressed: () {
//                     artistController.clear();
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: registerArtist,
//               child: Text('Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// // register_screen.dart
// import 'package:flutter/material.dart';
// import 'artists_database.dart'; // Import the mock database

// class RegisterScreen extends StatelessWidget {
//   final TextEditingController artistController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Register Artist')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             TextField(
//               controller: artistController,
//               decoration: InputDecoration(labelText: 'Artist Name'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (artistController.text.isNotEmpty) {
//                   // Add the artist to the global list
//                   registeredArtists.add(artistController.text);
//                   artistController.clear(); // Clear the text field
//                 }
//               },
//               child: Text('Register'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// // register_screen.dart
// import 'package:flutter/material.dart';
// import 'upload_song_screen.dart';

// class RegisterScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Radio Broadcast Monitoring System'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => UploadSongScreen()),
//                 );
//               },
//               child: Text('Upload'),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue,
//                 onPrimary: Colors.white,
//                 padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context); // Go back to the previous screen
//               },
//               child: Text('Log Out'),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue,
//                 onPrimary: Colors.white,
//                 padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
