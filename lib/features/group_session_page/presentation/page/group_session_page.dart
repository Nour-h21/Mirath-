import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:mirath/core/shared/widgets/buttons/cancle_button.dart';

import '../../../../core/core.dart';
import '../../../../core/shared/widgets/buttons/auth_button.dart';
import '../../../summary_details_page/presentation/widgets/summary_text_field_widget.dart';
import '../../domain/entities/meeting_entity.dart';
import '../bloc/meeting_bloc.dart';
import '../bloc/meeting_event.dart';
import '../bloc/meeting_state.dart';

// class GroupSessionPage extends StatefulWidget {
//   const GroupSessionPage({super.key});

//   @override
//   State<GroupSessionPage> createState() => _GroupSessionPageState();
// }

// class _GroupSessionPageState extends State<GroupSessionPage>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   final instantFormKey = GlobalKey<FormState>();
//   final scheduleFormKey = GlobalKey<FormState>();

//   final instantTitleController = TextEditingController();
//   final instantDescriptionController = TextEditingController();

//   final scheduleTitleController = TextEditingController();
//   final scheduleDescriptionController = TextEditingController();

//   final JitsiMeet jitsiMeet = JitsiMeet();

//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;

//   @override
//   void initState() {
//     super.initState();

//     _tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();

//     instantTitleController.dispose();
//     instantDescriptionController.dispose();

//     scheduleTitleController.dispose();
//     scheduleDescriptionController.dispose();

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: InBackgroundPage(
//         labelAppBar: "الجلسات الجماعية",
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: context.w(4)),
//           child: Column(
//             children: [
//               SizedBox(height: context.h(8)),

//               Container(
//                 decoration: BoxDecoration(
//                   color: AppColors.offWhite,
//                   borderRadius: BorderRadius.circular(18),
//                   gradient: LinearGradient(
//                     end: Alignment.topLeft,
//                     begin: Alignment.bottomRight,
//                     colors: [
//                       AppColors.baieg,
//                       AppColors.grey,
//                       AppColors.offWhite,
//                       AppColors.grey,
//                       AppColors.offWhite,
//                       AppColors.baieg,
//                     ],
//                   ),
//                 ),
//                 child: TabBar(
//                   controller: _tabController,
//                   dividerColor: Colors.transparent,
//                   indicatorColor: AppColors.primaryColor,
//                   labelColor: AppColors.primaryColor,
//                   unselectedLabelColor: const Color.fromARGB(
//                     255,
//                     129,
//                     128,
//                     128,
//                   ),
//                   tabs: const [
//                     Tab(icon: Icon(Icons.flash_on_rounded), text: "جلسة فورية"),
//                     Tab(icon: Icon(Icons.calendar_month), text: "جدولة جلسة"),
//                   ],
//                 ),
//               ),

//               SizedBox(height: context.h(2)),

//               Expanded(
//                 child: TabBarView(
//                   controller: _tabController,
//                   children: [_instantSessionTab(), _scheduledSessionTab()],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _instantSessionTab() {
//     return Form(
//       key: instantFormKey,
//       child: ListView(
//         children: [
//           SizedBox(height: context.h(5)),

//           SummaryTextFormField(
//             controller: instantTitleController,
//             hintText: "عنوان الجلسة",
//             maxLines: 1,
//             readOnly: false,
//             borderColor: AppColors.primaryColor,
//             validator: (value) {
//               if (value == null || value.trim().isEmpty) {
//                 return "الرجاء إدخال عنوان الجلسة";
//               }

//               if (value.length < 3) {
//                 return "العنوان قصير جداً";
//               }

//               return null;
//             },
//           ),

//           SizedBox(height: context.h(2)),

//           SummaryTextFormField(
//             controller: instantDescriptionController,
//             hintText: "وصف الجلسة",
//             maxLines: 8,
//             readOnly: false,
//             borderColor: AppColors.primaryColor,
//             validator: (value) {
//               if (value == null || value.trim().isEmpty) {
//                 return "الرجاء إدخال وصف الجلسة";
//               }

