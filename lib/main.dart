import 'package:flutter/material.dart';
import 'package:flutter_application_1/injector.dart';
import 'package:flutter_application_1/presentation/bloc/station_bloc.dart';
import 'package:flutter_application_1/presentation/view/loginpage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, devicetype) {
      return MaterialApp(
          title: 'Flutter App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.indigo,
          ),
          home: Scaffold(
            backgroundColor: Colors.black,
            body: BlocProvider<ApiBloc>(
              create: (context) => injector(),
              child: LoginView(),
            ),
          ));
    });
  }
}
