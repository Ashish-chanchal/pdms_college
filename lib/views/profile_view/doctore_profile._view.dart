import 'package:pdms/components/custom_button.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/resources/auth_doctor.dart';

import 'package:pdms/views/update_profile_view/update_profile_doc_view.dart';

class DoctoreProfileView extends StatefulWidget {
  const DoctoreProfileView({super.key});

  @override
  State<DoctoreProfileView> createState() => _DoctoreProfileViewState();
}

class _DoctoreProfileViewState extends State<DoctoreProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          automaticallyImplyLeading: false,
          title: AppStyles.normal(
              title: "Your Profile",
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
                  StoreDocData().signout();
                  },
                ),
              ],
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: FutureBuilder<Clinic>(
                future: StoreDocData().getClinicData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    Clinic docdata = snapshot.data!;
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
                                  docdata.imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              10.heightBox,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  AppStyles.bold(
                                      title: "Doctor Name",
                                      size: AppSize.size18,
                                      color: AppColors.primaryColor),
                                  AppStyles.normal(
                                      title: docdata.name,
                                      size: AppSize.size18,
                                      color: AppColors.primaryColor),
                                  AppStyles.bold(
                                      title: "Doctor Speciality",
                                      size: AppSize.size16,
                                      color: AppColors.primaryColor),
                                  AppStyles.normal(
                                      title: docdata.category,
                                      size: AppSize.size16,
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
                              title: docdata.phone,
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
                              title: docdata.email,
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
                              title: docdata.clinicAddress,
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
                                    title: "About Doctor",
                                    size: AppSize.size14,
                                    color: AppColors.textColor),
                                10.heightBox,
                                AppStyles.normal(
                                    title: docdata.about,
                                    size: AppSize.size14,
                                    color: AppColors.textColor),
                                10.heightBox,
                                AppStyles.bold(
                                    title: "Clinic Timing",
                                    size: AppSize.size14,
                                    color: AppColors.textColor),
                                10.heightBox,
                                AppStyles.normal(
                                    title: docdata.clinicTiming,
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
                                  Get.to(() => const UpdateProfileDocView());
                                },
                                buttontext: "Update Profile",
                              )),
                        ],
                      ),
                    );
                  }
                },
              )),
        ));
  }
}
