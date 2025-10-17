import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:saving_diary/app/common/widget/color_picker_screen.dart';
import 'package:saving_diary/app/common/widget/text_box_screen.dart';
import 'package:saving_diary/app/common/widget/validation_message_screen.dart';
import '../../../../../utils/utility.dart';
import '../controller/label_controller.dart';

class AddLabelScreen extends GetView<LabelController> {
  const AddLabelScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;


    return Scaffold(
      appBar: AppBar(title: const Text("Add Label"), centerTitle: true),
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
              label: const Text("Save"),
              onPressed: () {
                if(controller.name.value == '') {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    enableDrag: false,
                    isDismissible: false,
                    builder: (context) => ValidationMessageScreen(errorMessages: ["Name is required"]));
                  return;
                }
                _saveLabel();
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
          SizedBox(
            height: 30.0,
          )
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
        validator: (labelName) async {
          if (labelName.isEmpty) {
            return "Label name cannot be empty.";
          }
          final exists = await controller.isNameExists(labelName);
          if (exists) {
            return "This label already exists.";
          }
          return null; // valid
        },

        // ✅ Called only when valid
        onValidSubmit: (labelName) {
          controller.name.value = labelName;
        },
      ),
    );
  }

  _saveLabel() async {
    await controller.createLabel();
    controller.reset();
    Get.back();
  }
}
