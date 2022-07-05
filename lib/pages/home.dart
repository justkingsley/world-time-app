import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 280.0, 0.0, 0.0),
        child: SafeArea( //moves widgets into safe area
          child: Column(
              children: [
                TextButton.icon(
                    onPressed: () {
                      //Pushing to another screen, screen will exist underneath but we are pushing another one
                      Navigator.pushNamed(context, '/location');
                    },
                    icon: const Icon(Icons.edit_location_alt_outlined),
                    label: const Text('Edit Location')),

                const SizedBox(height: 10.0,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: const TextStyle(
                        fontSize: 26.0,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 20.0,),

                Text(data['time'],
                  style: const TextStyle(
                    fontSize: 56.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
          ),
        ),
      ),
    );
  }
}
