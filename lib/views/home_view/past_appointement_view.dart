import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:pdms/consts/consts.dart';
import 'package:pdms/resources/auth_user.dart';
import 'package:pdms/resources/store_appointment.dart';
import 'package:pdms/views/appointment_profile_view/appointment_profile_view.dart';

class PastAppointmentView extends StatelessWidget {
  const PastAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FutureBuilder<QuerySnapshot>(
                future: StoreAppointment().getPastAppointmentDocList(),
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
                              return Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: SizedBox(
                                  height: 100,
                                  width: double.infinity,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(() => AppointmentProfileView(
                                          uid: data?[index]['patUid'],
                                          problem: data?[index]['problem'],
                                          dateTime: data?[index]['dateTime']));
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100,
                                          height: 100,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            doc.imageUrl,
                                            fit: BoxFit.cover,
                                          ),
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
