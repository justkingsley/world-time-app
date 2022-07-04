import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async {

    //simulate network request to get username
    //this is none blocking code, statement can be run before the future
    String username = await Future.delayed(const Duration(seconds: 3), () {
      return 'Yoshi';
    });

    //simulate network request to get biography
    await Future.delayed(const Duration(seconds: 2), () {
      print('Vegan, musician & egg collector');
    });

      print('statement');
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      //AppBar places a back arrow if we are coming from another screen
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}
