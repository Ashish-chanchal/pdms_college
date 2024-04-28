import 'package:pdms/chat_view/chat_view.dart';
import 'package:pdms/consts/consts.dart';


import 'package:pdms/views/home_view/home_doctor_view.dart';
import 'package:pdms/views/profile_view/doctore_profile._view.dart';

class BottomNavDocView extends StatefulWidget {

   const BottomNavDocView({super.key});

  @override
  State<BottomNavDocView> createState() => _HomeState();
}

class _HomeState extends State<BottomNavDocView> {
  int selectedIndex = 0;
  List screenslist = [
    const HomeDoctorView(),
     const DoctoreProfileView(),
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
          unselectedIconTheme:
              IconThemeData(color: AppColors.whiteColor.withOpacity(0.5)),
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'CareLink'),
          ]),
    );
  }
}
