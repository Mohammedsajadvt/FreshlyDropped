import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshlydropped/core/constants/assets.dart';
import 'package:freshlydropped/data/models/navigation_iteam.dart';
import 'package:freshlydropped/ui/viewmodels/navigation_viewmodel.dart';
import 'package:freshlydropped/ui/views/favorites_view.dart';
import 'package:freshlydropped/ui/views/home_view.dart';
import 'package:freshlydropped/ui/views/info_view.dart';
import 'package:freshlydropped/ui/views/recipes_view.dart';
import 'package:freshlydropped/ui/widgets/bottom_bar_view.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({super.key});

  final List<NavigationIteam> _navIteam = [
    NavigationIteam(icon: Image.asset(AssetsImages.home), label: 'Home'),
    NavigationIteam(icon: Image.asset(AssetsImages.favorite), label: 'Favorite'),
    NavigationIteam(icon: Image.asset(AssetsImages.recipt), label:  'Recipes'),
    NavigationIteam(icon: Image.asset(AssetsImages.info), label: 'Info')
  ];


  final List<Widget> _screens = [
    HomeView(),
    FavoritesView(),
    RecipesView(),
    InfoView()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationViewModel = ref.watch(navigationViewModelProvider);

    return Scaffold(
      body: _screens[navigationViewModel.currentIndex],
      bottomNavigationBar: BottomBarView(_navIteam),
    );
  }
}
