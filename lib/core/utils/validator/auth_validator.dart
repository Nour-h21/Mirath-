class AuthValidator {

   static String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "requierd name";
    }

    value = value.trim();

    if (value.length < 3) {
      return "the name must be add least 3 letters";
    }

    final nameRegex = RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return "the name must be contain only letters";
    }

    return null; 
  }



   static String? emailOrPhoneValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "this field is requierd";
    }

    value = value.trim();

    if (value.contains('@')) {
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );

      if (!emailRegex.hasMatch(value)) {
        return "email is incorrect";
      }

      if (value.split('@')[1].split('.').first.length < 2) {
        return "the domain name in the email is invalid (@) ";
      }

      return null;
    }

   

    value = value.replaceAll(" ", "");

    // if (value.startsWith("+963")) {
    //   value = value.replaceFirst("+963", "0");
    // }
        if (!value.startsWith("+963")) {
    return "you must enter the mobile number with the code +963";
  }
    // if (value.startsWith("963")) {
    //   value = value.replaceFirst("963", "0");
    // }

    // final phoneRegex = RegExp(r'^09[0-9]{8}$');

    // if (!phoneRegex.hasMatch(value)) {
    //   return "رقم الموبايل غير صحيح (مثال: +963XXXXXXXXX)";
    // }

    return null;
  }


  static String? passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "requierd password";
    }

    if (value.length < 8) {
      return "the password must be ad least 8 charecters";
    }

    // final regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

    // if (!regex.hasMatch(value)) {
    //   return "يجب أن تحتوي كلمة السر على أحرف وأرقام";
    // }

    return null; 
  }


  static String? confirmPasswordValidator(String? value, String passwordValue) {
    if (value == null || value.trim().isEmpty) {
      return "you must confirm the password";
    }

    if (value != passwordValue) {
      return "password dose not match";
    }

    return null;
  }
  
}