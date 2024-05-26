



import 'package:cloud_firestore/cloud_firestore.dart';

Future<Map<String, String>> getPrescriptionDetails(String date, String docUid, String patUid) async {
    final firestore = FirebaseFirestore.instance;
print(date);
    // Query Firestore for the prescription document
    final querySnapshot = await firestore
        .collection('prescriptions')
        .where('dateTime', isEqualTo: date)
        .where('docUid', isEqualTo: docUid)
        .where('patUid', isEqualTo: patUid)
        .get();

    if (querySnapshot.docs.isEmpty) {
      throw Exception('No prescription found');
    }

    // Get the prescription document data
    final prescriptionData = querySnapshot.docs.first.data();
    final fileName = prescriptionData['fileName'] as String;
    final problem = prescriptionData['problem'] as String;
    final downloadUrl = prescriptionData['dLink'] as String;


    return {
      'dateTime': date,
      'fileName': fileName,
      'problem': problem,
      'downloadUrl': downloadUrl,
    };
  }
