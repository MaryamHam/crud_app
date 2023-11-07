import 'package:crud_app/cubits/main/main_cubit.dart';
import 'package:crud_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider(create: (context)=> MainCubit()),
      ],
    
    
     child: MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: HomeScreen(),
    ));
  }
}