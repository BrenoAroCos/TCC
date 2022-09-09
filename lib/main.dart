import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/app_images.dart';
import 'package:tcc/teste_bloc.dart';

import 'answers.dart';
import 'first_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<TesteBloc>(create: (context) => TesteBloc(), child: MyHomePage(title: 'TCC'))
    );
  }
}
