import 'package:pdms/components/custom_button.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/views/onboarding_views/onboarding_view_third.dart';

class OnboardingViewSecound extends StatelessWidget {
  const OnboardingViewSecound({super.key});
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child:
                    Image.asset(AppAssets.onboarding2, height: 530, width: 530),
              ),
            ),
            Container(
                height: 290,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Text(
                        "Find Lots of Specialist Doctors at One Place",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor),
                      ).p16(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomButton(
                                onTap: () {
                                  Get.back();
                                },
                                buttontext: "Back"),
                            CustomButton(
                                onTap: () {
                                  Get.to(() => const OnboardingViewThird(),
                                      transition: Transition.rightToLeftWithFade,
                                      duration:
                                          const Duration(milliseconds: 800));
                                },
                                buttontext: "Next "),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
    return scaffold;
  }
}
