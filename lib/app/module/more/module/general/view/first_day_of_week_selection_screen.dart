import 'package:flutter/material.dart';

class FirstDayOfWeekBottomSheet extends StatelessWidget {
  final Function(String) onDaySelected;

  const FirstDayOfWeekBottomSheet({super.key, required this.onDaySelected});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // List of days
    final days = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];

    final maxHeight = MediaQuery.of(context).size.height * 0.7;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Container(
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
                // --- Grab handle ---
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: colorScheme.outlineVariant.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                // --- Header with centered title and X button ---
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: Text(
                        "Select First Day of Week",
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: colorScheme.onSurface,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: IconButton(
                        icon: Icon(
                          Icons.close_rounded,
                          color: colorScheme.onSurfaceVariant,
                        ),
                        tooltip: "Close",
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // --- Scrollable List ---
                Flexible(
                  child: Card(
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: colorScheme.outline.withOpacity(0.8),
                        width: 0.5,
                      ),
                    ),
                    child: Scrollbar(
                      thumbVisibility: true,
                      radius: const Radius.circular(8),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: days.length,
                        separatorBuilder: (_, __) => Divider(
                          color: colorScheme.outlineVariant.withOpacity(0.8),
                          height: 1,
                        ),
                        itemBuilder: (context, index) {
                          final day = days[index];
                          return ListTile(
                            title: Center(
                              child: Text(
                                day,
                                style: textTheme.bodyLarge?.copyWith(
                                  color: colorScheme.onSurface,
                                  letterSpacing: 0.1,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                              onDaySelected(day);
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
      ),
    );
  }
}
