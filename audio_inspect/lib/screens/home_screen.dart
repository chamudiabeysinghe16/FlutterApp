import 'package:audio_inspect/dashboard/main_menu_screen.dart';
import 'package:audio_inspect/model/user_model.dart';
import 'package:audio_inspect/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser; // get the current user
  UserModel loggedInUser = UserModel(); // create a new user model

  @override
  void initState() {
    // get the user data from the firestore
    super.initState(); // call the super class
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) // get the user data from the firestore
            {
      // set the user data to the user model
      setState(() {
        loggedInUser = UserModel.fromMap(
            value.data()); // set the user data to the user model
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 57, 150, 204),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 118, 149, 226),
              Color.fromARGB(255, 84, 139, 198),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // CircleAvatar(
                //   backgroundColor: Colors.deepPurple.shade100,
                //   radius: 75,
                //   backgroundImage: AssetImage(
                //       "assets/logo1.jpeg"), // Replace with your asset
                // ),
                SizedBox(height: 45),
                Text(
                  "Welcome Back, ${loggedInUser.firstname}!", // Adjust according to your user model
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Your email: ${loggedInUser.email}", // Adjust according to your user model
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () => _logout(context),
                  child: Text('Logout'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 69, 136, 208),
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _navigateToMainMenu(context),
                  child: Text('Get Started'),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 69, 136, 208),
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
      (Route<dynamic> route) => false,
    );
  }

  void _navigateToMainMenu(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => MainMenuScreen()),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Welcome"),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               SizedBox(
//                 height: 150,
//                 child: Image.asset("assets/logo1.jpeg", fit: BoxFit.contain),
//               ),
//               Text(
//                 "Welcome Back",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Text(
//                   "${loggedInUser.firstname} ${loggedInUser.lastname}", // display the user name
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w500,
//                   )),
//               Text("${loggedInUser.email}", // display the user email
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w500,
//                   )),
//               SizedBox(
//                 height: 15,
//               ),
//               ActionChip(
//                   label: Text("Logout"),
//                   onPressed: () {
//                     logout(context);
//                   }),
//               ActionChip(
//                 label: Text("Get Started"),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => MainMenuScreen()),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // the logout function
//   Future<void> logout(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => LoginScreen()));
//   }
// }
