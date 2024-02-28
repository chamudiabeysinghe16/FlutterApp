import 'package:flutter/material.dart';
import 'package:audio_inspect/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      backgroundColor: const Color.fromARGB(255, 158, 211, 254),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 160,
                child: Image.asset('assets/logo2.png',
                    fit: BoxFit.contain, scale: 0.5),
              ),
              Text(
                'Welcome to Audio Inspect',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15), // Remove the extra positional argument
              Text(
                "Ensure your copyright ownership",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ActionChip(
                label: Text("Logout"),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