//               return null;
//             },
//           ),

//           SizedBox(height: context.h(5)),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               AuthButton(
//                 text: "إنشاء",
//                 width: context.w(35),
//                 height: context.h(5.5),
//                 onPressed: createInstantSession,
//                 textStyle: AppTextStyles.authbuttonStyle(context),
//               ),

//               SizedBox(width: context.w(3)),

//               CancleButton(
//                 text: "إلغاء",
//                 width: context.w(35),
//                 height: context.h(5.5),
//                 onPressed: () {
//                   instantTitleController.clear();
//                   instantDescriptionController.clear();
//                 },
//                 textStyle: AppTextStyles.login3Style(
//                   context,
//                 ).copyWith(color: AppColors.primaryColor),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   void createInstantSession() {
//     if (!instantFormKey.currentState!.validate()) {
//       return;
//     }

//     const roomId = "tarahm_room_2026";

//     final meetingLink = "https://meet.jit.si/$roomId";

//     showInstantDialog(meetingLink);
//   }

//   /////ALERT FOR CREATE SEESION
//   void showInstantDialog(String link) {
//     showDialog(
//       context: context,
//       barrierColor: Colors.black.withOpacity(.15),
//       builder: (_) {
//         return Directionality(
//           textDirection: TextDirection.rtl,
//           child: AlertDialog(
//             backgroundColor: AppColors.lightBaieg,

//             title: Row(
//               children: [
//                 Text("☎️", style: TextStyle(fontSize: context.h(2.8))),
//                 SizedBox(width: context.w(1.5)),
//                 Text(
//                   "رابط الجلسة",
//                   style: AppTextStyles.midDeepPrimaryColorStyle(context),
//                 ),
//               ],
//             ),

//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(context.h(1.5)),
//                   decoration: BoxDecoration(
//                     color: AppColors.offWhite,
//                     borderRadius: BorderRadius.circular(16),
//                     gradient: LinearGradient(
//                       end: Alignment.topLeft,
//                       begin: Alignment.bottomRight,
//                       colors: [
//                         AppColors.baieg,
//                         AppColors.offWhite,
//                         AppColors.baieg,
//                       ],
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Text(link, overflow: TextOverflow.ellipsis),
//                       ),

//                       IconButton(
//                         onPressed: () async {
//                           await Clipboard.setData(ClipboardData(text: link));

//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(content: Text("تم نسخ الرابط")),
//                           );
//                         },
//                         icon: Icon(Icons.copy, color: AppColors.primaryColor),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),

//             actions: [
//               TextButton(
//                 onPressed: joinMeeting,
//                 child: Text(
//                   "انضمام",
//                   style: AppTextStyles.login3Style(context),
//                 ),
//               ),

//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text(
//                   "إلغاء",
//                   style: AppTextStyles.login3Style(
//                     context,
//                   ).copyWith(color: Colors.red),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Future<void> joinMeeting() async {
//     try {
//       var options = JitsiMeetConferenceOptions(
//         room: "tarahm_room_2026",
//         serverURL: "https://meet.jit.si",
//         configOverrides: {
//           "startWithAudioMuted": false,
//           "startWithVideoMuted": false,
//           "subject": instantTitleController.text,
//         },
//         featureFlags: {"unsaferoomwarning.enabled": false},
//       );

//       await jitsiMeet.join(options);
//     } catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text("حدث خطأ أثناء الانضمام للجلسة")));
//     }
//   }

//   Widget _scheduledSessionTab() {
//     return Form(
//       key: scheduleFormKey,
//       child: ListView(
//         children: [
//           SizedBox(height: context.h(2)),

//           SummaryTextFormField(
//             controller: scheduleTitleController,
//             hintText: "عنوان الجلسة",
//             maxLines: 1,
//             readOnly: false,
//             borderColor: AppColors.primaryColor,
//             validator: (value) {
//               if (value == null || value.trim().isEmpty) {
//                 return "الرجاء إدخال عنوان الجلسة";
//               }

