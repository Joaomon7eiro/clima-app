import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';

const apiKey = '45c35be95123b56da247f8fd184f783e';
const openMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    return await networkHelper.getData();
  }

  Future<dynamic> getCityData(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        url: '$openMapUrl?q=$cityName&appid=$apiKey&units=metric');

    return await networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'Tempo bom para um 🍦';
    } else if (temp > 20) {
      return 'Já pode vestir um shorts e uma 👕';
    } else if (temp < 10) {
      return 'Você vai precisar de um 🧣 e uma 🧤';
    } else {
      return 'Pega uma 🧥 só pra garantir';
    }
  }
}
