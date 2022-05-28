import 'package:merchant/Model/Metal.dart';
import 'package:merchant/Model/Unit.dart';

abstract class Question {
  String? calculateAns(List<Unit> units, List<Metal> metals);
}
