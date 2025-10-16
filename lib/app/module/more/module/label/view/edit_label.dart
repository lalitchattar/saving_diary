import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:saving_diary/app/common/widget/color_picker_screen.dart';
import 'package:saving_diary/app/common/widget/text_box_screen.dart';
import 'package:saving_diary/app/common/widget/validation_message_screen.dart';
import 'package:saving_diary/app/data/model/label_model.dart';
import '../../../../../utils/utility.dart';
import '../controller/label_controller.dart';

class EditLabelScreen extends GetView<LabelController> {
  EditLabelScreen({super.key});

  final Label label = Get.arguments;

  void _initializeController() {
    if (controller.name.value.isEmpty) {
      controller.name.value = label.name;
      controller.color.value = label.color;
    }
  }

  @override
  Widget build(BuildContext context) {

    _initializeController();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;


    return Scaffold(
      appBar: AppBar(title: const Text("Update Label"), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              children: [
                // ... your existing Card and ListTiles remain unchanged
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: colorScheme.outline.withOpacity(0.8),
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                          leading: const HugeIcon(icon: HugeIcons.strokeRoundedCursorText),
                          trailing: Obx(
                                () => Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  controller.name.value == ''
                                      ? 'Required'
                                      : controller.name.value,
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: controller.name.value == '' ? colorScheme.error : colorScheme.onSurface,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(width: 6),
                                const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                              ],
                            ),
                          ),
                          title: Text(
                            "Name",
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: colorScheme.onSurface,
                              letterSpacing: 0.15,
                            ),
                          ),
                          dense: true,
                          visualDensity: const VisualDensity(vertical: -2),
                          onTap: () {
                            _showNameTextBoxScreen(context);
                          },
                        ),
                      ),
                      Divider(
                        color: colorScheme.outlineVariant.withOpacity(0.8),
                      ),
                      Obx(() => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                          leading: const HugeIcon(icon: HugeIcons.strokeRoundedColors),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: getColorFromHex(controller.color.value),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              const HugeIcon(icon: HugeIcons.strokeRoundedArrowRight01),
                            ],
                          ),
                          title: Text(
                            "Color",
                            style: textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: colorScheme.onSurface,
                              letterSpacing: 0.15,
                            ),
                          ),
                          dense: true,
                          visualDensity: const VisualDensity(vertical: -2),
                          onTap: () {
                            _showColorPicker(context);
                          },
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // --- FilledButton added at the bottom ---
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FilledButton.tonalIcon(
              icon: const Icon(Icons.save_rounded),
              label: const Text("Update"),
              onPressed: () {
                _updateLabel();
              },
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary, // set primary color
                foregroundColor: Colors.white, // text/icon color
                padding: const EdgeInsets.symmetric(vertical: 14),
                textStyle: textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showColorPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        enableDrag: false,
        isDismissible: false,
        builder: (context) => ColorPickerScreen(onColorSelected: (colorHexCode) {
          controller.color.value = colorHexCode;
          label.color = colorHexCode;
        })
    );
  }

  _showNameTextBoxScreen(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      isDismissible: false,
      builder: (context) => SingleTextInputScreen(
        title: 'Name',
        hintText: 'Provide Label Name',
        initialValue: label.name,
        validator: (labelName) async {
          if (labelName.isEmpty) {
            return "Label name cannot be empty.";
          }
          if(labelName != label.name) {
            final exists = await controller.isNameExists(labelName);
            if (exists) {
              return "This label already exists.";
            }
          }

          return null; // valid
        },
        onValidSubmit: (labelName) {
          controller.name.value = labelName;
          label.name = labelName;
        },
      ),
    );
  }

  _updateLabel() async {
    await controller.updateLabel(id: label.id);
    controller.reset();
    Get.back();
  }
}
