import 'package:audio_inspect/dashboard/artists_screen.dart';
import 'package:audio_inspect/dashboard/channel_screen.dart';
import 'package:audio_inspect/dashboard/profile_screen.dart';
import 'package:audio_inspect/dashboard/report_screen.dart';
import 'package:audio_inspect/dashboard/songs_screen.dart';
import 'package:audio_inspect/dashboard/register_screen.dart';

import 'package:flutter/material.dart';

class MainMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: 'times new roman')),
        backgroundColor: Color.fromARGB(255, 39, 140, 223),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/background1.jpeg"), // make sure this image is in your assets folder
            fit: BoxFit.cover,
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2, // Adjust the number of grid items
          crossAxisSpacing: 20, // Adjust the space between the grid items
          mainAxisSpacing: 20,
          childAspectRatio:
              (1 / 0.8), // Adjust the aspect ratio of the grid items
          padding: EdgeInsets.all(50.0), // Add some padding around the grid
          children: List.generate(6, (index) {
            // Assuming you have an array of menu items
            String title = [
              "Register",
              "Reports",
              "Channels",
              "Artists",
              "Songs",
              "Profile"
            ][index];
            IconData icon = [
              Icons.app_registration,
              Icons.report,
              Icons.radio,
              Icons.audiotrack,
              Icons.library_music,
              Icons.person
            ][index];
            Widget screen = [
              RegistrationScreen(),
              ReportsScreen(),
              ChannelScreen(),
              ArtistsScreen(),
              SongsScreen(),
              ProfileScreen()
            ][index];
            return MenuItemBox(
                icon: icon,
                title: title,
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => screen)));
          }),
        ),
      ),
    );
  }
}

class MenuItemBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MenuItemBox({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1, // changes position of shadow
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Color.fromARGB(255, 13, 14, 14),
            ),
            SizedBox(height: 15),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// // main_menu_screen.dart
// import 'package:dashboard/artists_screen.dart';
// import 'package:dashboard/menu_item.dart';
// import 'package:dashboard/profile_screen.dart';
// import 'package:dashboard/songs_screen.dart';
// import 'package:dashboard/utils_screen.dart';
// import 'package:flutter/material.dart';
// import 'register_screen.dart';
// import 'package:dashboard/report_screen.dart';
// import 'package:dashboard/channel_screen.dart';

// class MainMenuScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Menu',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//                 fontStyle: FontStyle.italic,
//                 fontFamily: 'times new roman')),
//         backgroundColor: Color.fromARGB(255, 39, 140, 223),
//         iconTheme: IconThemeData(color: Colors.white),
//       ),
//       extendBodyBehindAppBar: true, // Extend the body behind the AppBar
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage(
//                 "/Users/chamudi/Desktop/dashboard/dashboard/assets/backgroundImage.png"), // Put the path to your background image here
//             fit: BoxFit.cover, // Cover the entire screen
//           ),
//         ),
//         child: Center(
//           // Center the list on the screen
//           child: ConstrainedBox(
//             // Constrain the width of the column
//             constraints: BoxConstraints(
//                 maxWidth: 200), // Set a max width for larger screens
//             child: SingleChildScrollView(
//               // Allow the column to scroll if necessary
//               child: Column(
//                 mainAxisAlignment:
//                     MainAxisAlignment.center, // Center the items vertically
//                 children: <Widget>[
//                   MenuItem(
//                     icon: Icons.app_registration,
//                     title: 'Register',
//                     onTap: () => navigateTo(context, RegisterScreen()),
//                   ),
//                   MenuItem(
//                     icon: Icons.report,
//                     title: 'Reports',
//                     onTap: () => navigateTo(context, ReportsScreen()),
//                   ),

//                   MenuItem(
//                     icon: Icons.tv,
//                     title: 'Channels',
//                     onTap: () => navigateTo(context, ChannelsScreen()),
//                   ),
//                   MenuItem(
//                     icon: Icons.person,
//                     title: 'Artists',
//                     onTap: () => navigateTo(context, ArtistsScreen()),
//                   ),
//                   MenuItem(
//                     icon: Icons.music_note,
//                     title: 'Songs',
//                     onTap: () => navigateTo(context, SongsScreen()),
//                   ),
//                   MenuItem(
//                     icon: Icons.account_circle,
//                     title: 'Profile',
//                     onTap: () => navigateTo(context, ProfileScreen()),
//                   ),
//                   // MenuItem(
//                   //   icon: Icons.build,
//                   //   title: 'Utils',
//                   //   onTap: () => navigateTo(context, UtilsScreen()),
//                   // ),
//                   // ... Repeat for other items
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void navigateTo(BuildContext context, Widget screen) {
//     Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
//   }
// }
