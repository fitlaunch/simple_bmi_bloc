import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bmi_bloc/screens/bmi_display.dart';
import 'package:simple_bmi_bloc/screens/my_stats.dart';

import 'blocs/bmi/bmi_bloc.dart';
import 'blocs/bmr/bmr_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BmrBloc()),
        BlocProvider(create: (context) => BmiBloc()),
      ], 
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.pink,
        ),
        //home: MyStats(),
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => MyStats(),
          '/bmi_display': (BuildContext context) => BmiDisplay(),
        },
      )
    );
  }
}
