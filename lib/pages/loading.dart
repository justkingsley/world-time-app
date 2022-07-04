import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';



class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Harare', flag: 'zimbabwean_flag.png', url: 'Africa/Harare');
    await instance.getTime();
    print(instance.time);
  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        'Loading Screen'
      ),
    );
  }
}
