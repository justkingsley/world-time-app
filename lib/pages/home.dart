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

    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    String backgroundImage = data['isDayTime'] ? 'day.jpg' : 'night.jpg';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$backgroundImage'),
            fit: BoxFit.fill,
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
          child: SafeArea( //moves widgets into safe area
            child: Column(
                children: [
                  TextButton.icon(
                      onPressed: () async{
                        //Pushing to another screen, screen will exist underneath but we are pushing another one

                        //Now we add the await key because it's now an async function that's returning some data

                        dynamic result = await Navigator.pushNamed(context, '/location');

                        //This code won't run until result is returned

                        setState(() {
                          data = {
                            'time': result['time'],
                            'location': result['location'],
                            'isDayTime': result['isDayTime'],
                            'flag': result['flag']
                          };
                        });
                      },
                      icon: const Icon(Icons.edit_location_alt_outlined),
                      label: const Text('Edit Location'),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                      ),),


                  const SizedBox(height: 5.0,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: const TextStyle(
                          fontSize: 26.0,
                          letterSpacing: 2.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 10.0,),

                  Text(data['time'],
                    style: const TextStyle(
                      fontSize: 62.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFFFFF),
                    ),
                  )
                ],
            ),
          ),
        ),
      ),
    );
  }
}
