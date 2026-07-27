import 'package:flutter/material.dart';

import '../../../../core/shared/page/in_background.dart';

class planView extends StatelessWidget {
  const planView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: InBackgroundPage(
            labelAppBar: "مهامي اليومية",
            child: Column(
              children: [

              ],
            )
          ),
         ),
      ),
    );
  }
}