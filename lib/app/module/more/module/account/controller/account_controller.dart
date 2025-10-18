import 'package:get/get.dart';

import '../../../../../data/model/account_model.dart';


class AccountController extends GetxController {
  var name = ''.obs;
  var institutionName = ''.obs;
  var accountNumber = ''.obs;
  var balance = 0.0.obs;
  var showInNetWorth = false.obs;
  var isLoading = false.obs;
  var accounts  = <Account>[].obs;


  void reset() {
  }
}