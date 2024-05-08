
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/resources/store_appointment.dart';

import 'package:pdms/views/profile_view/doctor_profile_ptview.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // body:
        appBar: AppBar(
          title: Text('Your Appointments',
              style: TextStyle(color: AppColors.whiteColor)),
          backgroundColor: AppColors.primaryColor,
          
        ),
        body:          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: FutureBuilder<QuerySnapshot>(future: StoreAppointment().getAppointmentList(), builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Center(child: CircularProgressIndicator());
                }
                else if(snapshot.hasError){
                  return Center(child: Text("Error: ${snapshot.error}"));
                }
                else if(snapshot.data!.docs.isEmpty){
                  return const Center(child: Text("No Appointments"));
                }
                var data = snapshot.data?.docs;
                return ListView.builder(
                    itemCount: data?.length??0,
                    shrinkWrap: true,

                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return FutureBuilder<Doctors>(
                          future: StoreAppointment().getDoctorDetails(data?[index]['docUid']),
                          builder: (BuildContext context, AsyncSnapshot<Doctors> snapshot){
                            if(snapshot.connectionState == ConnectionState.waiting){
                              return const Center(child: CircularProgressIndicator());
                            }
                            Doctors doc = snapshot.data!;

                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: SizedBox(
                                height: 100,
                                width: double.infinity,
                                child: GestureDetector(
                                  // onTap: (){
                                  //   Get.to(()=> DoctoreProfileptView(isbooked: true,doc: doctorMap));
                                  // },
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
                                        padding: const EdgeInsets.only(left: 8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            AppStyles.bold(
                                                title: "Doctor Name",
                                                size: AppSize.size18,
                                                color: AppColors.primaryColor),
                                            AppStyles.normal(
                                                title: doc.name,
                                                size: AppSize.size14,
                                                color: AppColors.primaryColor),
                                            AppStyles.bold(
                                                title: "Appointment Date",
                                                size: AppSize.size18,
                                                color: AppColors.primaryColor),
                                            AppStyles.normal(
                                                title:
                                                data?[index]['dateTime'].toString().substring(0, 10),
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
                          }
                      );
                    });


              })
            ),
          ),
      )
    );
  }
}
