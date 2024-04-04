import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

void main() {
  /// Important variables
  const apiKey = "e91a2a20f841cb3b69fb2d5626977bb9";
  String cityName = getUserInput('Shahar nomini kiriting: ');
  final url = Uri.parse(ourUrl(cityName, apiKey));

  http.get(url).then((data) {
    final decodedData = jsonDecode(data.body);
    if (decodedData['cod'] == 200) {
      print("""Ob-havo ma'lumoti:
${decodedData['weather'][0]['main']} - ${decodedData['weather'][0]['description']}
Harorat: ${double.parse((decodedData['main']['temp'] - 273.15).toString()).toStringAsFixed(2)} \u2103
Harorat tuyulishi: ${double.parse((decodedData['main']['feels_like'] - 273.15).toString()).toStringAsFixed(2)} \u2103
Namlik: ${(decodedData['main']['humidity'])}
Shamol tezligi: ${(decodedData['wind']['speed'])}""");
    } else if (decodedData['cod'] == 404) {
      print('Shahar topilmadi.⚠️');
    } else {
      print('Kutilmagan xatolik.❌');
    }
  });
}

/// Utils
String getUserInput(String message) {
  print(message);
  String? userInput = stdin.readLineSync();
  while (userInput == null || userInput.trim().isEmpty) {
    stdout.write(message);
    userInput = stdin.readLineSync();
  }
  return userInput;
}

String ourUrl(String cityName, String apiKey) {
  return "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey";
}
