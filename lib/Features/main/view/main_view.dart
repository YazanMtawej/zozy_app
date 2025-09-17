import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zozy/Features/home/view/home_view.dart';
import 'package:zozy/Features/main/pages/profile_page.dart';
import 'package:zozy/Features/main/pages/shop_page.dart';
import 'package:zozy/Features/main/viewmodel/cubit/main_cubit.dart';
import 'package:zozy/Features/main/viewmodel/cubit/main_state.dart';
import 'package:zozy/core/constants/app_color.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  final List<Widget> pages = const [
    HomeView(),
    ShopPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MainCubit(),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFF121212), // Dark background
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) {
                final offsetAnimation = Tween<Offset>(
                  begin: const Offset(0.2, 0), // Slide from right
                  end: Offset.zero,
                ).animate(animation);

                return SlideTransition(
                  position: offsetAnimation,
                  child: FadeTransition(
                    opacity: animation,
                    child: child,
                  ),
                );
              },
              child: pages[state.currentIndex],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: AppColors.primaryDark,
              currentIndex: state.currentIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColors.accentGold,
              unselectedItemColor: Colors.grey.shade100,
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              unselectedLabelStyle: const TextStyle(fontSize: 12),
              onTap: (index) =>
                  context.read<MainCubit>().changePage(index),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.store),
                  label: "Shop",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
