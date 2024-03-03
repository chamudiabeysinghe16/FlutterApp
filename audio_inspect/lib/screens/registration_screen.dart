import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:audio_inspect/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home_screen.dart'; //provides widgets and utilities implementing Material Design.

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  //firebase authentication
  final _auth = FirebaseAuth.instance;

//form key- helpful in validating email and pasaword
  final _formKey = GlobalKey<FormState>();
  //editing controller- allows you to read the text input by the user
  final firstNameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //first name field
    final firstNameField = TextFormField(
        autofocus:
            false, // Determines whether this field should gain focus when the widget first appears.
        controller:
            firstNameEditingController, // Assigns the TextEditingController for this field.
        keyboardType: TextInputType
            .emailAddress, // Sets the keyboard type to optimize for email entry.

        validator: (value) {
          RegExp regex = new RegExp(
              r'^.{3,}$'); // Ensures that the password is at least 3 characters long.
          if (value!.isEmpty) {
            return 'First Name cannot be empty';
          }
          // If the input is empty or doesn't match the pattern defined by the regular expression (RegExp), it provides an appropriate error message.
          if (!regex.hasMatch(value)) {
            return 'Enter a valid name with minimum 3 characters';
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text =
              value!; // Assigns the entered value to the TextEditingController.
        },
        textInputAction: TextInputAction
            .next, // Specifies the action the keyboard should take when the user presses the action button.
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ));

    //last name field
    final lastNameField = TextFormField(
        autofocus:
            false, // Determines whether this field should gain focus when the widget first appears.
        controller:
            lastNameEditingController, // Assigns the TextEditingController for this field.
        keyboardType: TextInputType
            .emailAddress, // Sets the keyboard type to optimize for email entry.

        validator: (value) {
          RegExp regex = new RegExp(
              r'^.{3,}$'); // Ensures that the password is at least 3 characters long.
          if (value!.isEmpty) {
            return 'Last Name cannot be empty';
          }
          // If the input is empty or doesn't match the pattern defined by the regular expression (RegExp), it provides an appropriate error message.
          return null;
        },
        onSaved: (value) {
          lastNameEditingController.text =
              value!; // Assigns the entered value to the TextEditingController.
        },
        textInputAction: TextInputAction
            .next, // Specifies the action the keyboard should take when the user presses the action button.
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Last Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ));

    //email field
    final emailField = TextFormField(
        autofocus:
            false, // Determines whether this field should gain focus when the widget first appears.
        controller:
            emailEditingController, // Assigns the TextEditingController for this field.
        keyboardType: TextInputType
            .emailAddress, // Sets the keyboard type to optimize for email entry.

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
          emailEditingController.text =
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
            passwordEditingController, // Assigns the TextEditingController for this field.
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
          passwordEditingController.text =
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

    //confirm password field
    final confirmPasswordField = TextFormField(
        autofocus:
            false, // Determines whether this field should gain focus when the widget first appears.
        controller:
            confirmPasswordEditingController, // Assigns the TextEditingController for this field.
        obscureText: true, // Hides the entered text.

        // Ensures that the password is at least 6 characters long and matches the password entered in the password field.
        validator: (value) {
          if (confirmPasswordEditingController.text.length > 6 &&
              confirmPasswordEditingController.text != value) {
            return 'Passwords do not match';
          }
          return null;
        },
        onSaved: (value) {
          confirmPasswordEditingController.text =
              value!; // Assigns the entered value to the TextEditingController.
        },
        textInputAction: TextInputAction
            .done, // indicates that the user has finished entering text or wishes to move to the next input field
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
        ));

    //register button
    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.red,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          signUp(
            emailEditingController.text,
            passwordEditingController.text,
          );
        },
        child: Text("Register",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 155.0,
                    child: Image.asset(
                      "assets/logo2.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 45.0),
                  firstNameField,
                  SizedBox(height: 25.0),
                  lastNameField,
                  SizedBox(height: 25.0),
                  emailField,
                  SizedBox(height: 25.0),
                  passwordField,
                  SizedBox(height: 25.0),
                  confirmPasswordField,
                  SizedBox(
                    height: 35.0,
                  ),
                  registerButton,
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //register function
  void signUp(String email, String password) async {
    //validate the form
    if (_formKey.currentState!.validate()) {
      await _auth //creates a new user with the email and password provided
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                postDetailsToFirestore()
              }) //if the user is created successfully, it posts the details to the firestore

          //catches the error and displays a message to the user
          .catchError((e) {
        Fluttertoast.showToast(msg: e!.message); //displays a toast message
      });
    }
  }

  //function to post the details to the firestore. This function is called when the user is created successfully
  postDetailsToFirestore() async {
    //calling our firestore
    //calling our user model
    //sending these values

    FirebaseFirestore firebaseFirestore =
        FirebaseFirestore.instance; //creates an instance of the firestore
    User? user = _auth.currentUser; //gets the current user

    UserModel userModel = UserModel(); //creates an instance of the user model

    //sets the values of the user model
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstname = firstNameEditingController.text;
    userModel.lastname = lastNameEditingController.text;

    //adds the user to the firestore. It uses the user's uid as the document id. This is useful because it makes it easier to retrieve the user's details
    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap()); //adds the user to the firestore
    Fluttertoast.showToast(
        msg: "Account created successfully :)"); //displays a toast message
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (builder) => HomeScreen()),
        (route) => false); //navigates to the home screen
  }
}
