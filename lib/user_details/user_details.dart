import 'package:firebase_auth/firebase_auth.dart';

class UserDetails {
  static final UserDetails _singletonUserDetails = UserDetails._internal();

  factory UserDetails() {
    return _singletonUserDetails;
  }

  UserDetails._internal();

  static User firebaseUser;

  static getUserId() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    return firebaseUser;
  }

  static signOut() async {
    await FirebaseAuth.instance.signOut();
    firebaseUser = null;
  }
}
