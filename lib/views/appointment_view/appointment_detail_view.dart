import 'package:pdms/consts/consts.dart';

class AppointmentDetailView extends StatelessWidget {
  const AppointmentDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text(
            'Book Appointment',
            style: TextStyle(color: AppColors.whiteColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
        ));
  }
}
