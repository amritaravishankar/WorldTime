import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for UI
  String time; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  String isDaytime; // true or false if daytime or not

  WorldTime({ this.location, this.flag, this.url });

  String setDayTime(DateTime time) {

    if(time.hour>6 && time.hour<12)
    {
      return 'morning';
    }

    else if(time.hour>=12 && time.hour<16)
    {
      return 'afternoon';
    }

    else if(time.hour>=16 && time.hour<19)
    {
      return 'evening';
    }

    else
    {
      return 'night';
    }
  }

  Future<void> getTime() async {

    try{
      // make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3);
      String offsetMinutes = data['utc_offset'].substring(4,6);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      Duration duration = Duration(hours: int.parse(offset), minutes: int.parse(offsetMinutes));
      now = now.add(duration);

      // set the time property
      isDaytime = setDayTime(now);
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print(e);
      time = 'could not get time';
    }

  }

}