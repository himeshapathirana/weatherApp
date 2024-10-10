import 'package:riverpod/riverpod.dart';
import 'package:weather/weather.dart';

class WeatherNotifier extends StateNotifier<AsyncValue<Weather?>> {
  WeatherNotifier() : super(const AsyncValue.data(null));

  final WeatherFactory _wf = WeatherFactory('086dc34152379810b7b85e9ec92891aa');

  Future<void> fetchWeather(String cityName) async {
    state = const AsyncValue.loading();
    try {
      final weather = await _wf.currentWeatherByCityName(cityName);
      state = AsyncValue.data(weather);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

final weatherProvider =
    StateNotifierProvider<WeatherNotifier, AsyncValue<Weather?>>((ref) {
  return WeatherNotifier();
});
