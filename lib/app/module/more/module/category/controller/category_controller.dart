import 'package:get/get.dart';
import 'package:saving_diary/app/data/model/category_model.dart';
import 'package:saving_diary/app/data/repository/category_repository.dart';
import 'package:saving_diary/app/utils/app_logger.dart';

class CategoryController extends GetxController {

  var categories  = <Category>[].obs;
  var name = ''.obs;
  var type = 'Expense'.obs;
  var icon = 'Store'.obs;
  var isLoading = false.obs;

  final repository = CategoryRepository();


  @override
  void onInit() async {
    super.onInit();
    await getAllCategories();
  }


  Future<void> getAllCategories() async {
    isLoading.value = true;
    try{
      final result = await repository.getAllCategories();
      categories.assignAll(result);
    } finally {
      isLoading.value = false;
    }

  }

  Future<void> createCategory() async {
    var category = Category(name: name.value.trim(), icon: icon.value, type: type.value);
    try{
      await repository.createCategory(category);
      await getAllCategories();
    } catch (e, stack) {
      appLogger.e('Error creating category:', error: e, stackTrace: stack);
    }
  }

  Future<void> updateCategory({int? id, List<String>? fieldsToUpdate}) async {
    try{
      final category = Category(
        id: id,
        name: name.value,
        icon: icon.value,
        type: type.value
      );
      await repository.updateCategory(category, fieldsToUpdate: fieldsToUpdate);
      await getAllCategories();
    } catch (e, stack) {
      appLogger.e('Error updating category id: $id', error: e, stackTrace: stack);
    }
  }

  Future<bool> isNameExists(String categoryName) async {
    final category = await repository.getCategoryByName(categoryName.trim());
    return category != null;
  }

  void reset() {
    name.value = '';
    type.value = 'Expense';
    icon.value = 'Store';
  }
}