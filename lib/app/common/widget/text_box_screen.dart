import 'package:flutter/material.dart';

class SingleTextInputScreen extends StatefulWidget {
  final String title;
  final String hintText;
  final Future<String?> Function(String)? validator;
  final Function(String) onValidSubmit;

  const SingleTextInputScreen({
    super.key,
    required this.title,
    required this.hintText,
    this.validator,
    required this.onValidSubmit,
  });

  @override
  State<SingleTextInputScreen> createState() => _SingleTextInputScreenState();
}

class _SingleTextInputScreenState extends State<SingleTextInputScreen> {
  final TextEditingController controller = TextEditingController();
  String? errorMessage;
  bool isLoading = false;

  Future<void> _validateAndSubmit() async {
    setState(() {
      errorMessage = null;
      isLoading = true;
    });

    final text = controller.text.trim();

    String? validationMessage;
    if (widget.validator != null) {
      validationMessage = await widget.validator!(text);
    }

    if (mounted) {
      setState(() {
        isLoading = false;
        errorMessage = validationMessage;
      });

      if (validationMessage == null) {
        Navigator.pop(context);
        widget.onValidSubmit(text);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final maxHeight = MediaQuery.of(context).size.height * 0.4;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme.surfaceVariant,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // --- Grab handle ---
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: colorScheme.outlineVariant.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),

                // --- Header ---
                Center(
                  child: Text(
                    widget.title,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // --- Text Input ---
                TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    filled: true,
                    fillColor: colorScheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: colorScheme.outline,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: colorScheme.primary,
                        width: 1.5,
                      ),
                    ),
                  ),
                ),

                if (errorMessage != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    errorMessage!,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.error,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],

                const SizedBox(height: 20),

                // --- OK Button ---
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: isLoading ? null : _validateAndSubmit,
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      textStyle: textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                      backgroundColor: colorScheme.primaryContainer,
                      foregroundColor: colorScheme.onPrimaryContainer,
                    ),
                    child: isLoading
                        ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                        : const Text("OK"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
