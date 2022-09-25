import 'package:tcc/app_images.dart';
import 'package:tcc/ishihara_data.dart';
import 'package:tcc/test_data.dart';

final gAviao = IshiharaData(pictureAsset: AppImages.aviao, ishiharaAsset: AppImages.gAviao1);
final picole = IshiharaData(pictureAsset: AppImages.picole, ishiharaAsset: null);
final galinha = IshiharaData(pictureAsset: AppImages.galinha, ishiharaAsset: null);

final List<TestData> testCases = [
  TestData(
    target: gAviao,
    options: [
      gAviao,
      picole,
      galinha,
    ],
  ),
  TestData(
    target: gAviao,
    options: [
      gAviao,
      picole,
      galinha,
    ],
  ),
  TestData(
    target: gAviao,
    options: [
      gAviao,
      picole,
      galinha,
    ],
  ),
  TestData(
    target: gAviao,
    options: [
      gAviao,
      picole,
      galinha,
    ],
  ),
];
