import 'package:pdms/components/custom_button.dart';
import 'package:pdms/components/custom_testfield.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/resources/forget_passord_auth.dart';

import 'package:pdms/views/login_view/login_view.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    sendLink(String email) async{
      await ForgetPasswordAuth().sendPasswordResetEmail(email);
      Get.snackbar("Email Sent", "Check your email for the Link",
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.primaryColor,
          colorText: AppColors.whiteColor);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Forget Password',
            style: TextStyle(color: AppColors.whiteColor)),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.heightBox,
              Image.asset(
                AppAssets.sad,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              10.heightBox,
              Align(
                alignment: Alignment.center,
                child: AppStyles.bold(
                    title: "Enter the verification code sent to your email ",
                    size: AppSize.size18,
                    color: AppColors.primaryColor),
              ),
              10.heightBox,
              CustomTextField(
                hint: "Enter Email",
                textColor: AppColors.primaryColor,
                textcontroller: emailController,
                inputColor: AppColors.primaryColor,
                borderColor: AppColors.primaryColor,
              ),
              10.heightBox,
              CustomButton(
                onTap: () {
                  sendLink(emailController.text);
                  Get.to(() => const LoginView());
                },
                buttontext: "Send OTP",
                widt: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
