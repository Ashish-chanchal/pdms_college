import 'package:pdms/components/custom_button.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/resources/auth_user.dart';

import 'package:pdms/views/login_view/login_view.dart';
import 'package:pdms/views/update_profile_view/update_profile_patient.dart';

class PatientProfileView extends StatelessWidget {
  const PatientProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: AppStyles.normal(
              title: "My Profile",
              size: AppSize.size22,
              color: AppColors.whiteColor),
          actions: [
            Row(
              children: [
                AppStyles.normal(
                    title: "Logout",
                    size: AppSize.size16,
                    color: AppColors.whiteColor),
                IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: AppColors.whiteColor,
                  ), // Your logout icon
                  onPressed: () {
                    Get.offAll(() => const LoginView());
                  },
                ),
              ],
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: FutureBuilder<Patient>(
              future: StoreData().getPatientData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  Patient patient = snapshot.data!;
                  print(patient);
                  return SizedBox(
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
                                patient.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                            10.heightBox,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AppStyles.bold(
                                    title: " Name",
                                    size: AppSize.size18,
                                    color: AppColors.primaryColor),
                                AppStyles.normal(
                                    title: patient.name,
                                    size: AppSize.size18,
                                    color: AppColors.primaryColor),
                              ],
                            )
                          ],
                        ),
                        10.heightBox,
                        ListTile(
                          onTap: () {},
                          title: AppStyles.bold(
                              title: "Phone Number",
                              size: AppSize.size14,
                              color: AppColors.textColor),
                          subtitle: AppStyles.normal(
                            title: patient.phone,
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
                          onTap: () {},
                          title: AppStyles.bold(
                              title: "Email",
                              size: AppSize.size14,
                              color: AppColors.textColor),
                          subtitle: AppStyles.normal(
                            title: patient.email,
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
                          onTap: () {},
                          title: AppStyles.bold(
                              title: "Location",
                              size: AppSize.size14,
                              color: AppColors.textColor),
                          subtitle: AppStyles.normal(
                            title: patient.address,
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
                                  title: "Your Age",
                                  size: AppSize.size14,
                                  color: AppColors.textColor),
                              10.heightBox,
                              AppStyles.normal(
                                  title: patient.age,
                                  size: AppSize.size14,
                                  color: AppColors.textColor),
                              10.heightBox,
                              AppStyles.bold(
                                  title: "Gender",
                                  size: AppSize.size14,
                                  color: AppColors.textColor),
                              10.heightBox,
                              AppStyles.normal(
                                  title: patient.gender,
                                  size: AppSize.size14,
                                  color: AppColors.textColor),
                            ],
                          ),
                        ),
                        20.heightBox,
                        Container(
                            width: double.infinity,
                            height: 50,
                            alignment: Alignment.center,
                            child: CustomButton(
                              onTap: () {
                                Get.to(() =>  UpdateProfilePatient(

                                  username: patient.name,
                                  age: patient.age,
                                  phone: patient.phone,
                                  gender: patient.gender,
                                  address: patient.address,
                                  imageUrl: patient.imageUrl,
                                  ));
                              },
                              buttontext: "Update Profile",
                              widt: 200,
                            )),
                      ],
                    ),
                  );
                }
              }),
        ));
  }
}
