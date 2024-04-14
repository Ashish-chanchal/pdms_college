
import 'package:pdms/components/custom_button.dart';
import 'package:pdms/components/custom_testfield.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/views/Bottem_nav_view/Bottem_navdoc_view.dart';

import 'package:pdms/views/signup_view/doctor_signup_view.dart';

class DoctorLoginView extends StatelessWidget {
  const DoctorLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Text(
          'Doctor Login',
          style: TextStyle(color: AppColors.whiteColor),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Center(child: Image.asset(AppAssets.login, height: 200, width: 200)),
          Container(
            width: double.infinity,
            height: 540,
            decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.loginsignup, height: 50, width: 50),
                  10.heightBox,
                  AppStyles.bold(
                      title: AppStrings.login,
                      size: AppSize.size34,
                      color: AppColors.primaryColor),
                  10.heightBox,
                  CustomTextField(
                    hint: AppStrings.username,
                    textColor: AppColors.primaryColor,
                  ),
                  10.heightBox,
                  CustomTextField(
                    hint: AppStrings.password,
                    textColor: AppColors.primaryColor,
                  ),
                  10.heightBox,
                  GestureDetector(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: AppStyles.normal(
                          title: AppStrings.forgotPassword,
                          size: AppSize.size14,
                          color: AppColors.primaryColor),
                    ),
                  ),
                  10.heightBox,
                  CustomButton(onTap: () {
                     Get.offAll(() => const BottomNavDocView());
                  }, buttontext: "Login"),
                  10.heightBox,
                  const Row(children: <Widget>[
                    Expanded(child: Divider()),
                    Text("OR"),
                    Expanded(child: Divider()),
                  ]),
                  10.heightBox,
                  CustomButton(
                    onTap: () {
                     
                    },
                    buttontext: "Login with Google",
                    widt: 200,
                  ),
                  10.heightBox,
                  CustomButton(
                    onTap: () {
                      Get.to(() => const DoctorSignupView());
                    },
                    buttontext: AppStrings.signup,
                    widt: 200,
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