//               return null;
//             },
//           ),

//           SizedBox(height: context.h(2)),

//           SummaryTextFormField(
//             controller: scheduleDescriptionController,
//             hintText: "وصف الجلسة",
//             maxLines: 8,
//             readOnly: false,
//             borderColor: AppColors.primaryColor,
//             validator: (value) {
//               if (value == null || value.trim().isEmpty) {
//                 return "الرجاء إدخال وصف الجلسة";
//               }

//               return null;
//             },
//           ),

//           SizedBox(height: context.h(2)),
//           GestureDetector(
//             onTap: selectDate,
//             child: Container(
//               padding: EdgeInsets.all(context.h(2)),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(18),
//                 border: Border.all(color: AppColors.primaryColor),
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.calendar_today, color: AppColors.primaryColor),

//                   SizedBox(width: context.w(3)),

//                   Text(
//                     selectedDate == null
//                         ? "اختيار التاريخ"
//                         : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           SizedBox(height: context.h(2)),
//           GestureDetector(
//             onTap: selectTime,
//             child: Container(
//               padding: EdgeInsets.all(context.h(2)),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(18),
//                 border: Border.all(color: AppColors.primaryColor),
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.access_time, color: AppColors.primaryColor),

//                   SizedBox(width: context.w(3)),

//                   Text(
//                     selectedTime == null
//                         ? "اختيار الوقت"
//                         : selectedTime!.format(context),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           SizedBox(height: context.h(5)),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               AuthButton(
//                 text: "حفظ",
//                 width: context.w(35),
//                 height: context.h(5.5),
//                 onPressed: saveSession,
//                 textStyle: AppTextStyles.authbuttonStyle(context),
//               ),

//               SizedBox(width: context.w(3)),

//               CancleButton(
//                 text: "إلغاء",
//                 width: context.w(35),
//                 height: context.h(5.5),
//                 onPressed: clearScheduleData,
//                 textStyle: AppTextStyles.login3Style(
//                   context,
//                 ).copyWith(color: AppColors.primaryColor),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> selectDate() async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2035),
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
//           ),
//           child: child!,
//         );
//       },
//     );

//     if (pickedDate != null) {
//       setState(() {
//         selectedDate = pickedDate;
//       });
//     }
//   }

//   Future<void> selectTime() async {
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//       builder: (context, child) {
//         ///////
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: ColorScheme.light(primary: AppColors.primaryColor,),
//             timePickerTheme: TimePickerThemeData(dayPeriodColor: AppColors.baieg,dayPeriodTextColor: AppColors.primaryColor)
//           ),
//           child: child!,
//         );
//       },
//       ////
//     );

//     if (pickedTime != null) {
//       setState(() {
//         selectedTime = pickedTime;
//       });
//     }
//   }

//   void clearScheduleData() {
//     scheduleTitleController.clear();
//     scheduleDescriptionController.clear();

//     setState(() {
//       selectedDate = null;
//       selectedTime = null;
//     });
//   }

//   void saveSession() {
//     if (!scheduleFormKey.currentState!.validate()) {
//       return;
//     }

//     if (selectedDate == null) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("الرجاء اختيار التاريخ")));

//       return;
//     }

//     if (selectedTime == null) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(const SnackBar(content: Text("الرجاء اختيار الوقت")));

//       return;
//     }

//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         backgroundColor: Colors.green,
//         content: Text(
//           "تم حفظ الجلسة في قائمة مهامك",
//           // style: AppTextStyles.login3Style(context),
//         ),
//       ),
//     );

//     clearScheduleData();
//   }
// }

// imports تبع مشروعك
// import ...
// import 'package:get_it/get_it.dart';

class GroupSessionPage extends StatefulWidget {
  const GroupSessionPage({super.key});

  @override
  State<GroupSessionPage> createState() => _GroupSessionPageState();
}

