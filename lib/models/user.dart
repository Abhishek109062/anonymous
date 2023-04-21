import 'dart:typed_data';

import 'package:flutter/material.dart';

class User {
  String username;
  String email;
  String password;
  String imageUrl;
  String uid;

  User({
    required this.username,
    required this.email,
    required this.password,
    required this.imageUrl,
    required this.uid,
  });

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'password': password,
        'uid': uid,
        'imageUrl': imageUrl,
        'orders': [],
      };
}
