import 'package:tcc/app_assets.dart';
import 'package:tcc/ishihara_data.dart';
import 'package:tcc/test_data.dart';

final eSino =
    IshiharaData(pictureAsset: AppAssets.sino, ishiharaAsset: AppAssets.eSino);
final gAviao1 =
    IshiharaData(pictureAsset: AppAssets.aviao, ishiharaAsset: AppAssets.gAviao1);
final gPicole2 =
    IshiharaData(pictureAsset: AppAssets.picole, ishiharaAsset: AppAssets.gPicole2);
final gGalinha3 =
    IshiharaData(pictureAsset: AppAssets.galinha, ishiharaAsset: AppAssets.gGalinha3);
final pCaneca =
    IshiharaData(pictureAsset: AppAssets.caneca, ishiharaAsset: AppAssets.pCaneca);
final dCamisa =
    IshiharaData(pictureAsset: AppAssets.camisa, ishiharaAsset: AppAssets.dCamisa);
final eEspatula =
    IshiharaData(pictureAsset: AppAssets.espatula, ishiharaAsset: AppAssets.eEspatula);
final gBaguete1 =
    IshiharaData(pictureAsset: AppAssets.baguete, ishiharaAsset: AppAssets.gPao1);
final gPera2 =
    IshiharaData(pictureAsset: AppAssets.pera, ishiharaAsset: AppAssets.gPera2);
final gBorboleta3 =
    IshiharaData(pictureAsset: AppAssets.borboleta, ishiharaAsset: AppAssets.gBorboleta3);
final pAviao =
    IshiharaData(pictureAsset: AppAssets.aviao, ishiharaAsset: AppAssets.pAviao);
final dPicole =
    IshiharaData(pictureAsset: AppAssets.picole, ishiharaAsset: AppAssets.dPicole);
final eRolo =
    IshiharaData(pictureAsset: AppAssets.rolo, ishiharaAsset: AppAssets.eRolo);
final gSino1 =
    IshiharaData(pictureAsset: AppAssets.sino, ishiharaAsset: AppAssets.gSino1);
final gCamisa2 =
    IshiharaData(pictureAsset: AppAssets.camisa, ishiharaAsset: AppAssets.gCamisa2);
final gAviao3 =
    IshiharaData(pictureAsset: AppAssets.aviao, ishiharaAsset: AppAssets.gAviao3);
final pTesoura =
    IshiharaData(pictureAsset: AppAssets.tesoura, ishiharaAsset: AppAssets.pTesoura);
final dRolo =
    IshiharaData(pictureAsset: AppAssets.rolo, ishiharaAsset: AppAssets.dRolo);
final nTesoura =
    IshiharaData(pictureAsset: AppAssets.tesoura, ishiharaAsset: AppAssets.nTesoura);

final aviao =
    IshiharaData(pictureAsset: AppAssets.aviao, ishiharaAsset: null);
final baguete =
    IshiharaData(pictureAsset: AppAssets.baguete, ishiharaAsset: null);
final borboleta =
    IshiharaData(pictureAsset: AppAssets.borboleta, ishiharaAsset: null);
final camiseta =
    IshiharaData(pictureAsset: AppAssets.camisa, ishiharaAsset: null);
final caneca =
    IshiharaData(pictureAsset: AppAssets.caneca, ishiharaAsset: null);
final espatula =
    IshiharaData(pictureAsset: AppAssets.espatula, ishiharaAsset: null);
final galinha =
    IshiharaData(pictureAsset: AppAssets.galinha, ishiharaAsset: null);
final pera =
    IshiharaData(pictureAsset: AppAssets.pera, ishiharaAsset: null);
final picole =
    IshiharaData(pictureAsset: AppAssets.picole, ishiharaAsset: null);
final rolo =
    IshiharaData(pictureAsset: AppAssets.rolo, ishiharaAsset: null);
final sino =
    IshiharaData(pictureAsset: AppAssets.sino, ishiharaAsset: null);
final tesoura =
    IshiharaData(pictureAsset: AppAssets.tesoura, ishiharaAsset: null);

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
