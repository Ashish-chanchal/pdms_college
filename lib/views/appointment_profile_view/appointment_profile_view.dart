
import 'package:pdms/consts/consts.dart';

class AppointmentProfileView extends StatelessWidget {
  const AppointmentProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Profile', style: TextStyle(color: AppColors.whiteColor)),
        backgroundColor: AppColors.primaryColor,
      ),
      body:Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      AppAssets.profile,
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    10.heightBox,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        AppStyles.bold(
                            title: "Patient Name",
                            size: AppSize.size18,
                            color: AppColors.primaryColor),
                        AppStyles.normal(
                            title: " Name",
                            size: AppSize.size18,
                            color: AppColors.primaryColor),
                       
                      ],
                    )
                  ],
                ),
                10.heightBox,
                ListTile(
                  onTap: () {},
                  title: AppStyles.bold(
                      title: "Phone Number",
                      size: AppSize.size14,
                      color: AppColors.textColor),
                  subtitle: AppStyles.normal(
                    title: "Phone Number",
                    size: AppSize.size12,
                    color: AppColors.textColor.withOpacity(0.5),
                  ),
                  trailing: Container(
                    width: 50,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.yellowColor,
                    ),
                    child: Icon(
                      Icons.call,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: AppStyles.bold(
                      title: "Email",
                      size: AppSize.size14,
                      color: AppColors.textColor),
                  subtitle: AppStyles.normal(
                    title: "Email",
                    size: AppSize.size12,
                    color: AppColors.textColor.withOpacity(0.5),
                  ),
                  trailing: Container(
                    width: 50,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.yellowColor,
                    ),
                    child: Icon(
                      Icons.email,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: AppStyles.bold(
                      title: "Location",
                      size: AppSize.size14,
                      color: AppColors.textColor),
                  subtitle: AppStyles.normal(
                    title: "Location",
                    size: AppSize.size12,
                    color: AppColors.textColor.withOpacity(0.5),
                  ),
                  trailing: Container(
                    width: 50,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.yellowColor,
                    ),
                    child: Icon(
                      Icons.location_on,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.heightBox,
                      AppStyles.bold(
                          title: "Problem",
                          size: AppSize.size14,
                          color: AppColors.textColor),
                      10.heightBox,
                      AppStyles.normal(
                          title: "Problem of Patient",
                          size: AppSize.size14,
                          color: AppColors.textColor),
                      10.heightBox,
                      AppStyles.bold(
                          title: "Selected Time",
                          size: AppSize.size14,
                          color: AppColors.textColor),
                      10.heightBox,
                      AppStyles.normal(
                          title: "Timing",
                          size: AppSize.size14,
                          color: AppColors.textColor),
                    ],
                  ),
                ),
                20.heightBox,
                
              ],
            ),
          ),
        )
    );
  }
}