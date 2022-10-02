import 'dart:convert';

import 'package:http/http.dart' as http;

class worker {
  String? location;

  //Constructor
  worker({this.location}) {
    location = this.location;
  }

  String? temp;
  String? humidity;
  String? air_speed;
  String? weather;
  String? description;
  String? icon;

  Future<void> getData() async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=611ba3ac28a8e48d32ed7982ea6206e8"));
      Map data = jsonDecode(response.body);

      //Getting Temperature
      Map temp_data = data['main'];
      double getTemp = temp_data['temp'] - 273.15;

      //Getting humidity
      String getHumidity = temp_data['humidity'].toString();

      //Getting airspeed
      Map wind_data = data['wind'];
      double getAir_speed = wind_data['speed'] / 0.27777777777778;

      //Getting Weather "main" & "Description"
      List weather_list = data['weather'];
      Map weather_data = weather_list[0];
      String getMain = weather_data['main'];
      String getDesc = weather_data['description'];
      String geticon = weather_data["icon"].toString();

      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = getAir_speed.toString();
      weather = getMain;
      description = getDesc;
      icon = geticon;
    } catch (e) {
      temp = "Can't Find Data";
      humidity = "Can't Find Data";
      air_speed = "Can't Find Data";
      weather = "Can't Find Data";
      description = "Can't Find Data";
      icon = "03n";
    }
  }
}
