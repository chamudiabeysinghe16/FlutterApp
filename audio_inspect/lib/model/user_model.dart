class UserModel {
  String? uid;
  String? email;
  String? firstname;
  String? lastname;

  //constructor
  UserModel({this.uid, this.email, this.firstname, this.lastname});

  //taking data from the server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'], //map['uid'] is the key from the server
      email: map['email'],
      firstname: map['firstname'],
      lastname: map['lastname'],
    );
  }

  //sending data to the server
  //toMap() is a method that converts the object into a map
  //this is useful when you want to send the object to the server or when you want to save the object in the database
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
    };
  }
}
