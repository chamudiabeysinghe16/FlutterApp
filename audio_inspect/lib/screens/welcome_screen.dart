import 'package:audio_inspect/screens/login_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/background1.jpeg'), // replace with your asset image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(flex: 2),
            Text(
              'Music\ncan change\nthe world',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                "Protecting the music industry's artwork is essential to preserving its soul. Artists deserve to be paid for their creativity, just like everyone else.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 37, 35, 35).withOpacity(0.7),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate to the LoginScreen when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Get Started'),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 40, 125, 185), // Background color
                onPrimary: Color.fromARGB(255, 240, 232, 232), // Text color
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                elevation: 5, // The elevation for the button
                shape: RoundedRectangleBorder(
                  // The shape of the button
                  borderRadius:
                      BorderRadius.circular(30), // Circular border radius
                ),
                shadowColor: Colors.black
                    .withOpacity(0.25), // Shadow color with some transparency
              ),
            ),
            Spacer(flex: 2),
            // Add other widgets for pagination dots if needed
          ],
        ),
      ),
    );
  }
}
