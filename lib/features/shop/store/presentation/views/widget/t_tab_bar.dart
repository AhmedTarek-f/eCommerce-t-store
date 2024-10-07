import 'package:flutter/material.dart';
import 'package:t_store/core/constants/colors.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({super.key, required this.tabs});

  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Material(
      color: isDarkMode? Colors.black : TColors.white,
      child: TabBar(
          padding: const EdgeInsets.only(bottom: 4),
          tabAlignment: TabAlignment.start,
          isScrollable: true,
          indicatorColor: TColors.primary,
          unselectedLabelColor: TColors.darkerGrey,
          labelColor: isDarkMode?TColors.white : TColors.primary,
          tabs: tabs
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
