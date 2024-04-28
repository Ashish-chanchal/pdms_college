import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pdms/components/custom_button.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/views/bookappointment_view/bookappointment_view.dart';

class DoctoreProfileptView extends StatelessWidget {
  final bool isbooked;
   final DocumentSnapshot doc;

  const DoctoreProfileptView({super.key, this.isbooked = false, required this.doc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: AppStyles.normal(
              title: "Dr ${doc['name']}",
              size: AppSize.size22,
              color: AppColors.whiteColor),
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
                     Container(
                                width: 150,
                                height: 150,
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  doc['imageUrl'],
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
                            title: doc['name'],
                            size: AppSize.size18,
                            color: AppColors.primaryColor),
                        AppStyles.bold(
                            title: "Doctor Speciality",
                            size: AppSize.size16,
                            color: AppColors.primaryColor),
                        AppStyles.normal(
                            title: doc['category'],
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
                    title: doc['phone'],
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
                    title: doc['email'],
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
                    title: doc['clinicadd'],
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
                          title: "About Doctor",
                          size: AppSize.size14,
                          color: AppColors.textColor),
                      10.heightBox,
                      AppStyles.bold(
                          title: "Clinic Timing",
                          size: AppSize.size14,
                          color: AppColors.textColor),
                      10.heightBox,
                      AppStyles.normal(
                          title: "Timing",
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
                        if (!isbooked){
                        Get.to(() => const BookAppointmentView());
                        }
                        else{
                          Get.snackbar("Already Booked", "You have already booked an appointment", snackPosition: SnackPosition.BOTTOM, backgroundColor: AppColors.primaryColor, colorText: AppColors.whiteColor, margin: const EdgeInsets.all(20), borderRadius: 10, duration: const Duration(seconds: 5));
                        }
                      },
                      buttontext: !isbooked ?"Book Appointment":"Already Booked",
                      widt: 200,
                    )),
              ],
            ),
          ),
        ));
  }
}
