
import 'package:pdms/consts/consts.dart';
import 'package:pdms/views/profile_view/doctor_profile_ptview.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors', style: TextStyle(color: AppColors.whiteColor)),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                    crossAxisCount: 2,  
                    crossAxisSpacing: 4.0,  
                    mainAxisSpacing: 4.0  ,
                    
                ),itemCount: doctors.length, itemBuilder: (BuildContext context,int index){
                  return GestureDetector(
                          onTap: () {
                           // Get.to(() => const DoctoreProfileptView());
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
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.primaryColor,
                                ),
                                width: 150,
                                alignment: Alignment.center,
                                
                                child: Image.asset(
                                  AppAssets.onboarding1,
                                  width: 100,
                                  height: 100,
                                  
                                ),
                              ),
                              5.heightBox,
                              AppStyles.normal(
                                title: doctors[index].name,
                                size: AppSize.size14,
                              ),
                              AppStyles.normal(
                                  title: doctors[index].specialty,
                                  size: AppSize.size14,
                                  color: Colors.black54)
                            ]),
                          ),
                        );
                
                  
                }),
      ),
      
    );
  }
}
