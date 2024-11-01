import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_get_api_use_gridviewbuilder/bloc/bloc/user_bloc.dart';
import 'package:latihan_get_api_use_gridviewbuilder/bloc/product/product_bloc.dart';
import 'package:latihan_get_api_use_gridviewbuilder/homepage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProductBloc()..add(GetProductEvent()),),
          BlocProvider(create: (context) => UserBloc()..add(OnGetUserEvent()),),
        ],
        child: MaterialApp(
          home: Homepage(),
        ));
  }
}
