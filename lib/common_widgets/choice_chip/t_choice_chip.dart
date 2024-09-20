import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/helper/get_color.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected
  });
  final String text;
  final bool selected;
  final void Function(bool)? onSelected;
  @override
  Widget build(BuildContext context) {
    final bool isColor = GetColor.getColor(color: text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: isColor? TextStyle(color: selected? TColors.white : null) : null,
        avatar: isColor?
        TRoundedContainer(radius: 100,width: 50,height: 50,backGroundColor: GetColor.getColor(color: text)!,):
        null,
        backgroundColor:isColor? GetColor.getColor(color: text):null,
        shape:isColor? const CircleBorder(): null,
        labelPadding: isColor? const EdgeInsets.all(0): null,
        padding:isColor? const EdgeInsets.all(0): null,
        selectedColor:isColor? GetColor.getColor(color: text):null,

      ),
    );
  }
}
