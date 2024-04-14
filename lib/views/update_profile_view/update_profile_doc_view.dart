
import 'package:pdms/components/custom_button.dart';
import 'package:pdms/components/custom_testfield.dart';
import 'package:pdms/consts/consts.dart';

class UpdateProfileDocView extends StatelessWidget {
  const UpdateProfileDocView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile', style: TextStyle(color: AppColors.whiteColor)),
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
                           AppStyles.normal(title: AppStrings.uyp, size: AppSize.size14, color: AppColors.primaryColor)
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: AppStrings.name,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: AppStrings.experience,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: AppStrings.gender,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: AppStrings.clinic,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: AppStrings.drId,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: "Category",
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: AppStrings.email,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomTextField(
                      hint: AppStrings.phoneno,
                      textColor: AppColors.primaryColor,
                    ),
                    10.heightBox,
                    CustomButton(
                      onTap: () {},
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