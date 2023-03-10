import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/firebase/exceptions/firebaseExceptions.dart';
import 'package:quiz_app/firebase/models/faculty.dart';
import 'package:quiz_app/firebase/models/user_model.dart';
import 'package:quiz_app/pages/getStarted.dart';
import 'package:quiz_app/pages/home.dart';
import 'package:quiz_app/pages/LoginForms/login.dart';
import 'package:quiz_app/pages/otp.dart';
import 'package:quiz_app/pages/SignupForms/signup.dart';
import 'package:quiz_app/pages/splash_screen.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(Usermodel user) async {
    await _db
        .collection("Students")
        .add(user.tojson())
        .whenComplete(() => Get.snackbar(
            "Success", "Your account has been created.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor:
                Color.fromARGB(255, 130, 216, 133).withOpacity(0.1),
            colorText: Color.fromARGB(255, 22, 141, 26)))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Please try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color.fromARGB(255, 244, 121, 113).withOpacity(0.1),
          colorText: Color.fromARGB(255, 164, 23, 23));
      print(error.toString());
    });
  }

  Future<Usermodel> getUserEmail(String email) async {
    final snapshot =
        await _db.collection("Students").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => Usermodel.fromSnapshot(e)).single;
    return userData;
  }

  Future<Usermodel> getUserName(String name) async {
    final snapshot =
        await _db.collection("Students").where("Name", isEqualTo: name).get();
    final userData = snapshot.docs.map((e) => Usermodel.fromSnapshot(e)).single;
    return userData;
  }

  Future<Usermodel> getUserid(String id) async {
    final snapshot =
        await _db.collection("Students").where("ID", isEqualTo: id).get();
    final userData = snapshot.docs.map((e) => Usermodel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<Usermodel>> getallUsers() async {
    final snapshot = await _db.collection("Students").get();
    final userData =
        snapshot.docs.map((e) => Usermodel.fromSnapshot(e)).toList();
    return userData;
  }
}
