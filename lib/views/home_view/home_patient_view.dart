import 'package:pdms/components/custom_testfield.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/views/category_view/category_detail_view.dart';
import 'package:pdms/views/category_view/category_view.dart';
import 'package:pdms/views/doctors_view/doctors_view.dart';
import 'package:pdms/views/profile_view/doctor_profile_ptview.dart';

class HomePatientView extends StatelessWidget {
  const HomePatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Welcome Name', style: TextStyle(color: AppColors.whiteColor)),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: const EdgeInsets.all(14),
                color: AppColors.primaryColor,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hint: "Search Patient",
                        textColor: AppColors.whiteColor,
                        inputColor: AppColors.whiteColor,
                        borderColor: AppColors.whiteColor,
                      ),
                    ),
                    10.widthBox,
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.search, color: AppColors.whiteColor))
                  ],
                )),
            20.heightBox,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppStyles.bold(
                        title: "Category",
                        size: AppSize.size22,
                        color: AppColors.primaryColor),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => const CategoryView());
                        },
                        child: AppStyles.normal(
                            title: "See all",
                            size: AppSize.size16,
                            color: AppColors.primaryColor))
                  ]),
            ),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                children: List.generate(iconlist.length - 3, (index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(()=>CategoryDetailsView(catName: categorylist[index]));
                    },
                    child: Column(children: [
                      Image.asset(
                        iconlist[index],
                        width: 40,
                        color: Vx.randomPrimaryColor,
                      ),
                      10.heightBox,
                      AppStyles.normal(
                          title: categorylist[index],
                          size: AppSize.size16,
                          color: AppColors.primaryColor)
                    ]),
                  );
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppStyles.bold(
                        title: "Top Doctors",
                        size: AppSize.size22,
                        color: AppColors.primaryColor),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => const DoctorsView());
                        },
                        child: AppStyles.normal(
                            title: "See all",
                            size: AppSize.size16,
                            color: AppColors.primaryColor))
                  ]),
            ),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                  height: 150,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => const DoctoreProfileptView());
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColors.bgDarkCokor),
                            height: 150,
                            width: 150,
                            child: Column(children: [
                              Container(
                                width: 150,
                                alignment: Alignment.center,
                                color: AppColors.primaryColor,
                                child: Image.asset(
                                  AppAssets.onboarding1,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              5.heightBox,
                              AppStyles.normal(
                                title: "Doctor Name",
                                size: AppSize.size14,
                              ),
                              AppStyles.normal(
                                  title: "Doctor Speciality",
                                  size: AppSize.size14,
                                  color: Colors.black54)
                            ]),
                          ),
                        );
                      })),
            )
          ],
        ),
      ),
    );
  }
}
