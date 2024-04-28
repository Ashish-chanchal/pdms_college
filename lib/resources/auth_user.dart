import "dart:typed_data";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:flutter/foundation.dart";
import "package:pdms/consts/consts.dart";
import "package:pdms/views/login_view/patient_login_view.dart";

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
UserCredential? userCredential;

class StoreData {
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

  Future<String>signupUser(
      {required String name,
      required String age,
      required String gender,
      required String address,
      required String email,
      required String password,
      required String phone,
      required Uint8List file}) async {
    userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    String imageUrl = await uploadImageToStorage(name, file);

    String status = await storeUserData(userCredential!.user!.uid, name, age,
        gender, address, email, phone, imageUrl);

    return status;
  }

  Future<String> storeUserData(
      String uid,
      String name,
      String age,
      String gender,
      String address,
      String email,
      String phone,
      String imageUrl) async {
    try {
      var store = _firestore.collection('users').doc(uid);

      await store.set({
        'name': name,
        'age': age,
        'gender': gender,
        'address': address,
        'email': email,
        'phone': phone,
        'imageUrl': imageUrl,
        'userId': FirebaseAuth.instance.currentUser!.uid,
      });
    } catch (e) {
      print(e);
      return "Failed";
    }
    return "Success";
  }


    loginUser({required email,required password}) async {

    userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password);
  }
   signout() async {
    await FirebaseAuth.instance.signOut();
    Get.off(() => const PatientLoginView());
  }
  Future<Patient> getPatientData() async {
  DocumentSnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('users').doc(userCredential!.user!.uid).get();

  Map<String, dynamic> data = snapshot.data()!;
  return Patient.fromJson(data);
}
}
class Patient {
  final String address;
  final String age;
  final String email;
  final String gender;
  final String imageUrl;
  final String name;
  final String phone;
  final String userId;

  Patient({
    required this.address,
    required this.age,
    required this.email,
    required this.gender,
    required this.imageUrl,
    required this.name,
    required this.phone,
    required this.userId,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      address: json['address'],
      age: json['age'],
      email: json['email'],
      gender: json['gender'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      phone: json['phone'],
      userId: json['userId'],
    );
  }
}