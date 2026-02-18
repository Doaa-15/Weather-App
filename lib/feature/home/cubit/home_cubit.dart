import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/feature/home/model/model.dart';

part 'home_state.dart';

class HomeCubit
    extends
        Cubit<HomeState> // cubit from HomeState type
        {
  HomeCubit() : super(HomeInitial()); //HomeInitial is initial state
  final String baseUrl = "http://api.weatherapi.com/v1/";
  final String apiKey = "d209b07dd82c44d3963110422261702";
  Dio dio = Dio();
  List<WeatherResponse> weatherResponseList = []; //list to add response
  Future<WeatherResponse> getWeather({required String city}) async {
    emit(HomeLoading()); //if loading
    try {
      String image = await getImage(city);
      //request
      Response response = await dio.get(
        "${baseUrl}forecast.json?key=$apiKey&q=$city&days=5&aqi=no&alerts=no",
      );
      WeatherResponse weatherResponse = WeatherResponse.fromJson(response.data);
      weatherResponseList.add(weatherResponse); //add response
      emit(
        //if success
        HomeSuccess(
          weatherResponse: weatherResponse,
          weatherResponseList: weatherResponseList,
          image: image,
        ),
      );
      return weatherResponse; 
    } catch (e) {
      // if error
      emit(HomeError(error: e.toString()));
      throw Exception('failed: $e');
    }
  }

  Future getImage(String city) async {
    try {
      Response response = await dio.get(
        "https://api.pexels.com/v1/search?query=$city",
        options: Options(
          headers: {
            'Authorization':
                "rUIrg8fLbZPCKG0FYaMvJA7KwPhf3zRtX4ezYsZNpTt08FYEIdiCgvTh",
          },
        ),
      );
return response.data['photos'][0]['src']['portrait'];
    } catch (e) {
      throw Exception("Failed $e");
    }
  }
}
