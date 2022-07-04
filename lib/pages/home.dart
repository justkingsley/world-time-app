import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea( //moves widgets into safe area
        child: Column(
            children: [
              TextButton.icon(
                  onPressed: () {
                    //Pushing to another screen, screen will exist underneath but we are pushing another one
                    Navigator.pushNamed(context, '/location');
                  },
                  icon: const Icon(Icons.location_on),
                  label: const Text('Edit Location'))
            ],
        ),
      ),
    );
  }
}
