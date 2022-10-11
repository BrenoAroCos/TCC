import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/test_page.dart';
import 'package:tcc/teste_bloc.dart';
import 'package:tcc/tutorial_page.dart';

import 'app_assets.dart';

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
                AppAssets.appIcon,
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
                        return TutorialPage();
                      }));
                    },
                    icon:
                        Image.asset(AppAssets.playIcon, width: 50, height: 50),
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
          title: Text(widget.title),
        ));
  }
}