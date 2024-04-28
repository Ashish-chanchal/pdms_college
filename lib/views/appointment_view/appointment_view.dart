
import 'package:pdms/consts/consts.dart';

import 'package:pdms/views/profile_view/doctor_profile_ptview.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // body:
        appBar: AppBar(
          title: Text('Your Appointments',
              style: TextStyle(color: AppColors.whiteColor)),
          backgroundColor: AppColors.primaryColor,
          
        ),
        body:          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: GestureDetector(
                           onTap: (){
                            //Get.to(()=>const DoctoreProfileptView(isbooked: true,));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                AppAssets.profile,
                                height: 80,
                                width: 80,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppStyles.bold(
                                        title: "Doctor Name",
                                        size: AppSize.size18,
                                        color: AppColors.primaryColor),
                                    AppStyles.normal(
                                        title: "Name",
                                        size: AppSize.size14,
                                        color: AppColors.primaryColor),
                                    AppStyles.bold(
                                        title: "Appointment Date/Time",
                                        size: AppSize.size18,
                                        color: AppColors.primaryColor),
                                    AppStyles.normal(
                                        title:
                                            "3:00 P.M., Tues Issue: Malaria symptoms",
                                        size: AppSize.size14,
                                        color: AppColors.primaryColor),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
      )
    );
  }
}
