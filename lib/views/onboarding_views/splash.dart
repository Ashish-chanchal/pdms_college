import 'dart:async';

import 'package:pdms/consts/consts.dart';
import 'package:pdms/views/onboarding_views/onboarding_view.dart';

class Splash extends StatefulWidget { 
const Splash({super.key}); 

@override 
State<Splash> createState() => _SplashState(); 
} 

class _SplashState extends State<Splash> { 
  @override 
  void initState() { 
    super.initState(); 
  
    Timer( 
      const Duration(seconds: 7), 
      () => Navigator.pushReplacement( 
        context, 
        MaterialPageRoute( 
          builder: (context) => const OnboardingView(), 
        ), 
      ), 
    ); 
  } 

@override 
Widget build(BuildContext context) { 
	return Scaffold(
    
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
          Center(child: Image.asset(AppAssets.login, height: 400, width: 400 )),
          Container(
            width: double.infinity,
            height: 442,
            decoration: BoxDecoration(
              color: AppColors.bgColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                   CircularProgressIndicator(color: AppColors.primaryColor,),
                  Image.asset(AppAssets.logo, height: 300, width: 300 ),
                ],
              ),
            ),
          )
          
        ]),
      ),
    ); 
} 
} 
