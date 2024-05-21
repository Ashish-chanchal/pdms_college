
import 'package:pdms/components/custom_button.dart';
import 'package:pdms/components/custom_testfield.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/resources/auth_user.dart';


class UpdateProfilePatient extends StatefulWidget {
  final String username;
  final String age;
  final String gender;
  final String address;
  final String phone;
  // ignore: prefer_typing_uninitialized_variables
  final imageUrl;

  const UpdateProfilePatient(
      {super.key,
      required this.username,
      required this.age,
      required this.address,
      required this.gender,
      required this.phone,
      required this.imageUrl
      });
  @override
  State<UpdateProfilePatient> createState() => _UpdateProfilePatientState();
}

class _UpdateProfilePatientState extends State<UpdateProfilePatient> {
  @override
  Widget build(BuildContext context) {
   
    final TextEditingController nameController = TextEditingController();
    final TextEditingController ageController = TextEditingController();
    final TextEditingController genderController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController phonenoController = TextEditingController();
    nameController.text = widget.username;
    ageController.text = widget.age;
    genderController.text = widget.gender;
    addressController.text = widget.address;
    phonenoController.text = widget.phone;
   

    updateUserIn() {
      StoreData().updateUser(
        name: nameController.text,
        age: ageController.text,
        gender: genderController.text,
        address: addressController.text,
        phone: phonenoController.text,
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
              height: 900,
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
                    CustomTextField(
                      hint: AppStrings.age,
                      textcontroller: ageController,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: AppStrings.gender,
                      textcontroller: genderController,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: AppStrings.address,
                      textcontroller: addressController,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: AppStrings.phoneno,
                      textcontroller: phonenoController,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomButton(
                      onTap: () {
                        updateUserIn();
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
