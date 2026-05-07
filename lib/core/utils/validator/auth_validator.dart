class AuthValidator {

   static String? nameValidator(String? value) {
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



// age
static String? ageValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "الرجاء إدخال العمر";
  }

  value = value.trim();

  // تحقق إنه رقم فقط
  final age = int.tryParse(value);
  if (age == null) {
    return " يجب أن يكون رقمًا صحيحًا";
  }

  // تحقق منطقي
  if (age < 1) {
    return "العمر غير صالح";
  }

  if (age < 13) {
    return "يجب أن يكون العمر 13 سنة على الأقل";
  }

  if (age > 120) {
    return "العمر المدخل غير منطقي";
  }

  return null;
}  


// Email Validator
   static String? emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "الرجاء إدخال البريد الإلكتروني";
    }

    value = value.trim();

    if (value.contains('@')) {
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );

      if (!emailRegex.hasMatch(value)) {
        return "البريد الإلكتروني غير صحيح";
      }

      if (value.split('@')[1].split('.').first.length < 2) {
        return "اسم النطاق في البريد الإلكتروني غير صالح. (@) ";
      }

      return null;
    }

   

    value = value.replaceAll(" ", "");

    // if (value.startsWith("+963")) {
    //   value = value.replaceFirst("+963", "0");
    // }
  //       if (!value.startsWith("+963")) {
  //   return "you must enter the mobile number with the code +963";
  // }
    // if (value.startsWith("963")) {
    //   value = value.replaceFirst("963", "0");
    // }

    // final phoneRegex = RegExp(r'^09[0-9]{8}$');

    // if (!phoneRegex.hasMatch(value)) {
    //   return "رقم الموبايل غير صحيح (مثال: +963XXXXXXXXX)";
    // }

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