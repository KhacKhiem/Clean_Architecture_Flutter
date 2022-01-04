import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/bloc/station_bloc.dart';
import 'package:flutter_application_1/presentation/bloc/stations_event.dart';
import 'package:flutter_application_1/presentation/bloc/stations_state.dart';
import 'package:flutter_application_1/presentation/view/stationview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class LoginView extends StatelessWidget {
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Center(
        child: BlocBuilder<ApiBloc, ApiState>(builder: (context, state) {
          if (state is UnLoad)
            return Stack(children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                      Colors.blue,
                      Colors.blue,
                    ])),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(child: logo(context)),
                  SizedBox(
                    height: 15.h,
                  ),
                  loginForm(context)
                ],
              )
            ]);
          if (state is Loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is Loaded) {
            return Station(state.stations);
          } else {
            return Text('Cant fetch data');
          }
        }),
      );
  Widget logo(BuildContext context) {
    return Container(
      height: 30.h,
      width: 70.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
    );
  }

  Widget loginForm(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 70.w,
          padding: EdgeInsets.only(left: 10),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: TextField(
            controller: _nameController,
            decoration: InputDecoration(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              hintText: 'Your name',
            ),
          ),
        ),
        Container(
          width: 70.w,
          padding: EdgeInsets.only(left: 10),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: TextField(
            obscureText: true,
            controller: _passwordController,
            decoration: InputDecoration(
              icon: Icon(Icons.password, color: Colors.black),
              hintText: 'Password',
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            BlocProvider.of<ApiBloc>(context).add(FetchDetail());
          },
          child: Container(
            width: 70.w,
            height: 7.h,
            margin: EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(5),
            child: Center(
              child: Text('Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontFamily: 'Sf',
                      fontSize: 8.sp)),
            ),
          ),
        )
      ],
    );
  }
}
