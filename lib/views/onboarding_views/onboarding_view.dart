import 'package:pdms/components/custom_button.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/views/login_view/login_view.dart';
import 'package:pdms/views/onboarding_views/onboarding_view_secound.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child:
                    Image.asset(AppAssets.onboarding1, height: 530, width: 530),
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
                        "Consult Only With a Doctor",
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
                                  Get.to(() => const LoginView(),transition: Transition.rightToLeftWithFade , duration: const Duration(milliseconds: 1000));
                                },
                                buttontext: "Skip"),
                            CustomButton(
                                onTap: () {
                                  Get.to(() => const OnboardingViewSecound(),transition: Transition.rightToLeftWithFade , duration: const Duration(milliseconds: 800));
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
  }
}
