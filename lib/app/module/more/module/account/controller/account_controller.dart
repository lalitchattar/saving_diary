import 'package:get/get.dart';
import 'package:saving_diary/app/data/repository/account_repository.dart';

import '../../../../../data/model/account_model.dart';
import '../../../../../utils/app_logger.dart';

class AccountController extends GetxController {
  var name = ''.obs;
  var institutionName = ''.obs;
  var accountNumber = ''.obs;
  var balance = 0.0.obs;
  var showInNetWorth = false.obs;
  var isLoading = false.obs;
  var accounts = <Account>[].obs;

  final repository = AccountRepository();

  @override
  void onInit() async {
    super.onInit();
    await getAllAccount();
  }

  Future<void> getAllAccount() async {
    isLoading.value = true;
    try{
      final result = await repository.getAllAccounts();
      accounts.assignAll(result);
    } finally {
      isLoading.value = false;
    }

  }

  Future<void> createGeneralAccount(String type, String category) async {
    var account = Account(
      name: name.value,
      institutionName: institutionName.value,
      accountNumber: accountNumber.value,
      balance: balance.value,
      showInNetWorth: showInNetWorth.value,
      type: type,
      category: category,
    );
    try {
      await repository.createAccount(account);
      await getAllAccount();
    } catch (e, stack) {
      appLogger.e('Error creating account:', error: e, stackTrace: stack);
    }
  }

  Future<bool> isNameExists(String labelName, String type) async {
    final label = await repository.getAccountByName(labelName.trim(), type.trim());
    return label != null;
  }

  void reset() {
    name.value = '';
    institutionName.value = '';
    accountNumber.value = '';
    balance.value = 0.0;
    showInNetWorth.value = false;
  }
}
