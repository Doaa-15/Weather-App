
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/core/theme/color_app.dart';
import 'package:weather_app/widgets/custom_list_tile.dart';

class WeatherSearchBody extends StatelessWidget {
  const WeatherSearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration:const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [ColorApp.primarycolor, ColorApp.thirdcolor],
        ),
      ),
      child: Column(
 
        children: [
     const     Gap(70),
     
          Padding(
            padding: const EdgeInsets.all(8.0),
            
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: "Enter Location",
                prefix:const Icon(Icons.search),
              ),
            ),
          ),
  
          Expanded(
            child: ListView.builder(
              itemCount: customListTile.length,
              itemBuilder: (context, index) {
                return Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorApp.primarycolor,
                      borderRadius: BorderRadius.circular(8)
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: ListTile(
                      title: Text(customListTile[index].title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,)),
                      subtitle: Text(customListTile[index].subtittle),
                      trailing: Text(customListTile[index].trailing,
                            style:const TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,)),
                    ),
                  ),
                );
              },
            ),
          ),
         
    SizedBox(
  width: MediaQuery.of(context).size.width,
 
  child: SvgPicture.asset(
    'assets/images/image.svg',
   // fit: BoxFit.cover,
       fit: BoxFit.fill,
  ),
),


        ],
      ),
    );
  }
}
