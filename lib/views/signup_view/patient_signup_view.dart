
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdms/components/custom_button.dart';
import 'package:pdms/components/custom_testfield.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/resources/auth_user.dart';
import 'package:pdms/utils/utils.dart';

import 'package:pdms/views/login_view/patient_login_view.dart';

class PatientSignupView extends StatefulWidget {
  const PatientSignupView({super.key});

  @override
  State<PatientSignupView> createState() => _PatientSignupViewState();
}

class _PatientSignupViewState extends State<PatientSignupView> {
 
  Uint8List? _image;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phonenoController = TextEditingController();

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void regsiterUser() async {
    
    String stat = await StoreData().signupUser(
        name: nameController.text,
        age: ageController.text,
        gender: genderController.text,
        address: addressController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: phonenoController.text,
        file: _image!);

    if (stat == "Success") {
      context.showToast(msg: "User Registration Successfull");
      Get.to(
        const PatientLoginView(),
      );
    } else {
      // ignore: use_build_context_synchronously
      context.showToast(msg: "User Registration Failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Text(
          'Patient Signup',
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
                    10.heightBox,
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
                    10.heightBox,
                    Container(
                      width: 300,
                      alignment: Alignment.center,
                      child: GestureDetector(
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
                        onTap: () {
                          selectImage();
                        },
                      ),
                    ),
                    10.heightBox,
                    CustomTextField(
                      textcontroller: nameController,
                      hint: AppStrings.name,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      textcontroller: ageController,
                      hint: AppStrings.age,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      textcontroller: genderController,
                      hint: AppStrings.gender,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      textcontroller: addressController,
                      hint: AppStrings.address,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      textcontroller: emailController,
                      hint: AppStrings.email,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      textcontroller: passwordController,
                      hint: AppStrings.password,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      textcontroller: phonenoController,
                      hint: AppStrings.phoneno,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomButton(
                      onTap: () {
                        regsiterUser();
                      },
                      buttontext: AppStrings.signup,
                      widt: 200,
                    ),
                    10.heightBox,
                    const Row(children: <Widget>[
                      Expanded(child: Divider()),
                      Text("Already have an account?"),
                      Expanded(child: Divider()),
                    ]),
                    10.heightBox,
                    CustomButton(
                        onTap: () {
                          Get.to(const PatientLoginView(),
                              transition: Transition.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 1000));
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
