import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'weather_provider.dart';

/*
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WeatherFactory _wf = WeatherFactory(OPENWEATHER_API_KEY);
  Weather? _weather;
  final TextEditingController _cityController =
      TextEditingController(); // Controller for city input
  String? _cityName; // To hold the user-entered city name

  @override
  void initState() {
    super.initState();
  }

  void _fetchWeather() {
    if (_cityName != null && _cityName!.isNotEmpty) {
      _wf.currentWeatherByCityName(_cityName!).then((w) {
        setState(() {
          _weather = w;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _cityController,
                decoration: const InputDecoration(
                  labelText: "Enter City",
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) {
                  setState(() {
                    _cityName = value;
                    _fetchWeather();
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _cityName = _cityController.text;
                    _fetchWeather();
                  });
                },
                child: const Text("Get Weather"),
              ),
              const SizedBox(height: 20),
              _buildUI(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUI() {
    if (_weather == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          __locationHeader(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          _dateTimeInfo(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          _weatherIcon(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          _currentTem(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          _extraInfo(),
        ],
      ),
    );
  }

  Widget __locationHeader() {
    return Text(
      _weather?.areaName ?? "",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _dateTimeInfo() {
    if (_weather == null || _weather!.date == null) {
      return const Text('Date not available');
    }

    DateTime now = _weather!.date!;

    return Column(
      children: [
        Text(
          DateFormat("h:mm a").format(now),
          style: const TextStyle(
            fontSize: 35,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateFormat("EEEE").format(now),
              style: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              " ${DateFormat("d.M.y").format(now)}", // Corrected date format
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _weatherIcon() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.20,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "http://openweathermap.org/img/wn/${_weather?.weatherIcon}@4x.png"),
            ),
          ),
        ),
        Text(
          _weather?.weatherDescription ?? "",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _currentTem() {
    return Text(
      "${_weather?.temperature?.celsius?.toStringAsFixed(0) ?? '--'}° C", // Added null safety for temperature
      style: const TextStyle(
        color: Colors.black,
        fontSize: 90,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _extraInfo() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.80,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 69, 68, 70),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Max: ${_weather?.tempMax?.celsius?.toStringAsFixed(0) ?? '--'}° C",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              Text(
                "Min: ${_weather?.tempMin?.celsius?.toStringAsFixed(0) ?? '--'}° C",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Wind: ${_weather?.windSpeed?.toStringAsFixed(0) ?? '--'} m/s",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              Text(
                "Humidity: ${_weather?.humidity?.toStringAsFixed(0) ?? '--'}%",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}*/

class HomePage extends ConsumerWidget {
  HomePage({Key? key}) : super(key: key);

  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _cityController,
                decoration: const InputDecoration(
                  labelText: "Enter City",
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) => _fetchWeather(ref, value),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _fetchWeather(ref, _cityController.text),
                child: const Text("Get Weather"),
              ),
              const SizedBox(height: 20),
              _buildUI(context, weatherState),
            ],
          ),
        ),
      ),
    );
  }

  void _fetchWeather(WidgetRef ref, String cityName) {
    if (cityName.isNotEmpty) {
      ref.read(weatherProvider.notifier).fetchWeather(cityName);
    }
  }

  Widget _buildUI(BuildContext context, AsyncValue<Weather?> weatherState) {
    return weatherState.when(
      data: (weather) {
        if (weather == null) {
          return const Center(child: Text("Enter a city to get weather info"));
        }
        return _buildWeatherInfo(context, weather);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text("Error: $error")),
    );
  }

  Widget _buildWeatherInfo(BuildContext context, Weather weather) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _locationHeader(weather),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          _dateTimeInfo(weather),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          _weatherIcon(weather),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          _currentTemp(weather),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          _extraInfo(context, weather),
        ],
      ),
    );
  }

  Widget _locationHeader(Weather weather) {
    return Text(
      weather.areaName ?? "",
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _dateTimeInfo(Weather weather) {
    if (weather.date == null) {
      return const Text('Date not available');
    }

    DateTime now = weather.date!;

    return Column(
      children: [
        Text(
          DateFormat("h:mm a").format(now),
          style: const TextStyle(fontSize: 35),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateFormat("EEEE").format(now),
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
            Text(
              " ${DateFormat("d.M.y").format(now)}",
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ],
    );
  }

  Widget _weatherIcon(Weather weather) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 160, // Fixed height instead of using MediaQuery
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "http://openweathermap.org/img/wn/${weather.weatherIcon}@4x.png",
              ),
            ),
          ),
        ),
        Text(
          weather.weatherDescription ?? "",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _currentTemp(Weather weather) {
    return Text(
      "${weather.temperature?.celsius?.toStringAsFixed(0) ?? '--'}° C",
      style: const TextStyle(
        color: Colors.black,
        fontSize: 90,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _extraInfo(BuildContext context, Weather weather) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      width: MediaQuery.of(context).size.width * 0.80,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 69, 68, 70),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Max: ${weather.tempMax?.celsius?.toStringAsFixed(0) ?? '--'}° C",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              Text(
                "Min: ${weather.tempMin?.celsius?.toStringAsFixed(0) ?? '--'}° C",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Wind: ${weather.windSpeed?.toStringAsFixed(0) ?? '--'} m/s",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              Text(
                "Humidity: ${weather.humidity?.toStringAsFixed(0) ?? '--'}%",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          )
        ],
      ),
    );
  }
}
