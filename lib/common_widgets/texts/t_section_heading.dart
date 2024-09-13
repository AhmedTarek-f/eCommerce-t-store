import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.titleColor,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = "View all",
    this.onPressed,
  });
  final Color? titleColor;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width*0.0611),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(fit: BoxFit.scaleDown,child: Text(title,style: Theme.of(context).textTheme.headlineSmall!.apply(color: titleColor),maxLines: 1,overflow: TextOverflow.ellipsis,),),
          if(showActionButton) TextButton(onPressed: onPressed, child: Text(buttonTitle)),
        ],
      ),
    );
  }
}
