import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/resources/home_controller.dart';
import 'package:pdms/views/profile_view/doctor_profile_ptview.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Doctors', style: TextStyle(color: AppColors.whiteColor)),
          backgroundColor: AppColors.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<QuerySnapshot>(
              future: HomeController().getDoctorList(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                else if (snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No Appointments"));
                }
                var data = snapshot.data?.docs;
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                    ),
                    itemCount: data?.length??0,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                           Get.to(() =>  DoctoreProfileptView(doc: data[index]));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.bgDarkCokor),
                          height: 150,
                          width: 150,
                          child: Column(children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.primaryColor,
                              ),
                              width: 150,
                              alignment: Alignment.center,
                              child: Image.network(
                                 data![index]['imageUrl'],
                                width: 100,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            5.heightBox,
                            AppStyles.normal(
                              title: data[index]['name'],
                              size: AppSize.size14,
                            ),
                            AppStyles.normal(
                                title: data[index]['category'],
                                size: AppSize.size14,
                                color: Colors.black54)
                          ]),
                        ),
                      );
                    });
              }),
        ));
  }
}
