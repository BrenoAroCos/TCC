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
    IshiharaData( pictureAsset: AppImages.picole, ishiharaAsset: AppImages.gPicole2),
    IshiharaData( pictureAsset: AppImages.aviao, ishiharaAsset: null),
    IshiharaData( pictureAsset: AppImages.aviao, ishiharaAsset: null),
  ];

  void generateTest(){
    emit(TesteLoadedState(ishiharaList[0], ishiharaList));
  }
}