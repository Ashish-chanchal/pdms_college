

import 'package:pdms/consts/consts.dart';
import 'package:pdms/views/category_view/category_detail_view.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: AppStyles.bold(
              title: "Category",
              size: AppSize.size22,
              color: AppColors.whiteColor),
          backgroundColor: AppColors.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 170),
            itemCount: iconlist.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => CategoryDetailsView(catName: categorylist[index],));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppColors.bgDarkCokor,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          iconlist[index],
                          width: 60,
                          color: Vx.randomPrimaryColor,
                        ),
                        20.heightBox,
                        AppStyles.bold(
                            title: categorylist[index],
                            size: 15,
                            color: AppColors.textColor),
                        10.heightBox,
                        AppStyles.normal(
                            title: "Specialist",
                            size: AppSize.size12,
                            color: AppColors.textColor.withOpacity(0.5)),
                      ]),
                ),
              );
            },
          ),
        ));
  }
}
