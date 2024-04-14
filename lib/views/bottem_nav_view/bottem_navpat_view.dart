import 'package:pdms/chat_view/chat_view.dart';
import 'package:pdms/consts/consts.dart';
import 'package:pdms/views/appointment_view/appointment_view.dart';
import 'package:pdms/views/category_view/category_view.dart';
import 'package:pdms/views/home_view/home_patient_view.dart';

import 'package:pdms/views/profile_view/patient_profile_view.dart';


class BottomNavPatView extends StatefulWidget {
  const BottomNavPatView({super.key});

  @override
  State<BottomNavPatView> createState() => _HomeState();
}

class _HomeState extends State<BottomNavPatView> {
  int selectedIndex = 0;
  List screenslist = [
    const HomePatientView(),
    const CategoryView(),
    const AppointmentView(),
    
     const PatientProfileView(),
      const ChatView()
   
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenslist.elementAt(selectedIndex),
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.whiteColor,
        unselectedItemColor: AppColors.whiteColor.withOpacity(0.5),
        backgroundColor: AppColors.primaryColor,
       selectedIconTheme: IconThemeData(color: AppColors.whiteColor),
        unselectedIconTheme: IconThemeData(color: AppColors.whiteColor.withOpacity(0.5)),
        onTap: (value){
          setState(() {
            selectedIndex = value;
          });
        },
        items:const [
        
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Category'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Appointment'),
        
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'CareLink'),]),
    );
  }
}
