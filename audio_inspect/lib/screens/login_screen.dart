import 'package:flutter/material.dart'; //provides widgets and utilities implementing Material Design.
import 'package:audio_inspect/screens/registration_screen.dart'; //importing registration screen
import 'package:audio_inspect/screens/home_screen.dart'; //importing home screen
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart'; // import the necessary package

//StatefulWidget is a widget that can change its appearance in response to user actions or other events.

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form key- helpful in validating email and pasaword
  final _formKey = GlobalKey<FormState>();

  //editing controller- allows you to read the text input by the user
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

//firebase authentication

  final FirebaseAuth _auth = FirebaseAuth.instance; // instance of FirebaseAuth

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
        autofocus:
            false, // Determines whether this field should gain focus when the widget first appears.
        controller:
            emailController, // Assigns the TextEditingController for this field.
        keyboardType: TextInputType
            .emailAddress, // Sets the keyboard type to optimize for email entry.

        //The purpose of the validator is to ensure that the user inputs a valid email address.
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your email';
          }
          //reg expression for email validation
          // If the input is empty or doesn't match the pattern defined by the regular expression (RegExp), it provides an appropriate error message.
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return 'Please enter a valid Email';
          }
          return null;
        },
        onSaved: (value) {
          emailController.text =
              value!; // Assigns the entered value to the TextEditingController.
        },
        textInputAction: TextInputAction
            .next, // Specifies the action the keyboard should take when the user presses the action button.
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus:
            false, // Determines whether this field should gain focus when the widget first appears.
        controller:
            passwordController, // Assigns the TextEditingController for this field.
        obscureText: true, // Hides the entered text.

        validator: (value) {
          RegExp regex = new RegExp(
              r'^.{6,}$'); // Ensures that the password is at least 6 characters long.
          if (value!.isEmpty) {
            return 'Password is Required';
          }
          // If the input is empty or doesn't match the pattern defined by the regular expression (RegExp), it provides an appropriate error message.
          if (!regex.hasMatch(value)) {
            return 'Enter a Valid Password with minimum 6 characters';
          }
        },
        onSaved: (value) {
          passwordController.text =
              value!; // Assigns the entered value to the TextEditingController.
        },
        textInputAction: TextInputAction
            .done, // indicates that the user has finished entering text or wishes to move to the next input field
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ));

    //login button
    final loginButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color.fromARGB(255, 68, 189, 203),
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          //calls the signIn function when the button is pressed
          signIn(emailController.text, passwordController.text);

          // Navigator.pushReplacement(
          //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    color: Colors.white,
                    child: Padding(
                        padding: const EdgeInsets.all(36.0),
                        child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 200.0,
                                  child: Image.asset(
                                    "assets/logo2.png",
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(height: 45.0),
                                emailField,
                                SizedBox(height: 25.0),
                                passwordField,
                                SizedBox(
                                  height: 35.0,
                                ),
                                loginButton,
                                SizedBox(
                                  height: 15.0,
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Don't have an account? "),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegistrationScreen()));
                                        },
                                        child: Text(
                                          "SignUp",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 18, 110, 144),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15),
                                        ),
                                      )
                                    ])
                              ],
                            )))))));
  }

  //login function
  void signIn(String email, String password) async {
    //validate the form
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: "Logged in Successfully"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen())),
              })
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
