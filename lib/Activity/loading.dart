import 'package:flutter/material.dart';
import 'package:mausam_app/Worker/worker.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "Gwalior";
  String? temp;
  String? hum;
  String? air;
  String? des;
  String? main;
  String? icon;

  void startApp() async {
    worker instance = worker(location: city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air = instance.air_speed;
    main = instance.weather;
    des = instance.description;
    icon = instance.icon;

    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'temp_value': temp,
        'des_value': des,
        'hum_value': hum,
        'main_value': main,
        'air_value': air,
        'icon_value': icon,
        'city_value': city
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    startApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map search = ModalRoute.of(context)!.settings.arguments as Map;
    if (search?.isNotEmpty ?? false) {
      city = search['searchText'];
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 180),
              Image.asset(
                "assets/images/weatherlogo.png",
                height: 230,
                width: 200,
              ),
              Text("Mausam App",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              SizedBox(height: 10),
              Text(
                "Produced By Saksham",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(height: 30),
              SpinKitFoldingCube(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[400],
    );
  }
}
