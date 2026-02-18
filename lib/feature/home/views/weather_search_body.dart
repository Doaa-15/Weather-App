import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/core/theme/color_app.dart';
import 'package:weather_app/feature/home/model/model.dart';
import 'package:weather_app/feature/home/views/weather_app_body.dart';

class WeatherSearchBody extends StatefulWidget {
  const WeatherSearchBody({super.key, required this.weatherResponseList});
  final List<WeatherResponse> weatherResponseList;

  @override
  State<WeatherSearchBody> createState() => _WeatherSearchBodyState();
}

class _WeatherSearchBodyState extends State<WeatherSearchBody> {
  final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [ColorApp.primarycolor, ColorApp.thirdcolor],
          ),
        ),
        child: Column(
          children: [
            const Gap(70),

            Padding(
              padding: const EdgeInsets.all(8.0),

              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: "Enter Location",
                  suffix: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WeatherAppBody(city: searchController.text),
                        ),
                      );
                    },
                    child: const Icon(Icons.search),
                  ),
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: widget.weatherResponseList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 234, 174, 118),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: ListTile(
                        title: Text(
                          widget.weatherResponseList[index].location.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text(
                          "${widget.weatherResponseList[index].forecast.forecastday[0].day.maxTempC}° /  ${widget.weatherResponseList[index].forecast.forecastday[0].day.minTempC}°",
                        ),
                        trailing: Text(
                          "${widget.weatherResponseList[index].forecast.forecastday[0].day.maxTempC}°",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
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
      ),
    );
  }
}
