import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beautiful_popup/main.dart';
import 'package:saloon_plus_barber/screens/components/bottom_nav.dart';
import 'package:saloon_plus_barber/user_details/user_details.dart';
import 'package:progress_state_button/progress_button.dart';

class AuthenticationRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  AuthenticationRepository(
      {FirebaseAuth firebaseAuth, FirebaseFirestore firebaseFirestore})
      : firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  bool isLoggedIn() {
    return firebaseAuth.currentUser != null;
  }

  User getCurrentUser() {
    return UserDetails.firebaseUser;
  }

  Future signInUsingEmail(
      String email, String password, BuildContext context, callback) async {
    try {
      User firebaseUser = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      if (firebaseUser != null && firebaseUser.emailVerified) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BottomNav(
                    currentIndex: 1,
                  )),
        );
      } else {
        print("Email not verified yet");
        await firebaseUser.sendEmailVerification();
        callback(ButtonState.success, "1");
        final popup =
            BeautifulPopup(template: TemplateNotification, context: context);
        popup.show(
            title: "Email Verification",
            content:
                "We have sent a verification link to your email please verify to proceed",
            actions: [
              popup.button(
                  label: 'Close',
                  onPressed: () {
                    callback(ButtonState.idle, "1");
                    Navigator.of(context).pop();
                  }),
              popup.button(
                label: 'Proceed',
                onPressed: () async {
                  User user = firebaseAuth.currentUser;
                  await user.reload();
                  user = firebaseAuth.currentUser;
                  print(user.emailVerified);
                  if (user != null && user.emailVerified) {
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNav(
                                currentIndex: 2,
                              )),
                    );
                  } else {
                    print("Email not verified yet");
                  }
                },
              )
            ],
            barrierDismissible: false,
            close: Container());
      }
    } catch (e) {
      final errorpopup = BeautifulPopup(
        template: TemplateNotification,
        context: context,
      );
      errorpopup.show(
          title: "invalid field",
          content: "No user exists with current fields",
          actions: [
            errorpopup.button(
              label: 'Close',
              onPressed: () {
                callback(ButtonState.idle, "1");
                Navigator.of(context).pop();
              },
            ),
          ],
          barrierDismissible: false,
          close: Container());
      print("error 2");
      print(e.toString());
    }
  }

  Future signUpUsingEmail(String email, String password, String firstName,
      String lastName, BuildContext context, callback) async {
    try {
      print("sign up");
      var result = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password)
          .catchError((e) {
        print("ERROR BRO");
        print(e);
        final errorpopup = BeautifulPopup(
          template: TemplateNotification,
          context: context,
        );
        errorpopup.show(
            title: "Email Already exits",
            content:
                "The email you have entered is already registered please try to login or enter another email",
            actions: [
              errorpopup.button(
                label: 'Close',
                onPressed: () {
                  callback(ButtonState.idle, "1");
                  Navigator.of(context).pop();
                },
              ),
            ],
            barrierDismissible: false,
            close: Container());
      });
      if (result != null) {
        User firebaseUser = result.user;
        await firebaseUser.sendEmailVerification();
        callback(ButtonState.success, "1");
        final popup =
            BeautifulPopup(template: TemplateNotification, context: context);
        popup.show(
            title: "Email Verification",
            content:
                "We have sent a verification link to your email please verify to proceed",
            actions: [
              popup.button(
                  label: 'Close',
                  onPressed: () {
                    callback(ButtonState.idle, "1");
                    Navigator.of(context).pop();
                  }),
              popup.button(
                label: 'Proceed',
                onPressed: () async {
                  User user = firebaseAuth.currentUser;
                  await user.reload();
                  user = firebaseAuth.currentUser;
                  print(user.emailVerified);
                  if (user != null && user.emailVerified) {
                    user.updateProfile(displayName: firstName + " " + lastName);
                    // await FirebaseDatabase.instance.reference().child('Users/${FirebaseAuth.instance.currentUser.uid}/email').set(email);
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNav(
                                currentIndex: 1,
                              )),
                    );
                  } else {
                    print("Email not verified yet");
                  }
                },
              )
            ],
            barrierDismissible: false,
            close: Container());
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static Future resetPassword(String email, context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
    UserDetails.firebaseUser = null;
    return Future.wait([firebaseAuth.signOut()]);
  }
}
