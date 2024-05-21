

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pdms/components/custom_testfield.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/resources/auth_user.dart';
import 'package:pdms/resources/store_appointment.dart';
import 'package:pdms/views/appointment_profile_view/appointment_profile_view.dart';

class PresentAppointmentView extends StatelessWidget {
  const PresentAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.all(14),
              color: AppColors.bgColor,
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hint: "Search Patient",
                      textColor: AppColors.primaryColor,
                      inputColor: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                    ),
                  ),
                  10.widthBox,
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search, color: AppColors.primaryColor))
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder<QuerySnapshot>(
                future: StoreAppointment().getAppointmentDocList(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  } else if (snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text("No Appointments"));
                  }
                  var data = snapshot.data?.docs;
                  
                  return ListView.builder(
                      itemCount: data?.length ?? 0,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return FutureBuilder<Patient>(
                            future: StoreData()
                                .getUserDetails(data?[index]['patUid']),
                            builder: (BuildContext context,
                                AsyncSnapshot<Patient> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              Patient doc = snapshot.data!;
                              return SizedBox(
                                height: 100,
                                width: double.infinity,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => AppointmentProfileView(
                                        uid: data?[index]['patUid'],problem: data?[index]['problem']));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.network(
                                        doc.imageUrl,
                                        height: 80,
                                        width: 80,
                                        fit: BoxFit.cover,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AppStyles.bold(
                                                title: "Patient Name",
                                                size: AppSize.size18,
                                                color: AppColors.primaryColor),
                                            AppStyles.normal(
                                                title: data?[index]['name'],
                                                size: AppSize.size14,
                                                color: AppColors.primaryColor),
                                            AppStyles.bold(
                                                title: "Appointment Date",
                                                size: AppSize.size18,
                                                color: AppColors.primaryColor),
                                            AppStyles.normal(
                                                title: data?[index]['dateTime']
                                                    .toString()
                                                    .substring(0, 10),
                                                size: AppSize.size14,
                                                color: AppColors.primaryColor),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      });
                }),
          )
        ],
      ),
    ));
  }
}
