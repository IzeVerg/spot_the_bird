import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spot_the_bird/bloc/bird_post_cubit.dart';
import 'package:spot_the_bird/screens/map_screen.dart';

import 'bloc/location_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LocationCubit>(
          create: (context) =>
          LocationCubit()
            ..getLocation(),
        ),
        BlocProvider<BirdPostCubit>(
          create: (context) =>
              BirdPostCubit()..loadPosts()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          //appBar color
          primaryColor: Color(0xFF334257),
          colorScheme: ColorScheme.light().copyWith(
            //TextField Color
            primary: Color(0xFF548CAB),
            //Floating action Button
            secondary: Color(0xFF96BAFF),
          ),
        ),
        home: MapScreen(),
      ),
    );
  }
}
