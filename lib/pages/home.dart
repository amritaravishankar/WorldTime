import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum OptionsMenu {settings}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  String setBgImage(String isDaytime) {

    if(isDaytime == 'morning')
    {
      return 'day2.png';
    }

    else if(isDaytime == 'night')
    {
      return 'night2.jpg';
    }

    else if(isDaytime == 'afternoon')
    {
      return 'afternoon.png';
    }

    else if(isDaytime == 'evening')
    {
      return 'eve.jpeg';
    }
  }

  Color setBgColour(String isDaytime) {

    if(isDaytime == 'morning')
    {
      return Colors.blue[200];
    }

    else if(isDaytime == 'night')
    {
      return Colors.indigo[900];
    }

    else if(isDaytime == 'afternoon')
    {
      return Colors.blue.shade400 ;
    }

    else if(isDaytime == 'evening')
    {
      return Colors.purple[200];
    }
  }


@override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;

    // set background image
    String bgImage = setBgImage(data['isDaytime']);
    Color bgColor = setBgColour(data['isDaytime']);

    return Scaffold(
      appBar: AppBar(
        title: Text('World Time'),
        backgroundColor: Colors.grey[800],
        centerTitle: true,
      ),
      backgroundColor: bgColor,
      drawer: Drawer(
        child:Column(
          children: <Widget>[
            Container(
                  padding: EdgeInsets.fromLTRB(15.0, 50.0, 15.0, 15.0),
                  color: Colors.grey[800],
                  height: 200,
                  width: 303.5,
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/clock2.png', height:80, width:80),
                      SizedBox(height: 15.0),
                      Text('WORLD TIME',
                          style: TextStyle(
                            fontSize: 20.0,
                            letterSpacing: 0.5,
                            color: Colors.white,
                          )),
                    ],
                  )
              ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: ListTile(
                leading: Icon(
                    Icons.location_on,
                color: Colors.grey.shade800),
                title: Text('Edit default location', style: TextStyle(fontSize: 15.0 )),
                onTap: ()=> Navigator.of(context).pushNamed('/default_loc'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: ListTile(
                leading: Icon(Icons.edit_location, color: Colors.grey.shade800),
                title: Text('Pick another location', style: TextStyle(fontSize: 15.0 )),
                  onTap: ()=> Navigator.of(context).pushNamed('/location'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: ListTile(
                leading: Icon(Icons.favorite, color: Colors.grey.shade800),
                title: Text('Favourite locations', style: TextStyle(fontSize: 15.0 )),
                  onTap: ()=> Navigator.of(context).pushNamed('/favourite'),
              ),
            ),
            SizedBox(height:21.0),
//            Padding(
//                padding: const EdgeInsets.all(6.0),
//                child: ListTile(
//                  leading: Icon(Icons.settings, color: Colors.grey.shade800),
//                  title: Text('Settings', style: TextStyle(fontSize: 15.0 )),
//                  onTap: ()=> Navigator.of(context).pushNamed('/settings'),
//                ),
//              ),
          ],
        )
      ) ,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                SizedBox(height: 20.0),
                Center(
                  child: Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 30.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: Text(
                      data['time'],
                      style: TextStyle(
                          fontSize: 66.0,
                          color: Colors.white
                      )
                  ),
                ),
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    if(result != null){
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag'],
                        };
                      });
                    }
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//maybe insert fav icon here instead