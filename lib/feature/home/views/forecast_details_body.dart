import 'package:flutter/material.dart';
import 'package:weather_app/core/theme/color_app.dart';

import 'package:weather_app/feature/home/model/model.dart';

class ForecastDetailsScreen extends StatelessWidget {
  final List<ForecastDay> forecastList;

  const ForecastDetailsScreen({super.key, required this.forecastList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  ColorApp.thirdcolor,
      appBar: AppBar(
        backgroundColor: ColorApp.primarycolor,
        elevation: 0,
        title: const Text("5-Day Forecast"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: forecastList.length,
        itemBuilder: (context, index) {
       
          
          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
    
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
               
                    const SizedBox(height: 4),
                    Text(
                      forecastList[index].date,
                        style: const TextStyle(
                        color: Colors.black,
                         fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),

        
                Row(
                  children: [
                    Text(
                      "${ forecastList[index].day.maxTempC}°",
                      style: const TextStyle(
                       color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "${ forecastList[index].day.minTempC}°",
                      style: const TextStyle(
                        color: Colors.black,
                         fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
