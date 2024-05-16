

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/resources/home_controller.dart';
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
          child: FutureBuilder<QuerySnapshot>(
            future: HomeController().getDoctorList(),
            builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator());
              }
              else if(snapshot.data!.docs.isEmpty){
                return const Center(child: Text("No Doctors"));
              }
              var data = snapshot.data?.docs;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                ),
                itemCount: data?.length??0,
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: (){
                      Get.to(() => CategoryDetailsView(catName: data[index]['category']));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.bgDarkCokor
                      ),
                      height: 150,
                      width: 150,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.primaryColor
                            ),
                            width: 150,
                            alignment: Alignment.center,
                            child: Image.network(
                               data![index]['imageUrl'],
                              width: 100,
                              height: 120,
                            ),
                          ),
                          10.heightBox,
                          AppStyles.bold(
                              title: data[index]['category'],
                              size: AppSize.size18,
                              color: AppColors.primaryColor),
                        ],
                      ),
                    ),
                  );
                },
              );

            },
           
          ),
        ));
  }
}
