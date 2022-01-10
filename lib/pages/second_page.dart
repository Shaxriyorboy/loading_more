import 'dart:async';

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> with WidgetsBindingObserver{
  late Timer timer;
  int count = 0;
  bool active = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(active){
        setState(() {
          count+=1;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer.cancel();
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if(state == AppLifecycleState.resumed){
      active = true;
      print('Resumed');
    }else if(state == AppLifecycleState.inactive){
      active = false;
      print('Inactive');
    }else if(state == AppLifecycleState.detached){
      print('Detached');
    }else if(state == AppLifecycleState.paused){
      active = false;
      print('Paused');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Application Life Cycle'),
      ),
      body: Center(
        child: Text('$count',style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
      ),
    );
  }
}
