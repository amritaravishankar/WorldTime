import 'package:flutter/material.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/services/world_time.dart';

class Default extends StatefulWidget {

  @override
  _DefaultState createState() => _DefaultState();
}

class _DefaultState extends State<Default> {

  @override
  Widget build(BuildContext context) {
    return Def();
  }
}

class Def extends StatefulWidget {

  final List<WorldTime> locationList = ChooseLocation.locations;
  final List<int> defaultCheck = [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0];
  final String defaultLoc = "Mumbai";

  Def({Key key}):super(key:key);

  @override
  _DefState createState() => _DefState();
}

class _DefState extends State<Def> {

  String defaultLoc = "Mumbai";

  void updateDefault(index) {
    print('Option highlighted');
    defaultLoc = widget.locationList[index].location;
    for (int i = 0; i < widget.defaultCheck.length; i++) {
      if (widget.defaultCheck[i] == 1) {
        widget.defaultCheck[i] -= 1;
      }
    }
    widget.defaultCheck[index] = 1;
  }

  void removeDefault(index) {
    widget.defaultCheck[index] = 0; //if all values are 0, display "no default location selected! Please select one!" or give out an Alert message
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Change your default location'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 75.0, child: Card(
              color: Colors.yellow[100],
              child: Center(child: Text(defaultLoc,
                  style: TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w500))))),
          SizedBox(
            height: 510.0,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 14,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 1.0, horizontal: 4.0),
                    child: Card(
                      child: ListTile(
                        title: Text(widget.locationList[index].location),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                              'assets/${widget.locationList[index].flag}'),
                        ),
                        onTap: () {
                          setState(() {
                            widget.defaultCheck[index] == 0
                                ? updateDefault(index)
                                : removeDefault(index);
                            //storeIndex = index;
                          });
                        },
                        trailing: widget.defaultCheck[index] == 1
                            ? Icon(Icons.check)
                            : Text(''),
                      ),
                    ),
                  );
                }
            ),
          ),
        ],
      ),
    );
  }
}
