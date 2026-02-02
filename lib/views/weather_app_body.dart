import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';

import 'package:weather_app/screens/weather_search_screen.dart';

class WeatherAppBody extends StatelessWidget {
  const WeatherAppBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration:const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://i.pinimg.com/736x/21/ca/6d/21ca6dbf87f607a65ee89fddba2cce41.jpg",
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        const  Gap(50),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WeatherSearchScreen()),
                  );
                },
                icon:const Icon(Icons.search),
              ),
            ],
          ),
        const  Gap(50),
        const  Text(
            "Cairo",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
          ),
        const  Text(
            "38°",
            style: TextStyle(fontSize: 70, fontWeight: FontWeight.w700),
          ),
          const Text(
            "clear  38° / 25°",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          LiquidGlassLayer(
            child: LiquidGlass(
              shape:const LiquidRoundedSuperellipse(borderRadius: 30),
              child: Container(
                padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child:const Text(
                  "🌿 AQI 53",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ),

      const    Gap(360),
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: LiquidGlassLayer(
              child: LiquidGlass(
                shape:const LiquidRoundedSuperellipse(borderRadius: 30),
                child: Container(
                  padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child:const Column(
                    spacing: 20,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "5-day forecast",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "More details ‣",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "🌤️ Mon clear",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "39° / 26°",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "☀️ Tue clear",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "39° / 26°",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
