
import 'package:pdms/consts/consts.dart';
import 'package:pdms/views/home_view/past_appointement_view.dart';
import 'package:pdms/views/home_view/present_appointmets_view.dart';

class HomeDoctorView extends StatelessWidget {
  const HomeDoctorView({super.key});

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
          bottom: TabBar(
            tabs: <Widget>[
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('Today',style: TextStyle(color: AppColors.whiteColor) ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('Past',style: TextStyle(color: AppColors.whiteColor)),
              ),
            ],
            
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            PresentAppointmentView(),
            PastAppointmentView()
            
          ],
        )
      )
    );
  }
}
