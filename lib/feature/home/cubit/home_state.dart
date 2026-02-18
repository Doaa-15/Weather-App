part of 'home_cubit.dart';

@immutable
sealed class HomeState {}
//intial
final class HomeInitial extends HomeState {}
//loading
final class HomeLoading extends HomeState {}
//Success
final class HomeSuccess extends HomeState {
  final WeatherResponse weatherResponse;
  final List<WeatherResponse> weatherResponseList;
  final String image;

  HomeSuccess({required this.weatherResponse, required this.weatherResponseList,required this.image, });
}
//error
final class HomeError extends HomeState {
  final String error;

  HomeError({required this.error});
}
