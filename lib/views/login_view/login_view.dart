import 'package:pdms/components/custom_button.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/views/login_view/doctor_login_view.dart';
import 'package:pdms/views/login_view/patient_login_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Center(child: Image.asset(AppAssets.login, height: 400, width: 400 )),
          Container(
            width: double.infinity,
            height: 442,
            decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Image.asset(AppAssets.loginsignup, height: 50, width: 50),
                   10.heightBox,
                   AppStyles.bold(title: AppStrings.loginas,size: AppSize.size34 ,color: AppColors.primaryColor),
                   10.heightBox,
                   Container(
                    
                    alignment: Alignment.center,
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Image.asset(AppAssets.doclogo, height: 70, width: 70),
                      CustomButton(onTap: (){
                        Get.to( const DoctorLoginView(),transition: Transition.rightToLeftWithFade , duration: const Duration(milliseconds: 1000));
                      }, buttontext: "Doctor" ,widt: 200,)],
                     ),
                   ),
                   10.heightBox,
                   Container(
                    
                    alignment: Alignment.center,
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [Image.asset(AppAssets.patientlogo, height: 70, width: 70),
                      CustomButton(onTap: (){
                         Get.to(const PatientLoginView(),transition: Transition.rightToLeftWithFade , duration: const Duration(milliseconds: 1000));
                      }, buttontext: "Patient",widt: 200,)],
                     ),
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
