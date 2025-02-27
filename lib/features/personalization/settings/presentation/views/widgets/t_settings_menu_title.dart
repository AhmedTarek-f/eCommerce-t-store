import 'package:flutter/material.dart';
import 'package:t_store/core/constants/colors.dart';

class TSettingsMenuTile extends StatelessWidget {
  const TSettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
  });
  final IconData icon;
  final String title;
  final String subTitle;
  final Widget? trailing;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: ListTile(
        leading: Icon(icon,size: 28,color: TColors.primary,),
        title: Text(title,style: Theme.of(context).textTheme.titleMedium,),
        subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium,),
        trailing: trailing,
      ),
    );
  }
}
