import 'package:get/get.dart';
import 'package:saving_diary/app/data/model/merchant_model.dart';
import 'package:saving_diary/app/data/repository/merchant_repository.dart';
import 'package:saving_diary/app/utils/app_logger.dart';

class MerchantController extends GetxController {

  var merchants  = <Merchant>[].obs;
  var name = ''.obs;
  var type = 'Expense'.obs;
  var icon = 'Store'.obs;
  var isLoading = false.obs;

  final repository = MerchantRepository();


  @override
  void onInit() async {
    super.onInit();
    await getAllMerchants();
  }


  Future<void> getAllMerchants() async {
    isLoading.value = true;
    try{
      final result = await repository.getAllMerchants();
      merchants.assignAll(result);
    } finally {
      isLoading.value = false;
    }

  }

  Future<void> createMerchant() async {
    var merchant = Merchant(name: name.value.trim(), icon: icon.value, type: type.value);
    try{
      await repository.createMerchant(merchant);
      await getAllMerchants();
    } catch (e, stack) {
      appLogger.e('Error creating label:', error: e, stackTrace: stack);
    }
  }

  Future<void> updateMerchant({int? id, List<String>? fieldsToUpdate}) async {
    try{
      final merchant = Merchant(
        id: id,
        name: name.value,
        icon: icon.value,
        type: type.value
      );
      await repository.updateMerchant(merchant, fieldsToUpdate: fieldsToUpdate);
      await getAllMerchants();
    } catch (e, stack) {
      appLogger.e('Error updating label id: $id', error: e, stackTrace: stack);
    }
  }

  Future<bool> isNameExists(String merchantName) async {
    final label = await repository.getMerchantByName(merchantName.trim());
    return label != null;
  }

  void reset() {
    name.value = '';
    type.value = 'Expense';
    icon.value = 'Store';
  }
}