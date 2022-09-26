import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/app_images.dart';
import 'package:tcc/teste_bloc.dart';

import 'test_page.dart';

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
      home: const IntroPage(
        title: 'Intro',
      ),
    );
  }
}

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
          alignment: AlignmentDirectional.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                AppImages.appIcon,
                height: 300,
                width: 300,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                  height: 80,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return BlocProvider<TesteBloc>(
                            create: (context) => TesteBloc(),
                            child: const TestPage(title: 'TCC'));
                      }));
                    },
                    icon:
                        Image.asset(AppImages.playIcon, width: 50, height: 50),
                    label: const Text(
                      "Iniciar Teste",
                      style: TextStyle(color: Colors.black),
                    ),
                  )),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(widget.title),
        ));
  }
}
