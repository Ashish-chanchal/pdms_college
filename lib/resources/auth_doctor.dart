import "dart:typed_data";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:flutter/foundation.dart";
import "package:pdms/consts/consts.dart";

import "package:pdms/views/login_view/login_view.dart";

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
UserCredential? userCredential;

class StoreDocData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    String downloadUrl = "";
    try {
      Reference ref = _storage.ref().child(childName);
      UploadTask uploadTask = ref.putData(file);
      TaskSnapshot snapshot = await uploadTask;
      String url = await snapshot.ref.getDownloadURL();
      downloadUrl = url;
    } catch (e) {
      print(e);
      return "";
    }
    return downloadUrl;
  }

  Future<String> signupdoctor(
      {required String name,
      required String gender,
      required String clinicadd,
      required String drId,
      required String category,
      required String email,
      required String password,
      required String phone,
      required String about,
      required String clinicTiming,
      required Uint8List file}) async {
    userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    String imageUrl = await uploadImageToStorage(name, file);

    String status = await storeUserData(userCredential!.user!.uid, name, gender,
        clinicadd, drId, category, email, phone, about, clinicTiming, imageUrl);

    return status;
  }

  Future<String> storeUserData(
      String uid,
      String name,
      String gender,
      String clinicadd,
      String drId,
      String category,
      String email,
      String phone,
      String about,
      String clinicTiming,
      String imageUrl) async {
    try {
      var store = _firestore.collection('doctor').doc(uid);

      await store.set({
        'name': name,
        'gender': gender,
        'clinicadd': clinicadd,
        'drId': drId,
        'category': category,
        'email': email,
        'phone': phone,
        'imageUrl': imageUrl,
        'about': about,
        'clinicTiming': clinicTiming,
        'userId': FirebaseAuth.instance.currentUser!.uid,
      });
    } catch (e) {
      print(e);
      return "Failed";
    }
    return "Success";
  }

  loginUser({required email, required password}) async {
    userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  signout() async {
    await FirebaseAuth.instance.signOut();
    Get.off(() => const LoginView());
  }

  Future<Clinic> getClinicData() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('doctor')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    Map<String, dynamic> data = snapshot.data()!;
    return Clinic.fromJson(data);
  }
}

class Clinic {
  final String category;
  final String clinicAddress;
  final String doctorId;
  final String email;
  final String about;
  final String clinicTiming;
  final String gender;
  final String imageUrl;
  final String name;
  final String phone;
  final String userId;

  Clinic({
    required this.category,
    required this.clinicAddress,
    required this.doctorId,
    required this.email,
    required this.about,
    required this.clinicTiming,
    required this.gender,
    required this.imageUrl,
    required this.name,
    required this.phone,
    required this.userId,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      category: json['category'],
      clinicAddress: json['clinicadd'],
      doctorId: json['drId'],
      email: json['email'],
      about: json['about'],
      clinicTiming: json['clinicTiming'],
      gender: json['gender'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      phone: json['phone'],
      userId: json['userId'],
    );
  }
}
