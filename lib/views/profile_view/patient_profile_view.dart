import 'package:pdms/components/custom_button.dart';
import 'package:pdms/consts/consts.dart';

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
                  icon: Icon(Icons.logout ,color: AppColors.whiteColor,), // Your logout icon
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
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      AppAssets.profile,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
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
                            title: " Name",
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
                    title: "Phone Number",
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
                    title: "Email",
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
                    title: "Location",
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
                          title: "age",
                          size: AppSize.size14,
                          color: AppColors.textColor),
                      10.heightBox,
                      AppStyles.bold(
                          title: "Gender",
                          size: AppSize.size14,
                          color: AppColors.textColor),
                      10.heightBox,
                      AppStyles.normal(
                          title: "gender",
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
                        Get.to(() => const UpdateProfilePatient());
                      },
                      buttontext: "Update Profile", widt: 200,
                    )),
              ],
            ),
          ),
        ));
  }
}
