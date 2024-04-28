
import 'package:pdms/views/profile_view/doctor_profile_ptview.dart';


import 'package:pdms/consts/consts.dart';

class CategoryDetailsView extends StatelessWidget {
  final String catName;
  const CategoryDetailsView({super.key, required this.catName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: AppStyles.bold(
              title: catName,
              size: AppSize.size22,
              color: AppColors.whiteColor),
          backgroundColor: AppColors.primaryColor,
        ),
        body:  Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: 170,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8),
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 8),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.bgDarkCokor),
                        height: 150,
                        width: 150,
                        child: Column(children: [
                          Container(
                            alignment: Alignment.center,
                            color: AppColors.primaryColor,
                            child: Image.asset(
                              AppAssets.onboarding3,
                              width: 70,
                              height: 120,
                            ),
                          ),
                          5.heightBox,
                          AppStyles.normal(
                            title: "Doctor Name",
                            size: AppSize.size14,
                          ),
                          
                        ]),
                      ).onTap(() {
                       // Get.to(() => const DoctoreProfileptView());
                      });
                    }),
              ));
            }
          }
        
  

