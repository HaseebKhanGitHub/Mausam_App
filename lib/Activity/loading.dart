



import 'package:flutter/material.dart';
import 'package:mausam_app/Worker/worker.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String Temperature = 'Loading';


  void startApp() async
  {
    worker instance = worker(location: 'cbshbcs');
    await instance.getData();

    /*print(instance.air_speed);
    print(instance.description);*/

    setState(() {
      Temperature = instance.temp;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startApp();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          TextButton.icon(onPressed: (){
            Navigator.pushNamed(context, '/home');
        
          }, icon: Icon(Icons.add_to_home_screen) ,label: Text(Temperature),
          )
        ]),
      )
    );
  }
}