class _GroupSessionPageState extends State<GroupSessionPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final instantFormKey = GlobalKey<FormState>();
  final scheduleFormKey = GlobalKey<FormState>();

  final instantTitleController = TextEditingController();
  final instantDescriptionController = TextEditingController();

  final scheduleTitleController = TextEditingController();
  final scheduleDescriptionController = TextEditingController();

  final JitsiMeet jitsiMeet = JitsiMeet();

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  /// الجلسة التي تم إنشاؤها حالياً
  MeetingEntity? createdMeeting;

  /// حتى نعرف أي جلسة نريد الانضمام إليها
  String? currentMeetingId;

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();

    instantTitleController.dispose();
    instantDescriptionController.dispose();

    scheduleTitleController.dispose();
    scheduleDescriptionController.dispose();

    super.dispose();
  }

  // ============================================================
  // BUILD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return BlocListener<MeetingBloc, MeetingState>(
      listener: _meetingListener,

      child: Directionality(
        textDirection: TextDirection.rtl,

        child: InBackgroundPage(
          labelAppBar: "الجلسات الجماعية",

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.w(4)),

            child: Column(
              children: [
                SizedBox(height: context.h(8)),

                // ==================================================
                // TAB BAR
                // ==================================================
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    borderRadius: BorderRadius.circular(18),

                    gradient: LinearGradient(
                      end: Alignment.topLeft,
                      begin: Alignment.bottomRight,

                      colors: [
                        AppColors.baieg,
                        AppColors.grey,
                        AppColors.offWhite,
                        AppColors.grey,
                        AppColors.offWhite,
                        AppColors.baieg,
                      ],
                    ),
                  ),

                  child: TabBar(
                    controller: _tabController,

                    dividerColor: Colors.transparent,

                    indicatorColor: AppColors.primaryColor,

                    labelColor: AppColors.primaryColor,

                    unselectedLabelColor: const Color.fromARGB(
                      255,
                      129,
                      128,
                      128,
                    ),

                    tabs: const [
                      Tab(
                        icon: Icon(Icons.flash_on_rounded),
                        text: "جلسة فورية",
                      ),

                      Tab(icon: Icon(Icons.calendar_month), text: "جدولة جلسة"),
                    ],
                  ),
                ),
                SizedBox(height: context.h(2)),

                // ==================================================
                // TAB VIEW
                // ==================================================
                Expanded(
                  child: TabBarView(
                    controller: _tabController,

                    children: [_instantSessionTab(), _scheduledSessionTab()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // BLOC LISTENER
  // ============================================================

  void _meetingListener(BuildContext context, MeetingState state) {
    // ==========================================================
    // LOADING
    // ==========================================================

    if (state is MeetingLoading) {
      setState(() {
        _isLoading = true;
      });

      return;
    }

    // ==========================================================
    // CREATE MEETING SUCCESS
    // ==========================================================

    if (state is MeetingSuccess) {
      setState(() {
        _isLoading = false;
      });

      final meeting = state.meeting;

      debugPrint("CREATE MEETING SUCCESS");

      debugPrint("Meeting ID: ${meeting.id}");

      debugPrint("Meeting Type: ${meeting.type}");

      debugPrint("Meeting Link: ${meeting.meetingLink}");

      debugPrint("Room Name: ${meeting.roomName}");

      createdMeeting = meeting;

      currentMeetingId = meeting.id.toString();

      // ========================================================
      // INSTANT
      // ========================================================

      if (meeting.type == "instant") {
        showInstantDialog(meeting);
      }
      // ========================================================
      // SCHEDULED
      // ========================================================
      else if (meeting.type == "scheduled") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text("تم حفظ الجلسة في قائمة مهامك"),
          ),
        );

        clearScheduleData();
      }

      return;
    }

    // ==========================================================
    // JOIN SUCCESS
    // ==========================================================

    if (state is JoinMeetingSuccess) {
      setState(() {
        _isLoading = false;
      });

      debugPrint("JOIN MEETING SUCCESS");

      debugPrint("Jitsi Room: ${state.meeting.jitsiRoom}");

      debugPrint("Jitsi Server: ${state.meeting.serverUrl}");

      // ========================================================
      // الآن فقط ندخل إلى Jitsi
      // ========================================================

      _joinJitsi(
        room: state.meeting.jitsiRoom,
        token: state.meeting.jitsiToken,
        serverUrl: state.meeting.serverUrl,
        title: state.meeting.title,
      );

      return;
    }

    // ==========================================================
    // FAILURE
    // ==========================================================

    if (state is MeetingFailure) {
      setState(() {
        _isLoading = false;
      });

      debugPrint("MEETING FAILURE: ${state.message}");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(state.message)),
      );

      return;
    }
  } // ============================================================
  // INSTANT SESSION TAB
  // ============================================================

  Widget _instantSessionTab() {
    return Form(
      key: instantFormKey,

      child: ListView(
        children: [
          SizedBox(height: context.h(5)),

          // ======================================================
          // TITLE
          // ======================================================
          SummaryTextFormField(
            controller: instantTitleController,

            hintText: "عنوان الجلسة",

            maxLines: 1,

            readOnly: false,

            borderColor: AppColors.primaryColor,

            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "الرجاء إدخال عنوان الجلسة";
              }

              if (value.trim().length < 3) {
                return "العنوان قصير جداً";
              }

              return null;
            },
          ),

          SizedBox(height: context.h(2)),

          // ======================================================
          // DESCRIPTION
          // ======================================================
          SummaryTextFormField(
            controller: instantDescriptionController,

            hintText: "وصف الجلسة",

            maxLines: 8,

            readOnly: false,

            borderColor: AppColors.primaryColor,

            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "الرجاء إدخال وصف الجلسة";
              }

              if (value.trim().length < 5) {
                return "الوصف قصير جداً";
              }

              return null;
            },
          ),

          SizedBox(height: context.h(5)),

          // ======================================================
          // BUTTONS
          // ======================================================
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              AuthButton(
                text: "إنشاء",

                width: context.w(35),

                height: context.h(5.5),

                onPressed: _isLoading ? null : createInstantSession,

                textStyle: AppTextStyles.authbuttonStyle(context),
              ),

              SizedBox(width: context.w(3)),

              CancleButton(
                text: "إلغاء",

                width: context.w(35),

                height: context.h(5.5),

                onPressed: _isLoading ? null : clearInstantData,

                textStyle: AppTextStyles.login3Style(
                  context,
                ).copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ============================================================
  // CREATE INSTANT SESSION
  // ============================================================

  void createInstantSession() {
    if (!instantFormKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();

    context.read<MeetingBloc>().add(
      CreateMeetingEvent(
        title: instantTitleController.text.trim(),

        description: instantDescriptionController.text.trim(),

        type: "instant",
      ),
    );
  }

  // ============================================================
  // INSTANT DIALOG
  // ============================================================
  void showInstantDialog(MeetingEntity meeting) {
    showDialog(
      context: context,

      barrierColor: Colors.black.withOpacity(.15),

      builder: (_) {
        return Directionality(
          textDirection: TextDirection.rtl,

          child: AlertDialog(
            backgroundColor: AppColors.lightBaieg,

            title: Row(
              children: [
                Text("☎️", style: TextStyle(fontSize: context.h(2.8))),

                SizedBox(width: context.w(1.5)),

                Text(
                  "رابط الجلسة",

                  style: AppTextStyles.midDeepPrimaryColorStyle(context),
                ),
              ],
            ),

            content: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                Container(
                  padding: EdgeInsets.all(context.h(1.5)),

                  decoration: BoxDecoration(
                    color: AppColors.offWhite,

                    borderRadius: BorderRadius.circular(16),

                    gradient: LinearGradient(
                      end: Alignment.topLeft,

                      begin: Alignment.bottomRight,

                      colors: [
                        AppColors.baieg,
                        AppColors.offWhite,
                        AppColors.baieg,
                      ],
                    ),
                  ),

                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          meeting.meetingLink,

                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      IconButton(
                        onPressed: () async {
                          await Clipboard.setData(
                            ClipboardData(text: meeting.meetingLink),
                          );

                          if (!mounted) {
                            return;
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("تم نسخ الرابط")),
                          );
                        },

                        icon: Icon(Icons.copy, color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            actions: [
              TextButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                  _requestJoinMeeting(meeting.id);
                },

                child: Text(
                  "انضمام",

                  style: AppTextStyles.login3Style(context),
                ),
              ),

              TextButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },

                child: Text(
                  "إلغاء",
                  style: AppTextStyles.login3Style(
                    context,
                  ).copyWith(color: Colors.red),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ============================================================
  // REQUEST JOIN MEETING
  // ============================================================

  void _requestJoinMeeting(int meetingId) {
    context.read<MeetingBloc>().add(JoinMeetingEvent(meetingId: meetingId));
  }

  // ============================================================
  // JOIN JITSI
  // ============================================================

  Future<void> _joinJitsi({
    required String room,
    required String token,
    required String serverUrl,
    required String title,
  }) async {
    try {
      final options = JitsiMeetConferenceOptions(
        room: room,

        serverURL: serverUrl,

        token: token,

        configOverrides: {
          "startWithAudioMuted": false,
          "startWithVideoMuted": false,
          "subject": title,
        },

        featureFlags: {"unsaferoomwarning.enabled": false},
      );

      // await jitsiMeet.join(options);
      final listener = JitsiMeetEventListener(
        conferenceJoined: (url) {
          debugPrint("JITSI: Conference joined: $url");
        },

        conferenceTerminated: (url, error) {
          debugPrint("JITSI: Conference terminated: $url | error: $error");
        },

        readyToClose: () {
          debugPrint("JITSI: Ready to close");
        },
      );

      await jitsiMeet.join(options, listener);
    } catch (e) {
      debugPrint("JITSI ERROR: $e");

      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("حدث خطأ أثناء الدخول إلى الجلسة"),
        ),
      );
    }
  }

  // ============================================================
  // SCHEDULED SESSION TAB
  // ============================================================

  Widget _scheduledSessionTab() {
    return Form(
      key: scheduleFormKey,

      child: ListView(
        children: [
          SizedBox(height: context.h(2)),

          // ======================================================
          // TITLE
          // ======================================================
          SummaryTextFormField(
            controller: scheduleTitleController,

            hintText: "عنوان الجلسة",

            maxLines: 1,

            readOnly: false,

            borderColor: AppColors.primaryColor,

            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "الرجاء إدخال عنوان الجلسة";
              }

              if (value.trim().length < 3) {
                return "العنوان قصير جداً";
              }

              return null;
            },
          ),

          SizedBox(height: context.h(2)),

          // ======================================================
          // DESCRIPTION
          // ======================================================
          SummaryTextFormField(
            controller: scheduleDescriptionController,

            hintText: "وصف الجلسة",

            maxLines: 8,

            readOnly: false,

            borderColor: AppColors.primaryColor,

            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "الرجاء إدخال وصف الجلسة";
              }

              if (value.trim().length < 5) {
                return "الوصف قصير جداً";
              }

              return null;
            },
          ),

          SizedBox(height: context.h(2)),

          // ======================================================
          // DATE
          // ======================================================
          GestureDetector(
            onTap: _isLoading ? null : selectDate,
            child: Container(
              padding: EdgeInsets.all(context.h(2)),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),

                border: Border.all(color: AppColors.primaryColor),
              ),

              child: Row(
                children: [
                  Icon(Icons.calendar_today, color: AppColors.primaryColor),

                  SizedBox(width: context.w(3)),

                  Text(
                    selectedDate == null
                        ? "اختيار التاريخ"
                        : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: context.h(2)),

          // ======================================================
          // TIME
          // ======================================================
          GestureDetector(
            onTap: _isLoading ? null : selectTime,

            child: Container(
              padding: EdgeInsets.all(context.h(2)),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),

                border: Border.all(color: AppColors.primaryColor),
              ),

              child: Row(
                children: [
                  Icon(Icons.access_time, color: AppColors.primaryColor),

                  SizedBox(width: context.w(3)),

                  Text(
                    selectedTime == null
                        ? "اختيار الوقت"
                        : selectedTime!.format(context),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: context.h(5)),

          // ======================================================
          // BUTTONS
          // ======================================================
          Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              AuthButton(
                text: "حفظ",

                width: context.w(35),

                height: context.h(5.5),

                onPressed: _isLoading ? null : saveSession,

                textStyle: AppTextStyles.authbuttonStyle(context),
              ),

              SizedBox(width: context.w(3)),

              CancleButton(
                text: "إلغاء",

                width: context.w(35),

                height: context.h(5.5),

                onPressed: _isLoading ? null : clearScheduleData,

                textStyle: AppTextStyles.login3Style(
                  context,
                ).copyWith(color: AppColors.primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  } // ============================================================
  // SELECT DATE
  // ============================================================

  Future<void> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,

      initialDate: selectedDate ?? DateTime.now(),

      firstDate: DateTime.now(),

      lastDate: DateTime(2035),

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
          ),

          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  // ============================================================
  // SELECT TIME
  // ============================================================

  Future<void> selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,

      initialTime: selectedTime ?? TimeOfDay.now(),

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: AppColors.primaryColor),

            timePickerTheme: TimePickerThemeData(
              dayPeriodColor: AppColors.baieg,

              dayPeriodTextColor: AppColors.primaryColor,
            ),
          ),

          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  // ============================================================
  // SAVE SCHEDULED SESSION
  // ============================================================

  void saveSession() {
    if (!scheduleFormKey.currentState!.validate()) {
      return;
    }

    // ==========================================================
    // DATE
    // ==========================================================

    if (selectedDate == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("الرجاء اختيار التاريخ")));

      return;
    }

    // ==========================================================
    // TIME
    // ==========================================================

    if (selectedTime == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("الرجاء اختيار الوقت")));

      return;
    }

    FocusScope.of(context).unfocus();

    // ==========================================================
    // FORMAT DATE
    // ==========================================================

    final date =
        "${selectedDate!.year.toString().padLeft(4, '0')}-"
        "${selectedDate!.month.toString().padLeft(2, '0')}-"
        "${selectedDate!.day.toString().padLeft(2, '0')}";

    // ==========================================================
    // FORMAT TIME
    // ==========================================================

    final time =
        "${selectedTime!.hour.toString().padLeft(2, '0')}:"
        "${selectedTime!.minute.toString().padLeft(2, '0')}";

    debugPrint("Scheduled date: $date");

    debugPrint("Scheduled time: $time");

    // ==========================================================
    // SEND REQUEST
    // ==========================================================

    context.read<MeetingBloc>().add(
      CreateMeetingEvent(
        title: scheduleTitleController.text.trim(),

        description: scheduleDescriptionController.text.trim(),
        type: "scheduled",

        scheduledDate: date,

        scheduledTime: time,
      ),
    );
  }

  // ============================================================
  // CLEAR INSTANT
  // ============================================================

  void clearInstantData() {
    instantTitleController.clear();

    instantDescriptionController.clear();

    if (mounted) {
      setState(() {
        createdMeeting = null;
        currentMeetingId = null;
      });
    }
  }

  // ============================================================
  // CLEAR SCHEDULE
  // ============================================================

  void clearScheduleData() {
    scheduleTitleController.clear();

    scheduleDescriptionController.clear();

    if (mounted) {
      setState(() {
        selectedDate = null;
        selectedTime = null;
      });
    }
  }
}
