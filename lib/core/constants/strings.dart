class AppStrings {
  static String firstName = 'الاسم';
  static String secondName = 'الكنية';
  static String age = 'العمر';
  static String nationality = 'الجنسية';
  static String password = 'كلمة المرور';
  static String confirmPassword = 'تأكيد كلمة المرور';
  static String googleLogin = 'أو سجل عبر';
  static String noAccount = 'ليس لديك حساب؟';
  static String haveAccount = 'هل لديك حساب بالفعل؟';
  static String signUp = 'إنشاء حساب';
  static String noSignUp = 'سجل دخولك';
  static String login = 'تسجيل الدخول';
  static String nologin = "أنشئ حسابك من هنا";
  // static String nologin = 'Create Account';
  // static String sendOtp =  "تم إرسال الرمز مجدداً";
  // static String returnOtp =  'إعادة إرسال الرمز';
  // static String verification = 'التحقق';
  // static String verificationCode = 'أدخل رمز التحقق';
  // static String welcome = "Notification";
  static String welcomeb = "أهلاً بك، قم بتسجيل الدخول إلى حسابك";
  static String createAccounts = "أهلاً بك ، قم بإنشاء حسابك الآن";
  static String name = 'اسم المستخدم';
  static String emailOrPhone = 'البريد الالكتروني أو رقم الموبايل';
  static String phone = 'رقم الموبايل';

  static String comfirmPassword = 'تأكيد كلمة المرور';
  static String sendOtp = "تم إرسال الرمز مجدداً";
  static String returnOtp = 'إعادة إرسال الرمز';
  static String verification = 'التحقق';
  static String verificationCode = 'أدخل رمز التحقق';

  static String enterEmail = "أدخل البريد الإلكتروني";
  static String enterEmailhint =
      "الرجاء إدخال عنوان البريد الإلكتروني المرتبط بحسابك ، سيتم ارسال رمز التحقق لإنشاء كلمة مرور جديدة عبر البريد الإلكتروني";
  static String email = "البريد الإلكتروني";
  static String confirmation = "تأكيد";
  static String enterCode =
      'أدخل رمز التحقق المكون من 6 أرقام المرسل إلى بريدك الإلكتروني';
  static String verificationEmail = 'التحقق من بريدك الإلكتروني ';
  static String enterNewPassword = "أدخل كلمة مرور جديدة";
  static String enterNewPasswordhint =
      "يجب أن تكون كلمة المرور الجديدة مختلفة عن كلمة المرور المستخدمة مسبقاً";
  static String resetPassword = "إعادة تعيين كلمة المرور";
  static String forgotPassword = "هل نسيت كلمة المرور ؟ ";
  static String noteVerificationCode = "يرجى إدخال رمز OTP صالح";

  // Educational Profile

  static const educationalProfile = "الملف التعليمي";

  static const educationalProgress = "التقدم التعليمي";

  static const educationalTools = "أدواتي التعليمية";

  static const lastExamResults = "نتائج الاختبارات الأخيرة";

  static const examResults = "نتائج الاختبارات ";

  static const showAll = "عرض الكل";

  static const learningHours = "ساعة تعلم";

  static const completedExams = "اختبارات منجزة";

  static const averageScore = "متوسط الدرجات";

  static const tasks = "المهام";

  static String completedTasksMessage({required int completedTasks}) =>
      "تم إنجاز $completedTasks مهمات من الهدف";

  static String progressCompletedMessage({required int percentage}) =>
      "$percentage% مكتمل";

  static String remainingTasksMessage({required int remainingTasks}) =>
      "$remainingTasks مهمات متبقية";

  static const summaries = "الملخصات";

  static const revisionList = "قائمة المراجعة";

  static const awards = "المكافآت";

  static const certificates = "الشهادات";

  // Revision Section

  static const revisionDescription =
      "تابع تقدمك في مراجعة التفسير والعلوم الشرعية";

  static const chapter = "باب";

  static const continueRevision = "متابعة المراجعة";

  // Awards

  static const currentBalance = "رصيدك الحالي";

  static const points = "نقطة";

  static const currentLevel = "أنت الآن في مستوى";

  static const distinguishedStudent = "الطالب المتميز";

  static const howToGetPoints = "كيف أحصل على مزيد من النقاط؟";

  static const pointsDescription =
      "يمكنك جمع المزيد من النقاط من خلال اجتياز الاختبارات بدرجة لا تقل عن 90 و مافوق من المرة الأولى.";

  static const availableBooks = "كتب متاحة للاستبدال";

  static const bookTitle = "تفسير القرآن الكريم";

  static const author = "ابن كثير";

  static const bookPoints = "150 نقطة";

  static const exchangeBook = "استبدال";


  // Shopping Cart


  static const shoppingCart = "السلة";

  static const selectAll = "تحديد الكل";
  static const unSelectAll = "إلغاء الكل";

  static const emptyCart = "السلة فارغة";

  static const availablePoints = "نقطة متاحة";

  static const scholars = "نخبة من العلماء";

  static const totalRequiredPoints = "إجمالي النقاط المطلوبة";

  static const remainingBalance = "الرصيد المتبقي بعد العملية";

  static const confirmExchange = "تأكيد الاستبدال";

  static const exchangeDescription =
      "سيتم خصم النقاط فور تأكيد العملية. الكتب الورقية يتم تسليمها خلال 3 أيام عمل.";

  /// Dynamic Strings

  static String availablePointsCount(int points) =>
      "$points $availablePoints";

}
