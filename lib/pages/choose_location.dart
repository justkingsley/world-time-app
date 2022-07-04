import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

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
