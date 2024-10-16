import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit/weather_states.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherCubitState> {
  WeatherCubit(this.weatherService) : super(weatherLoading());

  WeatherService weatherService;

  Future<void> getWeather({required String cityName}) async {
    emit(weatherLoading());
    try {
      await weatherService.getWeather(cityName: cityName);
      emit(weatherSuccess());
    } on Exception catch (e) {
      emit(weatherFailure());

      // TODO
    }
  }
}
