import 'package:mirath/features/my_summary_page/presentation/page/external_summary_page.dart';
import 'package:mirath/features/my_summary_page/presentation/page/internal_summary_page.dart';

import '../../../../core/core.dart';
import '../../../../core/shared/page/in_background.dart';
import '../widgets/Capsule_tab_widget.dart';

class MySummaryPage extends StatelessWidget {
  const MySummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: InBackgroundPage(
          labelAppBar: 'ملخصاتي',
          onBackPressed: () { GoRouter.of(context).pop(); },
          child: SizedBox(
            height: context.h(88),
            child: Column(
              children: [
                SizedBox(height: context.h(9)),
                TabBar(
                  indicatorWeight: 0,
                  dividerColor: Colors.transparent,
                  isScrollable: false,

                  indicator: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  labelColor: AppColors.offWhite,
                  unselectedLabelColor: AppColors.deepPrimaryColor,
                  labelStyle: AppTextStyles.smallDeepPrimaryStyle(context)
                      .copyWith(
                        color: AppColors.offWhite,
                        fontWeight: FontWeight.bold,
                      ),
                  unselectedLabelStyle: AppTextStyles.smallDeepPrimaryStyle(
                    context,
                  ),
                  tabs: [
                    CapsuleTab(label: 'الداخلية'),
                    CapsuleTab(label: 'الخارجية'),
                  ],
                ),
                 SizedBox(height: context.h(4)),
                Expanded(
                  child: TabBarView(
                    children: [InternalSummaryPage(), ExternalSummaryPage()],
                  ),
                ),
              ],
            ),
          ).paddingSymetricH(context, 3.5),
        ),
      ),
    );
  }
}

// class MySummaryPage extends StatefulWidget {
//   const MySummaryPage({super.key});

//   @override
//   State<MySummaryPage> createState() => _MySummaryPageState();
// }

// class _MySummaryPageState extends State<MySummaryPage> {
//   @override
//   void initState() {
//     super.initState();

//     context.read<MySummaryBloc>().add(GetMySummariesEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MySummaryBloc, MySummaryState>(
//       builder: (context, state) {
//         if (state is MySummaryLoading) {
//           return Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(color: AppColors.primaryColor),
//             ),
//           );
//         }

//         if (state is MySummaryFailure) {
//           return Scaffold(body: Center(child: Text(state.message)));
//         }

//         if (state is MySummarySuccess) {
//           return DefaultTabController(
//             length: 2,
//             child: Directionality(
//               textDirection: TextDirection.rtl,
//               child: InBackgroundPage(
//                 labelAppBar: 'ملخصاتي',
//                 child: SizedBox(
//                   height: context.h(88),
//                   child: Column(
//                     children: [
//                       SizedBox(height: context.h(9)),
//                       TabBar(
//                         indicatorWeight: 0,
//                         dividerColor: Colors.transparent,
//                         isScrollable: false,

//                         indicator: BoxDecoration(
//                           color: AppColors.primaryColor,
//                           borderRadius: BorderRadius.all(Radius.circular(40)),
//                         ),
//                         labelColor: AppColors.offWhite,
//                         unselectedLabelColor: AppColors.deepPrimaryColor,
//                         labelStyle: AppTextStyles.smallDeepPrimaryStyle(context)
//                             .copyWith(
//                               color: AppColors.offWhite,
//                               fontWeight: FontWeight.bold,
//                             ),
//                         unselectedLabelStyle:
//                             AppTextStyles.smallDeepPrimaryStyle(context),
//                         tabs: [
//                           CapsuleTab(label: 'الداخلية'),
//                           CapsuleTab(label: 'الخارجية'),
//                         ],
//                       ),
//                       SizedBox(height: context.h(4)),
//                       Expanded(
//                         child: TabBarView(
//                           children: [
//                             InternalSummaryPage(
//                               summaries: state.internalSummaries,
//                             ),
//                             ExternalSummaryPage(
//                               summaries: state.externalSummaries,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ).paddingSymetricH(context, 3.5),
//               ),
//             ),
//           );
//         }

//         return const SizedBox();
//       },
//     );
//   }
// }
