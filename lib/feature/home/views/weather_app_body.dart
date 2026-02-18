import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:weather_app/core/theme/color_app.dart';
import 'package:weather_app/feature/home/cubit/home_cubit.dart';
import 'package:weather_app/feature/home/model/model.dart';
import 'package:weather_app/feature/home/views/forecast_details_body.dart';
import 'package:weather_app/feature/home/views/weather_search_body.dart';

class WeatherAppBody extends StatefulWidget {
  final String city;


  const WeatherAppBody({super.key, required this.city});

  @override
  State<WeatherAppBody> createState() => _WeatherAppBodyState();
}

class _WeatherAppBodyState extends State<WeatherAppBody> {


  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getWeather(city: widget.city);
  }
  WeatherResponse? weatherResponse;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(backgroundColor: Colors.red, content: Text("Error")),
          );
        } else if (state is HomeSuccess) {
         
            weatherResponse = state.weatherResponse;
        ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(
              backgroundColor: Colors.green,
              content: Text("Success"),
            ),
          );
        }
      },
      builder: (context, state) {
        
        return Scaffold(
          body: state is HomeLoading
              ? const Center(
   child: SpinKitFadingFour(
          color: ColorApp.primarycolor,
          size: 80.0,
        ),
)

              : state is HomeSuccess
              ? Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(state.image ??
                    "https://i.pinimg.com/736x/21/ca/6d/21ca6dbf87f607a65ee89fddba2cce41.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(50),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                      
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WeatherSearchBody(
                                weatherResponseList: state.weatherResponseList,
                              ),
                            ),
                          );
                        },
                    
                      icon: const Icon(Icons.search),
                    ),
                  ],
                ),
                const Gap(50),
                Text(
                  weatherResponse!.location.name,
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                Text(
                  "${weatherResponse!.current.tempC}°",
                  style: const TextStyle(fontSize: 70, fontWeight: FontWeight.w700),
                ),
                Text(
                  "clear ${weatherResponse!.forecast.forecastday[0].day.minTempC}° / ${weatherResponse!.forecast.forecastday[0].day.maxTempC}°",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                LiquidGlassLayer(
                  child: LiquidGlass(
                    shape: const LiquidRoundedSuperellipse(borderRadius: 30),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        "🌿 AQI 53",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                const Gap(360),
                Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8),
                  child: LiquidGlassLayer(
                    child: LiquidGlass(
                      shape: const LiquidRoundedSuperellipse(borderRadius: 30),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        width: MediaQuery.of(context).size.width,
                        height: 150,
                        child: Column(
                        
                          children: [
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                             const Text(
                                  "5-day forecast",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                               GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ForecastDetailsScreen(
          forecastList: weatherResponse!.forecast.forecastday,
        ),
      ),
    );
  },
  child: const Text(
    "More details ‣",
    style: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ),
),

                              ],
                            ),
                            SizedBox(
                              height: 100,
                              child: ListView.builder(
                                itemCount: 2,
                                itemBuilder: (context, index) {
                              
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                       Text(
                                        "🌤️ ${weatherResponse!.forecast.forecastday[index].date}",
                                        style:const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        "${weatherResponse!.forecast.forecastday[index].day.maxTempC}° / ${weatherResponse!.forecast.forecastday[index].day.minTempC}°",
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ) : Center(child: Text("Error")),
        );
      },
    );
  }
}
