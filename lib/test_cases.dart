import 'package:tcc/app_images.dart';
import 'package:tcc/ishihara_data.dart';
import 'package:tcc/test_data.dart';

final eSino =
    IshiharaData(pictureAsset: AppImages.sino, ishiharaAsset: AppImages.eSino);
final gAviao1 =
    IshiharaData(pictureAsset: AppImages.aviao, ishiharaAsset: AppImages.gAviao1);
final gPicole2 =
    IshiharaData(pictureAsset: AppImages.picole, ishiharaAsset: AppImages.gPicole2);
final gGalinha3 =
    IshiharaData(pictureAsset: AppImages.galinha, ishiharaAsset: AppImages.gGalinha3);
final pCaneca =
    IshiharaData(pictureAsset: AppImages.caneca, ishiharaAsset: AppImages.pCaneca);
final dCamisa =
    IshiharaData(pictureAsset: AppImages.camisa, ishiharaAsset: AppImages.dCamisa);
final eEspatula =
    IshiharaData(pictureAsset: AppImages.espatula, ishiharaAsset: AppImages.eEspatula);
final gBaguete1 =
    IshiharaData(pictureAsset: AppImages.baguete, ishiharaAsset: AppImages.gPao1);
final gPera2 =
    IshiharaData(pictureAsset: AppImages.pera, ishiharaAsset: AppImages.gPera2);
final gBorboleta3 =
    IshiharaData(pictureAsset: AppImages.borboleta, ishiharaAsset: AppImages.gBorboleta3);
final pAviao =
    IshiharaData(pictureAsset: AppImages.aviao, ishiharaAsset: AppImages.pAviao);
final dPicole =
    IshiharaData(pictureAsset: AppImages.picole, ishiharaAsset: AppImages.dPicole);
final eRolo =
    IshiharaData(pictureAsset: AppImages.rolo, ishiharaAsset: AppImages.eRolo);
final gSino1 =
    IshiharaData(pictureAsset: AppImages.sino, ishiharaAsset: AppImages.gSino1);
final gCamisa2 =
    IshiharaData(pictureAsset: AppImages.camisa, ishiharaAsset: AppImages.gCamisa2);
final gAviao3 =
    IshiharaData(pictureAsset: AppImages.aviao, ishiharaAsset: AppImages.gAviao3);
final pTesoura =
    IshiharaData(pictureAsset: AppImages.tesoura, ishiharaAsset: AppImages.pTesoura);
final dRolo =
    IshiharaData(pictureAsset: AppImages.rolo, ishiharaAsset: AppImages.dRolo);
final nTesoura =
    IshiharaData(pictureAsset: AppImages.tesoura, ishiharaAsset: AppImages.nTesoura);

final aviao =
    IshiharaData(pictureAsset: AppImages.aviao, ishiharaAsset: null);
final baguete =
    IshiharaData(pictureAsset: AppImages.baguete, ishiharaAsset: null);
final borboleta =
    IshiharaData(pictureAsset: AppImages.borboleta, ishiharaAsset: null);
final camiseta =
    IshiharaData(pictureAsset: AppImages.camisa, ishiharaAsset: null);
final caneca =
    IshiharaData(pictureAsset: AppImages.caneca, ishiharaAsset: null);
final espatula =
    IshiharaData(pictureAsset: AppImages.espatula, ishiharaAsset: null);
final galinha =
    IshiharaData(pictureAsset: AppImages.galinha, ishiharaAsset: null);
final pera =
    IshiharaData(pictureAsset: AppImages.pera, ishiharaAsset: null);
final picole =
    IshiharaData(pictureAsset: AppImages.picole, ishiharaAsset: null);
final rolo =
    IshiharaData(pictureAsset: AppImages.rolo, ishiharaAsset: null);
final sino =
    IshiharaData(pictureAsset: AppImages.sino, ishiharaAsset: null);
final tesoura =
    IshiharaData(pictureAsset: AppImages.tesoura, ishiharaAsset: null);

final List<TestData> testCases = [
  TestData(
    target: eSino,
    options: [
      eSino,
      pera,
      tesoura,
    ],
    everyoneSees: true,
  ),
  TestData(
    target: gAviao1,
    options: [
      picole,
      gAviao1,
      galinha,
    ],
    protanopia: true,
    deuteranopia: true,
  ),
  TestData(
    target: gPicole2,
    options: [
      borboleta,
      gPicole2,
      sino,
    ],
    protanopia: true,
    deuteranopia: true,
  ),
  TestData(
    target: gGalinha3,
    options: [
      gGalinha3,
      baguete,
      picole,
    ],
    protanopia: true,
    deuteranopia: true,
    tricromacia: true,
  ),
  TestData(
    target: pCaneca,
    options: [
      espatula,
      pera,
      pCaneca,
    ],
    protanopia: true,
  ),
  TestData(
    target: dCamisa,
    options: [
      sino,
      tesoura,
      dCamisa,
    ],
    deuteranopia: true,
  ),
  TestData(
    target: eEspatula,
    options: [
      eEspatula,
      caneca,
      aviao,
    ],
    everyoneSees: true,
  ),
  TestData(
    target: gBaguete1,
    options: [
      rolo,
      aviao,
      gBaguete1,
    ],
    protanopia: true,
    deuteranopia: true,
  ),
  TestData(
    target: gPera2,
    options: [
      gPera2,
      borboleta,
      tesoura,
    ],
    protanopia: true,
    deuteranopia: true,
  ),
  TestData(
    target: gBorboleta3,
    options: [
      galinha,
      gBorboleta3,
      espatula,
    ],
    protanopia: true,
    deuteranopia: true,
    tricromacia: true,
  ),
  TestData(
    target: pAviao,
    options: [
      pAviao,
      picole,
      caneca,
    ],
    protanopia: true,
  ),
  TestData(
    target: dPicole,
    options: [
      baguete,
      camiseta,
      dPicole,
    ],
    deuteranopia: true,
  ),
  TestData(
    target: eRolo,
    options: [
      galinha,
      eRolo,
      aviao,
    ],
    everyoneSees: true,
  ),
  TestData(
    target: gSino1,
    options: [
      tesoura,
      gSino1,
      espatula,
    ],
    protanopia: true,
    deuteranopia: true,
  ),
  TestData(
    target: gCamisa2,
    options: [
      borboleta,
      gCamisa2,
      sino,
    ],
    protanopia: true,
    deuteranopia: true,
  ),
  TestData(
    target: gAviao3,
    options: [
      gAviao3,
      caneca,
      pera,
    ],
    protanopia: true,
    deuteranopia: true,
    tricromacia: true,
  ),
  TestData(
    target: pTesoura,
    options: [
      rolo,
      galinha,
      pTesoura,
    ],
    protanopia: true,
  ),
  TestData(
    target: dRolo,
    options: [
      picole,
      baguete,
      dRolo,
    ],
    deuteranopia: true,
  ),
  TestData(
      target: nTesoura,
      options: [
        aviao,
        nTesoura,
        rolo,
      ],
      invertedTest: true
  ),
];
