import 'package:flutter/material.dart';

// Assuming you have a model like this
class Artist {
  final String title;
  final String singer;
  final String author;
  final String musician;

  Artist({
    required this.title,
    required this.singer,
    required this.author,
    required this.musician,
  });
}

// Dummy list to simulate registered artists.
// This would typically be a state management or database solution.
List<Artist> registeredArtists = [
  // Add some dummy data
  Artist(
    title: 'Song Title 1',
    singer: 'Singer 1',
    author: 'Author 1',
    musician: 'Musician 1',
  ),
  Artist(
    title: 'Song Title 2',
    singer: 'Singer 2',
    author: 'Author 2',
    musician: 'Musician 2',
  ),
];

class ArtistsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registered Artists',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: 'times new roman')),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: registeredArtists.length,
        itemBuilder: (context, index) {
          final artist = registeredArtists[index];
          return Card(
            child: ListTile(
              title: Text(artist.title),
              subtitle: Text(
                  'Singer: ${artist.singer}\nAuthor: ${artist.author}\nMusician: ${artist.musician}'),
            ),
          );
        },
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'artists_registry.dart'; // This should contain the registeredArtists list.

// class ArtistsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registered Artists'),
//       ),
//       body: ListView.builder(
//         itemCount: registeredArtists.length,
//         itemBuilder: (context, index) {
//           final artist = registeredArtists[index];
//           return ListTile(
//             leading: Icon(Icons.person), // or any other icon or image widget
//             title: Text(artist.name),
//             subtitle: Text(artist.details), // Additional artist details if any
//             onTap: () {
//               // Action when you tap on the artist. Could be navigation to a detail page or anything else.
//             },
//           );
//         },
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'artists_registry.dart'; // Assuming this contains the global list `registeredArtists`

// class ArtistsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registered Artists'),
//       ),
//       body: ListView.builder(
//         itemCount: registeredArtists.length,
//         itemBuilder: (context, index) {
//           final artist = registeredArtists[index];
//           return Card(
//             child: ListTile(
//               title: Text(artist.title),
//               subtitle: Text(
//                   'Author: ${artist.author}\nMusician: ${artist.musician}'),
//               isThreeLine: true, // If subtitle has multiple lines
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


// // artists_screen.dart
// import 'package:flutter/material.dart';
// import 'artists_registry.dart'; // Import the artists registry

// class ArtistsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registered Artists'),
//       ),
//       body: ListView.builder(
//         itemCount: registeredArtists.length,
//         itemBuilder: (context, index) {
//           final artist = registeredArtists[index];
//           return ListTile(
//             title: Text(artist.title),
//             subtitle:
//                 Text('Author: ${artist.author}, Musician: ${artist.musician}'),
//           );
//         },
//       ),
//     );
//   }
// }


// // artists_screen.dart
// import 'package:flutter/material.dart';
// import 'artists_registry.dart';

// class ArtistsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registered Artists'),
//       ),
//       body: ListView.builder(
//         itemCount: registeredArtists.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(registeredArtists[index]),
//           );
//         },
//       ),
//     );
//   }
// }




// // artists_screen.dart
// import 'package:flutter/material.dart';
// import 'artists_registry.dart';

// class ArtistsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registered Artists'),
//       ),
//       body: ListView.builder(
//         itemCount: registeredArtists.length,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(registeredArtists[index]),
//           );
//         },
//       ),
//     );
//   }
// }


// // artists_screen.dart
// import 'package:flutter/material.dart';
// import 'artists_database.dart'; // Import the mock database

// class ArtistsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Registered Artists')),
//       body: ListView.builder(
//         itemCount: registeredArtists.length,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             title: Text(registeredArtists[index]),
//             // Add trailing icons or other widgets here, if necessary.
//           );
//         },
//       ),
//     );
//   }
// }
