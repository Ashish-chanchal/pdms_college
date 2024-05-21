import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdms/components/custom_button.dart';
import 'package:pdms/components/custom_testfield.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/resources/auth_doctor.dart';
import 'package:pdms/utils/utils.dart';
import 'package:pdms/views/login_view/doctor_login_view.dart';



class DoctorSignupView extends StatefulWidget {
  const DoctorSignupView({super.key});

  @override
  State<DoctorSignupView> createState() => _DoctorSignupViewState();
}

class _DoctorSignupViewState extends State<DoctorSignupView> {
  Uint8List? _image;
  final TextEditingController nameController = TextEditingController();

  final TextEditingController genderController = TextEditingController();
  final TextEditingController clinicController = TextEditingController();
  final TextEditingController drIdController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonenoController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  final TextEditingController clinicTimingController = TextEditingController();

  void regsiterUser() async {
    String stats = await StoreDocData().signupdoctor(
        name: nameController.text,
        gender: genderController.text,
        clinicadd: clinicController.text,
        drId: drIdController.text,
        category: categoryController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: phonenoController.text,
        about : aboutController.text,
        clinicTiming: clinicTimingController.text,
        file: _image!
    );
    if (stats == "Success") {
      context.showToast(msg: "User Registration Successfull");
      Get.to(
         const DoctorLoginView(),
      );
    } else {
      // ignore: use_build_context_synchronously
      context.showToast(msg: "User Registration Failed");
    }
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Text(
          'Doctor Signup',
          style: TextStyle(color: AppColors.whiteColor),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
       
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            child: Container(
              height: 950,
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
                    5.heightBox,
                    _image != null
                        ? CircleAvatar(
                            radius: 60, backgroundImage: MemoryImage(_image!))
                        : Container(
                            width: 120,
                            height: 120,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              AppAssets.profile,
                              fit: BoxFit.cover,
                            ),
                          ),
                    5.heightBox,
                    Container(
                      width: 300,
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          selectImage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.upload,
                                size: 40, color: AppColors.primaryColor),
                            AppStyles.normal(
                                title: AppStrings.uyp,
                                size: AppSize.size14,
                                color: AppColors.primaryColor)
                          ],
                        ),
                      ),
                    ),
                    5.heightBox,
                    CustomTextField(
                      textcontroller: nameController,
                      hint: AppStrings.name,
                      textColor: AppColors.primaryColor,
                    ),

                    5.heightBox,
                    CustomTextField(
                      textcontroller: genderController,
                      hint: AppStrings.gender,
                      textColor: AppColors.primaryColor,
                    ),
                    5.heightBox,
                    CustomTextField(
                      textcontroller: clinicController,
                      hint: AppStrings.clinic,
                      textColor: AppColors.primaryColor,
                    ),
                    5.heightBox,
                    CustomTextField(
                      textcontroller: drIdController,
                      hint: AppStrings.drId,
                      textColor: AppColors.primaryColor,
                    ),
                    5.heightBox,
                    CustomTextField(
                      textcontroller: categoryController,
                      hint: "Category",
                      textColor: AppColors.primaryColor,
                    ),
                    5.heightBox,
                    CustomTextField(
                      textcontroller: emailController,
                      hint: AppStrings.email,
                      textColor: AppColors.primaryColor,
                    ),
                    5.heightBox,
                    CustomTextField(
                      textcontroller: passwordController,
                      hint: AppStrings.password,
                      textColor: AppColors.primaryColor,
                    ),
                    5.heightBox,
                    CustomTextField(
                      textcontroller: phonenoController,
                      hint: AppStrings.phoneno,
                      textColor: AppColors.primaryColor,
                    ),
                    5.heightBox,
                    CustomTextField(
                      textcontroller: aboutController,
                      hint: "About",
                      textColor: AppColors.primaryColor,
                    ),
                    5.heightBox,
                    CustomTextField(
                      textcontroller: clinicTimingController,
                      hint: "Clinic Timing",
                      textColor: AppColors.primaryColor,
                    ),
                    5.heightBox,
                    CustomButton(
                      onTap: () {
                        regsiterUser();
                      },
                      buttontext: AppStrings.signup,
                      widt: 200,
                    ),
                    5.heightBox,
                    const Row(children: <Widget>[
                      Expanded(child: Divider()),
                      Text("Aleady have an account?"),
                      Expanded(child: Divider()),
                    ]),
                    5.heightBox,
                    CustomButton(
                        onTap: () {
                         Get.to( const DoctorLoginView());
                        },
                        buttontext: "Login"),
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
