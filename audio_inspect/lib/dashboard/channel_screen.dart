import 'package:flutter/material.dart';

class ChannelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Channels',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: 'times new roman')),
        backgroundColor: Color.fromARGB(255, 39, 140, 223),
        iconTheme: IconThemeData(color: Colors.white),
        // Adjust to match your design
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChannelCard(
                imageAsset: 'assets/nethFM.png', channelName: 'Neth FM'),
            SizedBox(height: 20), // Space between the images
            ChannelCard(
                imageAsset: 'assets/deranaFM.jpeg', channelName: 'FM Derana'),
          ],
        ),
      ),
    );
  }
}

class ChannelCard extends StatelessWidget {
  final String imageAsset;
  final String channelName;

  const ChannelCard({
    Key? key,
    required this.imageAsset,
    required this.channelName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(imageAsset, width: 200, height: 200),
            Text(
              channelName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// // channels_screen.dart
// import 'package:flutter/material.dart';

// class ChannelsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Channels'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Card(
//             child: ListTile(
//               leading: SizedBox(
//                 width: 100, // Specify the width of the leading widget
//                 height: 500, // Specify the height of the leading widget
//                 child: Image.asset('dashboard/assets/deranaFM.jpeg'),
//               ),
//               title: Text('Derana FM'),
//               subtitle: Text('FM 92.2'),
//             ),
//           ),
//           Card(
//             child: ListTile(
//               leading: SizedBox(
//                 width: 56, // Specify the width of the leading widget
//                 height: 56, // Specify the height of the leading widget
//                 child: Image.asset(
//                     '/Users/chamudi/Desktop/dashboard/dashboard/assets/nethFM.png'),
//               ),
//               title: Text('Neth FM'),
//               subtitle: Text('FM 95.0'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
