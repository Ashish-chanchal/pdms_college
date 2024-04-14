import 'package:flutter/material.dart';
import 'package:pdms/components/custom_button.dart';
import 'package:pdms/components/custom_testfield.dart';
import 'package:pdms/consts/consts.dart';

class BookAppointmentView extends StatelessWidget {
  const BookAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title:  Text('Book Appointment', style: TextStyle(color: AppColors.whiteColor),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          AppStyles.bold(title:"Name" , size: AppSize.size22),
          10.heightBox,
          CustomTextField(hint: "Enter your name",textColor:  AppColors.primaryColor, inputColor: AppColors.primaryColor,borderColor: AppColors.primaryColor,),
          10.heightBox,
           AppStyles.bold(title:"Problems you have" , size: AppSize.size22),
          10.heightBox,
          CustomTextField(hint: "Type Your Message here ..",textColor:  AppColors.primaryColor, inputColor: AppColors.primaryColor,borderColor: AppColors.primaryColor,),
          20.heightBox,
          Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    child: CustomButton(
                      onTap: () {
                        Get.snackbar("Appointment Booked", "Your Appointment has been booked successfully", snackPosition: SnackPosition.BOTTOM, backgroundColor: AppColors.primaryColor, colorText: AppColors.whiteColor, margin: EdgeInsets.all(20), borderRadius: 10, duration: Duration(seconds: 5));
                       // Get.to(() => const App());
                      },
                      buttontext: "Book Appointment", widt: 200,
                    )),


        ],),
      )
    );
  }
}