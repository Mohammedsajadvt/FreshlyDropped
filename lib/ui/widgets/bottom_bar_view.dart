import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshlydropped/core/constants/colors.dart';
import 'package:freshlydropped/data/models/navigation_iteam.dart';
import 'package:freshlydropped/ui/viewmodels/navigation_viewmodel.dart';

class BottomBarView extends ConsumerWidget {
  final List<NavigationIteam> items;
  const BottomBarView(this.items, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationViewModel = ref.watch(navigationViewModelProvider);
    return BottomNavigationBar(
        onTap: (index) {
          ref.read(navigationViewModelProvider).setCurrentIndex(index);
        },
        unselectedItemColor: AppColor.secondary,
        currentIndex: navigationViewModel.currentIndex,
        items: items
            .map((items) => BottomNavigationBarItem(
                backgroundColor: AppColor.primary,
                icon: items.icon,
                label: items.label))
            .toList());
  }
}
