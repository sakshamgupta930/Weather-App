import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Init State Called");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set State called");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("Widget Destroy");
  }

  @override
  Widget build(BuildContext context) {
    // var city_name = ["Mumbai", "Gwalior", "Chennai", "Dubai", "Canada"];
    // final _random = new Random();
    // var city = city_name[_random.nextInt(city_name.length)];

    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    String temp = (info['temp_value']).toString().substring(0, 4);
    String icon = info['icon_value'];
    String city = info['city_value'].toString();
    String hum = info['hum_value'];
    String air = (info['air_value']).toString().substring(0, 4);
    String des = info['des_value'];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: NewGradientAppBar(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue.shade300, Colors.blue.shade800])),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue.shade800,
                  Colors.blue.shade200,
                ]),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if ((searchController.text).replaceAll(" ", "") == "") {
                          print("Blank search");
                        } else {
                          Navigator.pushReplacementNamed(context, '/loading',
                              arguments: {
                                "searchText": searchController.text,
                              });
                        }
                      },
                      child: Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.blueAccent,
                        ),
                        margin: EdgeInsets.fromLTRB(0, 0, 6, 0),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Search any city name",
                          border: InputBorder.none,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      // padding: EdgeInsets.all(5),
                      margin: EdgeInsets.symmetric(horizontal: 22),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Image.network(
                              "http://openweathermap.org/img/wn/$icon@2x.png"),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              Text("$des",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              Text("In $city",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin:
                          EdgeInsets.symmetric(horizontal: 23, vertical: 10),
                      height: 260,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(WeatherIcons.thermometer, size: 25),
                              SizedBox(width: 10),
                              Text(
                                "Temperature",
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("$temp", style: TextStyle(fontSize: 100)),
                              Text("C", style: TextStyle(fontSize: 30)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.fromLTRB(20, 0, 5, 0),
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                WeatherIcons.day_windy,
                                size: 22,
                              ),
                              SizedBox(width: 12),
                              Text(
                                "Wind Speed",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Column(
                            children: [
                              Text("$air",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold)),
                              Text("Km/h",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.fromLTRB(5, 0, 20, 0),
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                WeatherIcons.humidity,
                                size: 22,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Humidity",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Column(
                            children: [
                              Text("$hum",
                                  style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold)),
                              Text("Percent",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Made By Saksham"),
                    Text("Data Provided by OpenWeatherMap.org")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
