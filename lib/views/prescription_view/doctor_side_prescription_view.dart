import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pdms/components/custom_button.dart';

import 'package:pdms/consts/consts.dart';
import 'package:pdms/views/prescription_view/pdfScreen.dart';

class DoctorPresciptionView extends StatefulWidget {
  final String patUid;
  const DoctorPresciptionView({super.key, required this.patUid});

  @override
  State<DoctorPresciptionView> createState() => _DoctorPresciptionViewState();
}

class _DoctorPresciptionViewState extends State<DoctorPresciptionView> {
  final String docUid = FirebaseAuth.instance.currentUser!.uid;
  List<DocumentSnapshot> documents = [];
  Future<void> fetchDetails() async {
    try {
      final QuerySnapshot result = await FirebaseFirestore.instance
          .collection('prescriptions')
          .where('patUid', isEqualTo: widget.patUid)
          .where('docUid', isEqualTo: docUid)
          .get();
      setState(() {
        documents = result.docs;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: AppStyles.normal(
            title: "Prescriptions",
            size: AppSize.size22,
            color: AppColors.whiteColor),
      ),
      body: documents.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  final doc = documents[index];
            
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                    title: Text('Documet Name:', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle:
                        Text('${ doc['fileName']}'),
                  ),
                      ListTile(
                    title: Text('Patient problem:', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle:
                        Text(doc['problem'] ?? 'No problem description'),
                  ),
                  CustomButton(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PDFScreen(url: doc['dLink'])));
                  }, buttontext: "View Document",),
                    ],
                  );
                },
              ),
          ),
    );
  }
}
