import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/test_page.dart';
import 'package:tcc/teste_bloc.dart';
import 'package:just_audio/just_audio.dart';

import 'app_assets.dart';

class TutorialPage extends StatefulWidget {
  TutorialPage({Key? key}) : super(key: key);

  final player = AudioPlayer();

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> {

  @override
  void initState() {
    super.initState();
    widget.player.setAsset(AppAssets.tutorialAudio1);
    widget.player.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Align(
          alignment: AlignmentDirectional.center,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Image.asset(
                    AppAssets.tutorialGif1,
                    height: 300,
                    width: 300,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5.0),
                              child: Icon(
                                Icons.volume_up,
                              ),
                            ),
                            ClipOval(
                              child: Material(
                                color: Colors.blue,
                                child: InkWell(
                                  splashColor: Colors.lightBlueAccent,
                                  onTap:(){
                                    widget.player.setAsset(AppAssets.tutorialAudio1);
                                    widget.player.play();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(
                                        Icons.play_arrow,
                                    ),
                                  )
                                )
                              )
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ]
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
                  )
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Instruções"),
        ));
  }
}