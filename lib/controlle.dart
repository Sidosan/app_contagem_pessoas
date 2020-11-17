import 'package:get/get.dart';
import 'package:count_pessoas/database.dart';

class Controller extends GetxController {
  final _total = mongo().obs;
  get total => this._total.value;
}
