import 'dart:typed_data';

import 'package:anonymous/resourses/storage_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //signup a user
  Future<String> signUpUser({
    required String username,
    required String email,
    required String password,
    required Uint8List image,
    // required Uint8List image,
  }) async {
    String response = "An error has occured";
    try {
      if (username.isNotEmpty || email.isNotEmpty || password.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String imageUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', image, false);

        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'email': email,
          'uid': cred.user!.uid,
          'password': password,
          'imageUrl': imageUrl,
          'orders': []
        });
        print(cred.user!.uid);
      }
    } on FirebaseAuthException catch (error) {
      if (error.code == 'invalid-email') {
        response = "Please Enter a valid Email";
      }
    } catch (error) {
      response = error.toString();
    }

    return response;
  }
}
