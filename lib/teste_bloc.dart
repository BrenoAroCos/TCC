import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcc/answers.dart';
import 'package:tcc/app_images.dart';
import 'package:tcc/ishihara_data.dart';

abstract class TesteState{}
class TesteLoadingState extends TesteState{}
class TesteLoadedState extends TesteState{
  final IshiharaData target;
  final List<IshiharaData> options;

  TesteLoadedState(this.target, this.options);
}

class TesteBloc extends Cubit <TesteState>{
  TesteBloc():super(TesteLoadingState()){
    generateTest();
  }





  final List<IshiharaData> ishiharaList = [
    IshiharaData( AppImages.circulo, AppImages.circulo),
    IshiharaData( AppImages.passaro, AppImages.ishiharaPlate),
    IshiharaData(AppImages.quadrado, AppImages.quadrado),
  ];

  void generateTest(){
    emit(TesteLoadedState(ishiharaList[1], ishiharaList));
  }
}