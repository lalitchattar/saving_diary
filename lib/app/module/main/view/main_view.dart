import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saving_diary/app/module/bill/view/bill_screen.dart';
import 'package:saving_diary/app/module/budget/view/budget_screen.dart';
import 'package:saving_diary/app/module/home/view/home_screen.dart';
import 'package:saving_diary/app/module/insight/view/insight_screen.dart';
import 'package:saving_diary/app/module/main/controller/bottom_navigation_controller.dart';
import 'package:saving_diary/app/module/more/view/more_screen.dart';
import 'package:hugeicons/hugeicons.dart';


class MainView extends GetView<BottomNavigationController> {
  const MainView({super.key});

  final List<Widget> _screens = const [
    HomeScreen(),
    BillScreen(),
    InsightScreen(),
    BudgetScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: _screens[controller.selectedIndex.value],
        bottomNavigationBar: NavigationBar(
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: controller.onItemTapped,
          destinations: [
            NavigationDestination(
              icon: HugeIcon(icon: HugeIcons.strokeRoundedHome09),
              label: "Home",
            ),
            NavigationDestination(
              icon: HugeIcon(icon: HugeIcons.strokeRoundedInvoice),
              label: "Bills",
            ),
            NavigationDestination(
              icon: HugeIcon(icon: HugeIcons.strokeRoundedAiIdea),
              label: "Insights",
            ),
            NavigationDestination(
              icon: HugeIcon(icon: HugeIcons.strokeRoundedCalculate),
              label: "Budget",
            ),
            NavigationDestination(
              icon: HugeIcon(icon: HugeIcons.strokeRoundedMore03),
              label: "More",
            ),
          ],
        ),
      ),
    );
  }
}
