import 'package:flutter/material.dart';
import 'package:world_time_app/models/choose_location.dart';
import 'package:world_time_app/services/world_time.dart';

class Favourites extends StatefulWidget {

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  final List<WorldTime> favouriteList = ChooseLocation.favourite;
  final List<int> favCheck = ChooseLocation.favCheck;
  Function delete(){
    print('Delete');
  }

  @override
  void updateTime(index) async {
    WorldTime instance = favouriteList[index];
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Your Favourites'),
        centerTitle: true,
      ),
      body:
      Container(
        child: favouriteList.length==0? Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('No favourites to display yet!',
            style: TextStyle(
              fontSize: 25.0, letterSpacing: 0.5,
            )
            ),
          ),
        ): ListView.builder(
            shrinkWrap: true,
            itemCount: favouriteList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: InkWell(
                  onTap: () { updateTime(index);} ,
                  child: Card(
                    child: ListTile(
                      title: Text(favouriteList[index].location),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/${favouriteList[index].flag}'),
                      ),
                      trailing: FlatButton.icon(
                        onPressed:() {
                          setState(() {
                            favouriteList.remove(favouriteList[index]);
                          });
                        },
                        label: Text(''),
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}