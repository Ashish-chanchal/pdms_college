import 'package:pdms/components/custom_button.dart';
import 'package:pdms/components/custom_testfield.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/views/bottem_nav_view/bottem_navpat_view.dart';

import '../../resources/store_appointment.dart';

class BookAppointmentView extends StatelessWidget {
  final String docUid;
  const BookAppointmentView({super.key, required this.docUid});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController problemController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            'Book Appointment',
            style: TextStyle(color: AppColors.whiteColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppStyles.bold(title: "Name", size: AppSize.size22),
              10.heightBox,
              CustomTextField(
                hint: "Enter your name",
                textcontroller: nameController,
                textColor: AppColors.primaryColor,
                inputColor: AppColors.primaryColor,
                borderColor: AppColors.primaryColor,
              ),
              10.heightBox,
              AppStyles.bold(title: "Problems you have", size: AppSize.size22),
              10.heightBox,
              CustomTextField(
                hint: "Type Your Message here ..",
                textcontroller: problemController,
                textColor: AppColors.primaryColor,
                inputColor: AppColors.primaryColor,
                borderColor: AppColors.primaryColor,
              ),
              20.heightBox,
              Container(
                  width: double.infinity,
                  height: 50,
                  alignment: Alignment.center,
                  child: CustomButton(
                    onTap: () async {
                      var status = await StoreAppointment().bookAppointment(
                          name: nameController.text,
                          problem: problemController.text,
                          docUid: docUid);
                      Get.snackbar("Appointment Booked",
                          "Your Appointment has been booked successfully",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: AppColors.primaryColor,
                          colorText: AppColors.whiteColor,
                          margin: const EdgeInsets.all(20),
                          borderRadius: 10,
                          duration: const Duration(seconds: 3));
                      Get.to(() => const BottomNavPatView());
                    },
                    buttontext: "Book Appointment",
                    widt: 200,
                  )),
            ],
          ),
        ));
  }
}
