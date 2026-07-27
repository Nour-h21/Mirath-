import 'package:flutter/material.dart';

import 'package:mirath/core/utils/extensions/context_extensions.dart';

import '../../../../core/design/tokens/colors.dart';

class CustomSelectableChips extends StatelessWidget {
  final List<String> items;
  final List<String> selectedItems;
  final Function(String item) onTap;
  final double? spacing;
  final double? runSpacing;

  const CustomSelectableChips({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onTap,
    this.spacing,
    this.runSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: spacing ?? context.w(1.4),
        runSpacing: runSpacing ?? context.h(0.5),
        children: items.map((item) {
          final selected = selectedItems.contains(item);

          return InkWell(
            borderRadius: BorderRadius.circular(context.w(6)),
            onTap: () => onTap(item),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 50),
              padding: EdgeInsets.symmetric(
                horizontal: context.w(4),
                vertical: context.h(1),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.w(6)),
                border: Border.all(color: AppColors.secondryColor, width: 1.5),
                gradient: selected
                    ? LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [AppColors.baieg, AppColors.offWhite],
                      )
                    : null,
                color: selected ? null : AppColors.offWhite,
                boxShadow: selected
                    ? [
                        const BoxShadow(
                          color: Color(0x40000000),
                          blurRadius: 5,
                          offset: Offset(0, 0),
                        ),
                      ]
                    : [],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: selected
                        ? Container(
                            key: const ValueKey("check"),
                            margin: EdgeInsets.only(left: context.w(1.5)),
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check,
                              size: context.sp(2.8),
                              color: AppColors.baieg,
                            ),
                          )
                        // Text(
                        //     "✓",
                        //     key: ValueKey(item),
                        //     style: TextStyle(
                        //       fontSize: context.sp(3),
                        //       fontWeight: FontWeight.w900,
                        //       color: AppColors.primaryColor,
                        //     ),
                        //   )
                        : const SizedBox.shrink(),
                  ),

                  if (selected) SizedBox(width: context.w(1)),

                  Text(
                    item,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: selected
                          ? AppColors.deepPrimaryColor
                          : AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
