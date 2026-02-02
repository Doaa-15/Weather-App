import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/core/theme/color_app.dart';
import 'package:weather_app/screens/weather_app_screen.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            width: double.infinity,
      height: double.infinity,
      decoration:const BoxDecoration(
        gradient: LinearGradient(
         begin: Alignment.topLeft,
          colors: [
          
ColorApp.primarycolor,
ColorApp.thirdcolor

        ])
      ),
  
      child: Column(
 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
   const  Gap(100),
SvgPicture.asset(
      'assets/images/logo.svg',
      semanticsLabel: 'Dart Logo',
       height: 200,
    ),
 const  Text("weather",style:TextStyle( color: Colors.black,fontSize: 40,fontWeight: FontWeight.w700) ,),
 const  Text("@wolf",style:TextStyle( color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w400)),
   const  Gap(250),
InkWell(
  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const WeatherAppScreen())),
  child: Container(
    padding:const EdgeInsets.all(8),
    width: 150,
    height: 50,
     decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
          gradient:const LinearGradient(
           begin: Alignment.topLeft,
            colors: [
  ColorApp.primarycolor,
  ColorApp.thirdcolor
  
          ])
        ),
        child:const Text("Let`s Start",style:TextStyle( color: Colors.white,fontSize: 24,fontWeight: FontWeight.w700)) ,
  ),
),



  
        ],
      ),
    );
  }
}