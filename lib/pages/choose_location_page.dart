import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:world_time_app/models/choose_location.dart';

class ChoosePage extends StatefulWidget {
  @override
  _ChoosePageState createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Choose a Location'),
    centerTitle: true,
    elevation: 0,
    ),
    body: FavWidget(),
      );
  }
}

class FavWidget extends StatefulWidget {
  final List<WorldTime> locations = ChooseLocation.locations;
  final List<WorldTime> favourite = ChooseLocation.favourite;
  final List<int> favCheck = ChooseLocation.favCheck;

  FavWidget({Key key}):super(key:key);

  @override
  _FavWidgetState createState() => _FavWidgetState();
}

class _FavWidgetState extends State<FavWidget> {

  void removeFav(index)
  {
    widget.favCheck[index]=0;
    widget.favourite.remove(widget.locations[index]);
  }

  List<WorldTime> updateFav(int index) {
    if (widget.favCheck[index]==0) {
      widget.favCheck[index]=1;
      widget.favourite.add(widget.locations[index]);
      print('widget.favourite');
    }
    else
      widget.favCheck[index]=0;
  }

  @override
  Widget build(BuildContext context) {
    void updateTime(index) async {
      WorldTime instance = widget.locations[index];
      await instance.getTime();
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDaytime,
      });
    }

    return ListView.builder(
        itemCount: widget.locations.length,
        itemBuilder: (context, index) {
          return Column(
          children: <Widget>[
      Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 1.0, horizontal: 4.0),
    child: Card(
    child: Column(
    children: <Widget>[
      ListTile(
      onTap: () {
        updateTime(index);
      },
      title: Text(widget.locations[index].location),
      leading: CircleAvatar(
        backgroundImage: AssetImage(
            'assets/${widget.locations[index].flag}'),
      ),
      trailing: InkWell(
        onTap: () {
          setState(() {
            widget.favCheck[index] == 0? updateFav(index): removeFav(index);
          });
        },
        child: (widget.favCheck[index] == 1) ? Icon(Icons.favorite, color: Colors.grey[700],) : Icon(Icons.favorite_border, color: Colors.grey[700]),
        //child: Icon(Icons.add),
      ),
    ),
    ],
    ),
    ),
      ),
          ],
      );
        }
    );
  }
}
