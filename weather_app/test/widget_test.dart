import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
// Make sure this import path correctly points to your Weather model.
// This path assumes your pubspec.yaml name is 'weather_app'.
import 'package:weather_app/models/weather.dart';

void main() {
  // A test group for all tests related to the Weather.fromJson factory
  group('Weather.fromJson', () {

    // A single test case to verify parsing of a valid JSON object
    test('should correctly parse a realistic OpenWeatherMap JSON response for Manila', () {
      // 1. ARRANGE: Define a realistic JSON string based on the OpenWeatherMap API structure.
      // This sample includes all fields that the Weather model is expected to parse.
      final String jsonString = '''
      {
        "coord": {
          "lon": 120.9822,
          "lat": 14.6042
        },
        "weather": [
          {
            "id": 801,
            "main": "Clouds",
            "description": "few clouds",
            "icon": "02d"
          }
        ],
        "base": "stations",
        "main": {
          "temp": 30.25,
          "feels_like": 35.25,
          "temp_min": 30.25,
          "temp_max": 30.25,
          "pressure": 1010,
          "humidity": 66
        },
        "visibility": 10000,
        "wind": {
          "speed": 3.6,
          "deg": 90
        },
        "clouds": {
          "all": 20
        },
        "dt": 1673494800,
        "sys": {
          "type": 1,
          "id": 8160,
          "country": "PH",
          "sunrise": 1673474925,
          "sunset": 1673516587
        },
        "timezone": 28800,
        "id": 1701668,
        "name": "Manila",
        "cod": 200
      }
      ''';

      // 2. ACT: Decode the JSON string into a Map and use the fromJson factory.
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      final Weather weather = Weather.fromJson(jsonMap);

      // 3. ASSERT: Verify that the Weather object was created with the correct data.
      // Check if the object is of the correct type.
      expect(weather, isA<Weather>());

      // Check each property of the Weather object to ensure it was parsed correctly.
      expect(weather.city, 'Manila');
      expect(weather.temperature, 30.25);
      expect(weather.description, 'Clouds'); // Based on json['weather'][0]['main']
      expect(weather.humidity, 66);
      expect(weather.windSpeed, 3.6);
      expect(weather.icon, '02d');
    });
  });
}
