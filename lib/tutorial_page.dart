import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/test_page.dart';
import 'package:tcc/teste_bloc.dart';

import 'app_images.dart';

class TutorialPage extends StatefulWidget {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {
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
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(const BorderSide(
                            color: Colors.black,
                            width: 3.0,
                            style: BorderStyle.solid))),
                  )),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Instruções"),
        ));
  }
}