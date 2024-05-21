import 'package:pdms/components/custom_button.dart';
import 'package:pdms/components/custom_testfield.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/resources/auth_doctor.dart';

class UpdateProfileDocView extends StatefulWidget {
  final String name;
  final String email;
  final String phone;
  final String category;
  final String clinicAddress;
  final String about;
  final String clinicTiming;
  final String imageUrl;
  final String gender;
  final String drId;
  const UpdateProfileDocView(
      {super.key,
      required this.name,
      required this.email,
      required this.phone,
      required this.category,
      required this.clinicAddress,
      required this.about,
      required this.clinicTiming,
      required this.imageUrl,
      required this.gender,
      required this.drId});

  @override
  State<UpdateProfileDocView> createState() => _UpdateProfileDocViewState();
}

class _UpdateProfileDocViewState extends State<UpdateProfileDocView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController clinicAddressController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController clinicTimingController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController drIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = widget.name;
    emailController.text = widget.email;
    phoneController.text = widget.phone;
    categoryController.text = widget.category;
    clinicAddressController.text = widget.clinicAddress;
    aboutController.text = widget.about;
    clinicTimingController.text = widget.clinicTiming;
    drIdController.text = widget.drId;
    genderController.text = widget.gender;


    updateProfile(){
      StoreDocData().updateDoc(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        category: categoryController.text,
        clinicAddress: clinicAddressController.text,
        about: aboutController.text,
        clinicTiming: clinicTimingController.text,
        gender: genderController.text,
        drId: drIdController.text
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile',
            style: TextStyle(color: AppColors.whiteColor)),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    10.heightBox,
                    Container(
                      width: 120,
                      height: 120,
                      clipBehavior: Clip.antiAlias,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        widget.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    10.heightBox,
                    10.heightBox,
                    CustomTextField(
                      hint: AppStrings.name,
                      textcontroller: nameController,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    10.heightBox,
                    CustomTextField(
                      hint: AppStrings.gender,
                      textcontroller: genderController,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: AppStrings.clinic,
                      textcontroller: clinicAddressController,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: AppStrings.drId,
                      textcontroller: drIdController,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: "Category",
                      textcontroller: categoryController,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: AppStrings.email,
                      textcontroller: emailController,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: AppStrings.phoneno,
                      textcontroller: phoneController,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: "about",
                      textcontroller: aboutController,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: "Clinic Timing",
                      textcontroller: clinicTimingController,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomButton(
                      onTap: () {
                        updateProfile();
                      },
                      buttontext: "Update",
                      widt: 200,
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
