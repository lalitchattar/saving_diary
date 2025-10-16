import 'package:get/get.dart';
import 'package:saving_diary/app/data/model/label_model.dart';
import 'package:saving_diary/app/data/repository/label_repository.dart';

class LabelController extends GetxController {

  var labels  = <Label>[].obs;
  var name = ''.obs;
  var color = '#FF009688'.obs;

  final repository = LabelRepository();


  @override
  void onInit() async {
    super.onInit();
    await getAllLabels();
  }

  Future<void> getAllLabels() async {
    try {
      final result = await repository.getAllLabels();
      labels.assignAll(result);
    } catch (e) {
      print("Error loading merchants: $e");
    } finally {
      print("todo");
    }
  }

  Future<void> createLabel() async {
    try{
      var label = Label(name: name.value.trim(), color: color.value);
      await repository.createLabel(label);
      await getAllLabels();
    } catch (e) {
      print("Error loading merchants: $e");
    } finally {
      print("todo");
    }
  }

  Future<bool> isNameExists(String labelName) async {
    try {
      final label = await repository.getLabelByName(labelName.trim());
      return label != null;
    } catch (e) {
      print("Error loading merchants: $e");
      return false;
    } finally {
      print("todo");
    }
  }

  void reset() {
    name.value = '';
    color.value = '#FF009688';
  }
}