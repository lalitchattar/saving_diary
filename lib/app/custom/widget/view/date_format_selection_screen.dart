import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatBottomSheet extends StatelessWidget {
  final Function(String) onFormatSelected;

  const DateFormatBottomSheet({super.key, required this.onFormatSelected});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final formats = [
      'dd/MM/yyyy',
      'MM/dd/yyyy',
      'yyyy-MM-dd',
      'dd MMM yyyy',
      'EEE, dd MMM yyyy',
      'MMMM dd, yyyy',
      'dd/MM/yyyy',
      'MM/dd/yyyy',
      'yyyy-MM-dd',
      'dd MMM yyyy',
      'EEE, dd MMM yyyy',
      'MMMM dd, yyyy',
    ];

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // --- Header ---
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: colorScheme.outlineVariant.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Text(
                "Select Date Format",
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 12),

              // --- Card with scrollable list ---
              Flexible(
                child: Card(
                  elevation: 0,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: colorScheme.outline.withValues(alpha: 0.8),
                      width: 0.5,
                    ),
                  ),
                  child: Scrollbar(
                    thumbVisibility: true,
                    radius: const Radius.circular(8),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: formats.length,
                      separatorBuilder: (_, __) => Divider(
                        color:
                        colorScheme.outlineVariant.withValues(alpha: 0.8),
                        height: 1,
                      ),
                      itemBuilder: (context, index) {
                        final format = formats[index];
                        String example;
                        try {
                          example = DateFormat(format).format(DateTime.now());
                        } catch (_) {
                          example = 'Invalid';
                        }
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 2,
                          ),
                          trailing: Text(
                            example,
                            style: textTheme.bodyMedium?.copyWith(
                              color: example == 'Invalid'
                                  ? colorScheme.error
                                  : colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          title: Text(
                            format,
                            style: textTheme.bodyLarge?.copyWith(
                              color: colorScheme.onSurface,
                              letterSpacing: 0.1,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            onFormatSelected(format);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // --- Cancel Button ---
              SizedBox(
                width: double.infinity,
                child: FilledButton.tonalIcon(
                  icon: const Icon(Icons.close_rounded),
                  label: const Text("Cancel"),
                  onPressed: () => Navigator.pop(context),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    textStyle: textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
