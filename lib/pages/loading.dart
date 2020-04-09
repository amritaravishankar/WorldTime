import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/pages/default_location.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String defaultLocation = 'Mumbai'; //link back default location
  String defaultUrl = 'Asia/Kolkata';
  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: defaultLocation , flag: '1200px-Flag_of_India.svg.png', url: defaultUrl);
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: SpinKitChasingDots(
              color: Colors.white,
              size: 50.0,
            )
        )
    );
  }
}