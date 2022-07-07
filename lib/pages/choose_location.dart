import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Africa/Harare', location: 'Harare', flag: ''),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: ''),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: ''),
    WorldTime(url: 'Europe/Moscow', location: 'Moscow', flag: ''),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: ''),
  ];

  void updateTime(index) async{
    //Storing instance by index in local variable
    WorldTime instance = locations[index];

    //awaiting getTime();
    await instance.getTime();

    //The Choose a Location Screen is sitting on top of the home screen, we want to pop it off.
    //We don't use arguments because we are popping to the one underneath.
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFCDC6BC),
      //AppBar places a back arrow if we are coming from another screen
      appBar: AppBar(
        backgroundColor: const Color(0xFF787A79),
        title: const Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),

      body: ListView.builder(
          itemCount: locations.length,                      // How many items are inside the list
          itemBuilder: (BuildContext context, int index) { //

            return Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: ListTile(
                  onTap: () {
                      updateTime(index);
                  },
                  leading: FlutterLogo(),
                  title: Text(locations[index].location),
                ),
              ),
            );
          },
          ),
    );
  }
}
