import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zozy/Features/profile/view/profile_page.dart';
import 'package:zozy/core/constants/app_color.dart';
import 'package:zozy/Features/home/view/home_view.dart';
import 'package:zozy/Features/main/pages/shop_page.dart';
import 'package:zozy/Features/main/viewmodel/cubit/main_cubit.dart';
import 'package:zozy/Features/main/viewmodel/cubit/main_state.dart';

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
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryDark,
                  AppColors.primaryMid,
                  AppColors.primaryLight,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: PageTransitionSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation, secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.1, 0.1),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  );
                },
                child: pages[state.currentIndex],
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  color: AppColors.primaryDark.withOpacity(0.9),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      offset: const Offset(0, -3),
                      blurRadius: 8,
                    )
                  ],
                ),
                child: BottomNavigationBar(
                  currentIndex: state.currentIndex,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: AppColors.accentGold,
                  unselectedItemColor: AppColors.textLight,
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
              ),
            ),
          );
        },
      ),
    );
  }
}
