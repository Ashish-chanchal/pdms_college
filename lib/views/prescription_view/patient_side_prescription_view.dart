import 'package:pdms/components/custom_button.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/resources/get_prescription.dart';
import 'package:pdms/views/prescription_view/pdfScreen.dart';

class PatientSidePrescription extends StatefulWidget {
  final String patUid;
  final String docUid;
  final date;
  const PatientSidePrescription(
      {super.key,
      required this.patUid,
      required this.docUid,
      required this.date});

  @override
  State<PatientSidePrescription> createState() =>
      _PatientSidePrescriptionState();
}

class _PatientSidePrescriptionState extends State<PatientSidePrescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: AppStyles.normal(
              title: "Prescription",
              size: AppSize.size22,
              color: AppColors.whiteColor),
        ),
        body: FutureBuilder<Map<String, String>>(
            future: getPrescriptionDetails(widget.date,widget.docUid, widget.patUid),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } 
              else if (!snapshot.hasData) {
                return const Center(child: Text('No prescription found'));
              } else {
                final details = snapshot.data!;
                return Column(
                  children: [
                    ListTile(
                      title: const Text('Date', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      subtitle: Text(details['dateTime']!),
                    ),
                    ListTile(
                      title: const Text('File Name', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      subtitle: Text(details['fileName']!),
                    ),
                    ListTile(
                      title: const Text('Problem', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      subtitle: Text(details['problem']!),
                    ),
                    CustomButton(onTap: (){
                      Get.to(()=> PDFScreen(url: details['downloadUrl']!));
                    
                    }, buttontext: 'View Prescription', widt: 200,)
                  ],
                );
              }
            }));
  }
}
