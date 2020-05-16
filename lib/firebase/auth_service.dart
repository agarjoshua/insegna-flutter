import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  Observable<FirebaseUser> user;
  Observable<Map<String, dynamic>> profile;

  PublishSubject loading = PublishSubject();

  //Constructor
  AuthService() {
    user = Observable(_auth.onAuthStateChanged);

    profile = user.switchMap((FirebaseUser u) {
      if (u != null) {
        return _db
            .collection('users')
            .document(u.uid)
            .snapshots()
            .map((snap) => snap.data);
      } else {
        return Observable.just({});
      }
    });
  }

  Future<FirebaseUser> googleSignIn() async {
    loading.add(true);
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final AuthResult authResult = await _auth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;

    updateUserData(user);

    print("signed in " + user.displayName);

    loading.add(false);

    return user;
  }

  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = _db.collection('users').document(user.uid);
    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoUrl,
      'displayName': user.displayName,
      'lastSeen': DateTime.now()
    }, merge: true);
  }

  void signOut() {
    _auth.signOut();
  }

  //=================================== facebook login

  Future<FirebaseUser> signInWithFacebook() async {
    final facebookLogin = FacebookLogin();
//    final result = await facebookLogin.logIn(['email']);
    final result = await facebookLogin.logInWithReadPermissions(['email']);
    FirebaseUser fbUser;
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        FacebookAccessToken facebookAccessToken = result.accessToken;
        AuthCredential authCredential = FacebookAuthProvider.getCredential(
            accessToken: facebookAccessToken.token);

        fbUser = (await _auth.signInWithCredential(authCredential)).user;

        updateUserData(fbUser);
        break;
      case FacebookLoginStatus.cancelledByUser:
        Fluttertoast.showToast(
            msg: "Facebook access has been cancelled by user",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
        break;
      case FacebookLoginStatus.error:
        Fluttertoast.showToast(
            msg: "Something wents wrong while connecting to facebook",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
        break;
    }
    return fbUser;
  }
}

final AuthService authService = AuthService();
