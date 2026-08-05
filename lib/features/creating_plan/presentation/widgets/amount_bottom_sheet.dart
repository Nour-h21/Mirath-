import 'package:flutter/material.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';
import 'package:mirath/core/utils/extensions/widget_extensions.dart';

import '../../../../core/shared/widgets/buttons/auth_button.dart';
import '../../../../core/shared/widgets/buttons/custom_bottom_sheet_container.dart';

class AmountBottomSheet extends StatefulWidget {
  final String title;
  final int initialValue;
  final int maxValue;

  const AmountBottomSheet({
    super.key,
    required this.title,
    required this.initialValue,
    required this.maxValue,
  });

  @override
  State<AmountBottomSheet> createState() => _AmountBottomSheetState();
}

class _AmountBottomSheetState extends State<AmountBottomSheet> {
  late int tempValue;

  @override
  void initState() {
    super.initState();
    tempValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheetContainer(
      height: context.h(35),
      child: Column(
        children: [
          SizedBox(height: context.h(1)),

          Text(
            widget.title,
            style: TextStyle(
              color: AppColors.deepPrimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: context.sp(4),
            ),
          ),

          SizedBox(height: context.h(1)),

          Expanded(
            child: ListWheelScrollView.useDelegate(
              itemExtent: 45,
              perspective: 0.003,
              diameterRatio: 1.5,
              physics: const FixedExtentScrollPhysics(),
              controller: FixedExtentScrollController(
                initialItem: widget.initialValue - 1,
              ),
              onSelectedItemChanged: (index) {
                setState(() {
                  tempValue = index + 1;
                });
              },
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: widget.maxValue,
                builder: (context, index) {
                  final value = index + 1;

                  return Center(
                    child: AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 150),
                      style: TextStyle(
                        color: value == tempValue
                            ? AppColors.primaryColor
                            : Colors.grey,
                        fontSize: value == tempValue
                            ? context.sp(5)
                            : context.sp(4),
                        fontWeight: FontWeight.bold,
                      ),
                      child: Text(value.toString()),
                    ),
                  );
                },
              ),
            ),
          ),

          SizedBox(height: context.h(1)),

          Center(
            child: AuthButton(
             
              text: 'حفظ',
              onPressed: () {
                Navigator.pop(context, tempValue);
              },
              height: context.h(5.5),
              width: context.w(65),
            ),
          ),
        ],
      ).paddingOnlyLR(context, 1, 1),
    );
  }
}

Future<int?> showAmountBottomSheet(
  BuildContext context, {
  required String title,
  required int initialValue,
  required int maxValue,
}) {
  return showModalBottomSheet<int>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => AmountBottomSheet(
      title: title,
      initialValue: initialValue,
      maxValue: maxValue,
    ),
  );
}
