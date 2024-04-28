
import 'package:pdms/components/custom_button.dart';
import 'package:pdms/components/custom_testfield.dart';
import 'package:pdms/consts/consts.dart';

class VerifyOtpView extends StatelessWidget {
  const VerifyOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Verification', style: TextStyle(color: AppColors.whiteColor)),
      ),
      body:SizedBox(
        width: double.infinity,
        child: 
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          20.heightBox,
          Image.asset(AppAssets.sad, height: 150, width: 150, fit: BoxFit.cover,),
          10.heightBox,
          Align(
            
            alignment: Alignment.center,
            child: AppStyles.bold(title: "Enter the mobile number associated with your account", size: AppSize.size18, color: AppColors.primaryColor),
          ),
          10.heightBox,
          CustomTextField(hint: "Enter OTP",textColor: AppColors.primaryColor, inputColor: AppColors.primaryColor,borderColor: AppColors.primaryColor,),
          10.heightBox,
          CustomButton(onTap: (){}, buttontext: "Verify",widt: 200,),

        ],),
      )
      ,),
    );
  }
}
