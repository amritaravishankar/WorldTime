import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';


class ChooseLocation extends StatelessWidget {
  static List<int> favCheck = [0,0,0,0,0,0,0,0,0,0,0,0,0,0];
  static List<WorldTime> favourite = List();
  static List<int> defaultCheck = [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0];
  static String defaultLoc = "Mumbai";

  static List<WorldTime> locations = [
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Asia/Kuala_Lumpur', location: 'Kuala Lumpur', flag: 'malaysia.png'),
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los Angeles', flag: 'usa.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Mumbai', flag: 'india.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Singapore', location: 'Singapore', flag: 'singapore.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Shanghai', location: 'Shanghai', flag: 'china.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(child:Text(''));
  }
}