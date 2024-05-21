
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/resources/home_controller.dart';
import 'package:pdms/views/profile_view/doctor_profile_ptview.dart';


class SearchPtView extends StatelessWidget {
  final String searchQuery;
  const SearchPtView({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            'Search Results',
            style: TextStyle(color: AppColors.whiteColor),
          ),
        ),
        body:Padding(
                  padding: const EdgeInsets.all(12.0),
          child: FutureBuilder<QuerySnapshot>(
                    future: HomeController().getCategory(searchQuery),
                    builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
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
                              Get.to(() => DoctoreProfileptView(doc: data[index]));
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
                                    title: data[index]['name'],
                                    size: AppSize.size18,
                                    color: AppColors.primaryColor
                                  ),
                                  5.heightBox,
                                  AppStyles.normal(
                                    title: data[index]['category'],
                                    size: AppSize.size16,
                                    color: AppColors.primaryColor
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                      );
          
                    },
                     
                  ),
        ),
        
        
    );
  }
}
