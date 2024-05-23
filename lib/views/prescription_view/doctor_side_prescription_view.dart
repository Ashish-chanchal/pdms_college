
import 'package:pdms/consts/consts.dart';

class DoctorPresciptionView extends StatelessWidget {
  const DoctorPresciptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: AppStyles.normal(
              title: "Prescriptions",
              size: AppSize.size22,
              color: AppColors.whiteColor),
        ),
    );
  }
}