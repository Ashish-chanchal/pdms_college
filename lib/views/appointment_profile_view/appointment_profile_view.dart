
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:pdms/components/custom_button.dart';
import 'package:pdms/components/custom_testfield.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/resources/auth_user.dart';
import 'package:pdms/views/bottem_nav_view/bottem_navdoc_view.dart';

import 'package:pdms/views/prescription_view/doctor_side_prescription_view.dart';

class AppointmentProfileView extends StatefulWidget {
  final String uid;
  final String problem;
  final String dateTime;
  const AppointmentProfileView(
      {super.key,
      required this.uid,
      required this.problem,
      required this.dateTime});

  @override
  State<AppointmentProfileView> createState() => _AppointmentProfileViewState();
}

class _AppointmentProfileViewState extends State<AppointmentProfileView> {
  String? downloadLink ;
  String? fileName ;
  Uri? dialnumber;
  Uri? emailLaunchUri;
  File? file;
  TextEditingController detailscoltroller = TextEditingController();
  TextEditingController fileNamecontroller = TextEditingController();
  callnumber(Uri dailnumber) async {
    await launchUrl(dialnumber!);
  }

  sendmail(Uri emailLaunchUri) async {
    await launchUrl(emailLaunchUri);
  }

  void launchMap(String address) async {
    String query = Uri.encodeComponent(address);
    String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";

    await launchUrl(Uri.parse(googleUrl));
  }

  Future<String> uploadPdf(String fileName, File file) async {
    final refrence =
        FirebaseStorage.instance.ref().child("prescriptions/$fileName");

    final uploadTask = refrence.putFile(file);

    await uploadTask.whenComplete(() => null);

    final url = await refrence.getDownloadURL();

    return url;
  }

  void pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (pickedFile != null) {
       file = File(pickedFile.files[0].path!);
      fileName = pickedFile.files[0].name;
    }
  }

  void storePrescription(String details) async {
    downloadLink = await uploadPdf(fileName!, file!);
    final store = FirebaseFirestore.instance.collection('prescriptions').doc();

    await store.set({
      'fileName': details,
      'dLink': downloadLink,
      'problem': widget.problem,
      'docUid': FirebaseAuth.instance.currentUser!.uid,
      'patUid': widget.uid,
      'dateTime': DateTime.now().toString().substring(0, 10),
    });
    Get.snackbar("Success", "Prescription uploaded successfully");
    Get.offAll(() => const BottomNavDocView());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Appointment Profile',
              style: TextStyle(color: AppColors.whiteColor)),
          backgroundColor: AppColors.primaryColor,
        ),
        body: SingleChildScrollView(
          child: FutureBuilder<Patient>(
            future: StoreData().getUserDetails(widget.uid),
            builder: (BuildContext context, AsyncSnapshot<Patient> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              }
              var data = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 150,
                            height: 150,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.network(
                              data!.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          10.heightBox,
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AppStyles.bold(
                                  title: "Patient Name",
                                  size: AppSize.size18,
                                  color: AppColors.primaryColor),
                              AppStyles.normal(
                                  title: data.name,
                                  size: AppSize.size18,
                                  color: AppColors.primaryColor),
                            ],
                          )
                        ],
                      ),
                      10.heightBox,
                      ListTile(
                        onTap: () {
                          dialnumber = Uri(scheme: 'tel', path: data.phone);
                          callnumber(dialnumber!);
                        },
                        title: AppStyles.bold(
                            title: "Phone Number",
                            size: AppSize.size14,
                            color: AppColors.textColor),
                        subtitle: AppStyles.normal(
                          title: data.phone,
                          size: AppSize.size12,
                          color: AppColors.textColor.withOpacity(0.5),
                        ),
                        trailing: Container(
                          width: 50,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.yellowColor,
                          ),
                          child: Icon(
                            Icons.call,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: data.email,
                              queryParameters: {
                                'subject': 'Prescription',
                                'body': '${data.name},',
                              });
                          sendmail(emailLaunchUri!);
                        },
                        title: AppStyles.bold(
                            title: "Email",
                            size: AppSize.size14,
                            color: AppColors.textColor),
                        subtitle: AppStyles.normal(
                          title: data.email,
                          size: AppSize.size12,
                          color: AppColors.textColor.withOpacity(0.5),
                        ),
                        trailing: Container(
                          width: 50,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.yellowColor,
                          ),
                          child: Icon(
                            Icons.email,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          launchMap(data.address);
                        },
                        title: AppStyles.bold(
                            title: "Location",
                            size: AppSize.size14,
                            color: AppColors.textColor),
                        subtitle: AppStyles.normal(
                          title: data.address,
                          size: AppSize.size12,
                          color: AppColors.textColor.withOpacity(0.5),
                        ),
                        trailing: Container(
                          width: 50,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.yellowColor,
                          ),
                          child: Icon(
                            Icons.location_on,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.heightBox,
                            AppStyles.bold(
                                title: "Problem",
                                size: AppSize.size14,
                                color: AppColors.textColor),
                            10.heightBox,
                            AppStyles.normal(
                                title: widget.problem,
                                size: AppSize.size14,
                                color: AppColors.textColor),
                            10.heightBox,
                          ],
                        ),
                      ),
                      20.heightBox,
                      Container(
                        padding: const EdgeInsets.all(8),
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.heightBox,
                            AppStyles.bold(
                                title: "Add Prescription",
                                size: AppSize.size22,
                                color: AppColors.textColor),
                            10.heightBox,
                            widget.dateTime.substring(0, 10) ==
                                    DateTime.now().toString().substring(0, 10)
                                ? Column(
                                    children: [
                                      CustomTextField(
                                        hint: " Add details ..",
                                        textcontroller: detailscoltroller,
                                        textColor: AppColors.primaryColor,
                                        inputColor: AppColors.primaryColor,
                                        borderColor: AppColors.primaryColor,
                                      ),
                                      10.heightBox,
                                      CustomTextField(
                                        hint: "file name",
                                        textcontroller: fileNamecontroller,
                                        textColor: AppColors.primaryColor,
                                        inputColor: AppColors.primaryColor,
                                        borderColor: AppColors.primaryColor,
                                      ),
                                      10.heightBox,
                                      GestureDetector(
                                        onTap: () {
                                          pickFile();
                                        },
                                        child: Row(
                                          children: [
                                            Icon(Icons.upload,
                                                size: 40,
                                                color: AppColors.primaryColor),
                                            AppStyles.normal(
                                                title: "Upload Prescription",
                                                size: AppSize.size14,
                                                color: AppColors.primaryColor),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                : Text(
                                    "Prescription can be uploaded only on the day of appointment",
                                  ),
                            10.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                widget.dateTime.substring(0, 10) ==
                                        DateTime.now()
                                            .toString()
                                            .substring(0, 10)
                                    ? CustomButton(
                                        onTap: () {
                                          storePrescription(
                                              detailscoltroller.text,
                                              );
                                        },
                                        buttontext: "Upload",
                                      )
                                    : Text(""),
                                CustomButton(
                                  onTap: () {
                                    Get.to(() =>  DoctorPresciptionView(patUid: data.userId, ));
                                  },
                                  buttontext: "View",
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      20.heightBox,
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
