import 'package:get/get.dart';
import 'package:saving_diary/app/data/model/label_model.dart';
import 'package:saving_diary/app/data/repository/label_repository.dart';
import 'package:saving_diary/app/utils/app_logger.dart';

class LabelController extends GetxController {

  var labels  = <Label>[].obs;
  var name = ''.obs;
  var color = '#FF009688'.obs;
  var isLoading = false.obs;

  final repository = LabelRepository();


  @override
  void onInit() async {
    super.onInit();
    await getAllLabels();
  }

  setEditingLabel(Label label) {
    name.value = label.name;
    color.value = label.color;
  }


  Future<void> getAllLabels() async {
    isLoading.value = true;
    try{
      final result = await repository.getAllLabels();
      labels.assignAll(result);
    } finally {
      isLoading.value = false;
    }

  }

  Future<void> createLabel() async {
    var label = Label(name: name.value.trim(), color: color.value);
    try{
      await repository.createLabel(label);
      await getAllLabels();
    } catch (e, stack) {
      appLogger.e('Error creating label:', error: e, stackTrace: stack);
    }
  }

  Future<void> updateLabel({int? id}) async {
    try{
      final label = Label(
        id: id,
        name: name.value,
        color: color.value
      );
      await repository.updateLabel(label, fieldsToUpdate: ['name', 'color']);
      await getAllLabels();
    } catch (e, stack) {
      appLogger.e('Error updating label id: $id', error: e, stackTrace: stack);
    }
  }

  Future<bool> isNameExists(String labelName) async {
    final label = await repository.getLabelByName(labelName.trim());
    return label != null;
  }

  void reset() {
    name.value = '';
    color.value = '#FF009688';
  }
}