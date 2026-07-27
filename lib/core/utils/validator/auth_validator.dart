class AuthValidator {

   static String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "الرجاء إدخال الاسم";
    }

    value = value.trim();

    if (value.length < 2) {
      return "يجب أن يحتوي الاسم على 2 حروف على الأقل";
    }

    final nameRegex = RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return "يجب أن يحتوي الاسم على أحرف فقط";
    }

    return null; 
  }

  static String? nickNameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "الرجاء إدخال الاسم";
    }

    value = value.trim();

    if (value.length < 3) {
      return "يجب أن يحتوي الاسم على 3 حروف على الأقل";
    }

    final nameRegex = RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return "يجب أن يحتوي الاسم على أحرف فقط";
    }

    return null; 
  }




static String? ageValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "الرجاء إدخال العمر";
  }

  final trimmedValue = value.trim();

  // التأكد أنه رقم
  final age = int.tryParse(trimmedValue);

  if (age == null) {
    return "يجب إدخال رقم صحيح";
  }

  // منع الأرقام السالبة أو الصفر
  if (age <= 0) {
    return "العمر غير صالح";
  }

  // أقل عمر مسموح
  if (age < 13) {
    return "يجب أن يكون العمر 13 سنة على الأقل";
  }

  // حد منطقي أعلى
  if (age > 120) {
    return "العمر المدخل غير منطقي";
  }

  return null;
}


static String? emailValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "الرجاء إدخال البريد الإلكتروني";
  }

  value = value.trim();

  // ❌ إذا المستخدم عم يكتب بس أحرف بدون @
  if (!value.contains('@')) {
    return "يجب كتابة البريد الالكتروني بهذه الصيغة example@gmail.com";
  }

  final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  if (!emailRegex.hasMatch(value)) {
    return "يجب كتابة البريد الالكتروني بهذه الصيغة example@gmail.com";
  }

  final parts = value.split('@');

  if (parts.length != 2) {
    return "يجب كتابة البريد الالكتروني بهذه الصيغة example@gmail.com";
  }

  final domainParts = parts[1].split('.');

  if (domainParts.length < 2) {
    return "يجب كتابة البريد الالكتروني بهذه الصيغة example@gmail.com";
  }

  if (domainParts.first.length < 2) {
    return "يجب كتابة البريد الالكتروني بهذه الصيغة example@gmail.com";
  }

  return null;
}

static String? nationalityValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "الرجاء اختيار الجنسية";
  }

  return null;
}

// password

  static String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "الرجاء إدخال كلمة المرور";
    }

    if (value.length < 8) {
      return "يجب أن تكون كلمة المرور على الأقل ٨ أحرف أو أرقام";
    }

    // final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

    // if (!regex.hasMatch(value)) {
    //   return "يجب أن تحتوي كلمة السر على أحرف وأرقام";
    // }

    return null; 
  }


  static String? confirmPasswordValidator(String? value, String passwordValue) {
    if (value == null || value.trim().isEmpty) {
      return "يجب تأكيد كلمة المرور";
    }

    if (value != passwordValue) {
      return "كلمة المرور غير مطابقة";
    }

    return null;
  }
  
}