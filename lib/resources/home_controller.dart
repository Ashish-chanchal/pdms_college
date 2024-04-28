import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pdms/consts/consts.dart';

class HomeController extends GetxController{

  Future<QuerySnapshot<Map<String,dynamic>>>getDoctorList() async{
    
    var doctors=  FirebaseFirestore.instance.collection('doctor').get();
    return doctors;
  }
}