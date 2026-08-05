import 'package:flutter/material.dart';
import 'package:mirath/core/design/tokens/colors.dart';
import 'package:mirath/core/utils/extensions/context_extensions.dart';

class AppTextStyles {
  static TextStyle displayLarge(BuildContext context) {
    return TextStyle(
      fontSize: context.sp(6), // ⬅️ أصغر وأجمل
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold,
      fontFamily: 'Arima',
    );
  }

  static TextStyle hintSmall(BuildContext context) {
    return TextStyle(
      fontSize: context.sp(3.5),
      color: AppColors.deepPrimaryColor,
      fontFamily: 'Arima',
    );
  }

  static TextStyle loginStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.deepPrimaryColor,
      fontSize: context.sp(4.1),
      fontWeight: FontWeight.w600,
      fontFamily: 'Arima',
    );
  }

  static TextStyle labelStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.secondryColor,
      fontSize: context.sp(3.4),
      fontWeight: FontWeight.w700,
      fontFamily: 'Arima',
    );
  }

  static TextStyle errorStyle(BuildContext context) {
    return TextStyle(
      color: Colors.red,
      fontSize: context.sp(3),
      fontFamily: 'Arima',
    );
  }

  static TextStyle login1Style(BuildContext context) {
    return TextStyle(
      color: AppColors.deepPrimaryColor,
      fontSize: context.sp(3.7),
      fontWeight: FontWeight.w600,
      fontFamily: 'Arima',
    );
  }

  static TextStyle login2Style(BuildContext context) {
    return TextStyle(
      color: AppColors.primaryColor,
      fontSize: context.sp(3.8),
      fontWeight: FontWeight.bold,
      fontFamily: 'Arima',
    );
  }

  static TextStyle login3Style(BuildContext context) {
    return TextStyle(
      color: AppColors.black,
      fontSize: context.sp(3.6),
      fontWeight: FontWeight.w600,
      fontFamily: 'Arima',
    );
  }

  static TextStyle googleLoginStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.offPink,
      fontSize: context.sp(3.5),
      fontWeight: FontWeight.w600,
      fontFamily: 'Arima',
    );
  }

  static TextStyle authbuttonStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.offWhite,
      fontSize: context.sp(4.6),
      fontWeight: FontWeight.w500,
      fontFamily: 'Arima',
    );
  }

  static TextStyle loginbuttonStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.offWhite,
      fontSize: context.sp(4),
      fontWeight: FontWeight.w600,
      fontFamily: 'Arima',
    );
  }

  static TextStyle midDeepPrimaryColorStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.deepPrimaryColor,
      fontSize: context.sp(4.5),
      fontWeight: FontWeight.w600,
      fontFamily: 'Arima',
    );
  }






static TextStyle title(BuildContext context) =>TextStyle(
                                  color: AppColors.deepPrimaryColor,
                                  fontSize: context.sp(4),
                                  fontFamily: 'Tajawal',
                                  fontWeight: FontWeight.w800,
                                );


  static TextStyle appBarTitle(BuildContext context) => TextStyle(
        color: const Color(0xff600823),
        fontSize: context.sp(4.8),
        fontWeight: FontWeight.w800,
        fontFamily: "Tajawal",
      );

  /// ===========================
  /// User
  /// ===========================

  static TextStyle userName(BuildContext context) => TextStyle(
        color: AppColors.black,
        fontSize: context.sp(4.5),
        fontWeight: FontWeight.w600,
        fontFamily: "Tajawal",
      );

  static TextStyle userPoints(BuildContext context) => TextStyle(
        color: const Color.fromARGB(255, 237, 235, 229),
        fontSize: context.sp(3),
        fontWeight: FontWeight.w600,
        fontFamily: "Tajawal",
      );

  /// ===========================
  /// Section Titles
  /// ===========================

  static TextStyle sectionTitle(BuildContext context) => TextStyle(
        color: AppColors.deepPrimaryColor,
        fontSize: context.sp(4),
        fontWeight: FontWeight.w800,
        fontFamily: "Tajawal",
      );

  /// ===========================
  /// Card Titles
  /// ===========================

  static TextStyle cardTitle(BuildContext context) => TextStyle(
        color: AppColors.black,
        fontSize: context.sp(4),
        fontWeight: FontWeight.w800,
        fontFamily: "Tajawal",
      );

  static TextStyle cardSubtitle(BuildContext context) => TextStyle(
        color: AppColors.black,
        fontSize: context.sp(2.8),
        fontWeight: FontWeight.w600,
        fontFamily: "Tajawal",
      );

  /// ===========================
  /// Progress
  /// ===========================

  static TextStyle progressText(BuildContext context) => TextStyle(
        color: const Color(0xff76777D),
        fontSize: context.sp(2.9),
        fontWeight: FontWeight.w600,
        fontFamily: "Tajawal",
      );

  /// ===========================
  /// Buttons
  /// ===========================

  static TextStyle textButton(BuildContext context) => TextStyle(
        color: AppColors.deepPrimaryColor,
        fontSize: context.sp(3.5),
        fontWeight: FontWeight.w500,
        fontFamily: "Tajawal",
      );

      //==========================
// Revision Section
//==========================

static TextStyle revisionDescription(BuildContext context) {
  return TextStyle(
    fontSize: context.sp(3),
    color: Colors.black54,
    fontFamily: "Arima",
  );
}

static TextStyle revisionChapterCount(BuildContext context) {
  return TextStyle(
    fontSize: context.sp(2.8),
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
  );
}

static TextStyle revisionChapter(BuildContext context) {
  return TextStyle(
    fontSize: context.sp(2.8),
    color: AppColors.deepPrimaryColor,
  );
}

//==========================
// Revision Course Card
//==========================

static TextStyle revisionClassification(BuildContext context) {
  return TextStyle(
    fontFamily: "Arima",
    fontSize: context.sp(2.7),
    color: AppColors.deepPrimaryColor,
  );
}

static TextStyle revisionBookName(BuildContext context) {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: context.sp(4),
    color: AppColors.primaryColor,
  );
}

static TextStyle revisionChapterName(BuildContext context) {
  return TextStyle(
    color: Colors.black54,
    fontSize: context.sp(2.8),
  );
}

static TextStyle revisionButton(BuildContext context) {
  return TextStyle(
    color: AppColors.baieg,
    fontSize: context.sp(3.5),
    // fontWeight: FontWeight.w600,
  );
}


// Awards


static TextStyle awardsBalanceTitle(BuildContext context) {
  return TextStyle(
    color: AppColors.deepPrimaryColor,
    fontSize: context.sp(3.2),
    fontWeight: FontWeight.w600,
    fontFamily: 'Tajawal',
  );
}

static TextStyle awardsPoints(BuildContext context) {
  return TextStyle(
    color: Colors.white,
    fontSize: context.sp(7),
    fontWeight: FontWeight.w800,
    fontFamily: 'Tajawal',
  );
}

static TextStyle awardsPointsLabel(BuildContext context) {
  return TextStyle(
    color: Colors.white,
    fontSize: context.sp(7),
    fontWeight: FontWeight.w600,
    fontFamily: 'Tajawal',
  );
}

static TextStyle awardsLevel(BuildContext context) {
  return TextStyle(
    color: AppColors.deepPrimaryColor,
    fontSize: context.sp(2.8),
    fontWeight: FontWeight.w600,
    fontFamily: 'Tajawal',
  );
}

static TextStyle awardsButton(BuildContext context) {
  return TextStyle(
    color: AppColors.offWhite,
    fontSize: context.sp(2.8),
    fontWeight: FontWeight.w600,
    fontFamily: 'Tajawal',
  );
}

static TextStyle awardsDescription(BuildContext context) {
  return TextStyle(
    color: AppColors.deepPrimaryColor,
    fontSize: context.sp(2.7),
    height: 1.7,
    fontFamily: 'Tajawal',
  );
}

static TextStyle awardsSectionTitle(BuildContext context) {
  return TextStyle(
    color: AppColors.deepPrimaryColor,
    fontSize: context.sp(4),
    fontWeight: FontWeight.w800,
    fontFamily: 'Tajawal',
  );
}

static TextStyle awardsBookName(BuildContext context) {
  return TextStyle(
    color: AppColors.deepPrimaryColor,
    fontSize: context.sp(3.3),
    fontWeight: FontWeight.w700,
    fontFamily: 'Tajawal',
  );
}

static TextStyle awardsAuthor(BuildContext context) {
  return TextStyle(
    color: Colors.black54,
    fontSize: context.sp(3),
    fontFamily: 'Tajawal',
  );
}

static TextStyle awardsBookPoints(BuildContext context) {
  return TextStyle(
    color: AppColors.deepPrimaryColor,
    fontSize: context.sp(3.2),
    fontWeight: FontWeight.w700,
    fontFamily: 'Tajawal',
  );
}

static TextStyle awardsCartCounter(BuildContext context) {
  return TextStyle(
    color: Colors.white,
    fontSize: context.sp(2.5),
    fontWeight: FontWeight.bold,
    fontFamily: 'Tajawal',
  );
}

//==================================================
// Shopping Cart
//==================================================

static TextStyle cartSelectAll(BuildContext context) => TextStyle(
      color: AppColors.primaryColor,
      fontSize: context.sp(3.8),
      fontWeight: FontWeight.w700,
      fontFamily: 'Tajawal',
    );

static TextStyle cartEmpty(BuildContext context) => TextStyle(
      color: AppColors.primaryColor,
      fontSize: context.sp(4),
      fontWeight: FontWeight.w600,
      fontFamily: 'Tajawal',
    );

static TextStyle cartBookTitle(BuildContext context) => TextStyle(
      fontSize: context.sp(4),
      fontWeight: FontWeight.w600,
      color: const Color(0xFF2E2E2E),
      fontFamily: 'Tajawal',
    );

static TextStyle cartAuthor(BuildContext context) => TextStyle(
      color: Colors.black54,
      fontSize: context.sp(2.8),
      fontFamily: 'Tajawal',
    );

static TextStyle cartPoints(BuildContext context) => TextStyle(
      color: AppColors.primaryColor,
      fontSize: context.sp(3),
      fontWeight: FontWeight.w500,
      fontFamily: 'Tajawal',
    );

static TextStyle cartBottomSheetTitle(BuildContext context) => TextStyle(
      fontSize: context.sp(3.3),
      color: AppColors.deepPrimaryColor,
      fontWeight: FontWeight.w500,
      fontFamily: 'Tajawal',
    );

static TextStyle cartBottomSheetValue(BuildContext context) => TextStyle(
      color: AppColors.primaryColor,
      fontSize: context.sp(3.6),
      fontWeight: FontWeight.w800,
      fontFamily: 'Tajawal',
    );

static TextStyle cartConfirmButton(BuildContext context) => TextStyle(
      color: AppColors.offWhite,
      fontSize: context.sp(3.8),
      fontWeight: FontWeight.w500,
      fontFamily: 'Tajawal',
    );

static TextStyle cartBottomDescription(BuildContext context) => TextStyle(
      fontSize: context.sp(2.5),
      color: Colors.grey,
      fontFamily: 'Tajawal',
    );

static TextStyle cartAvailablePoints(BuildContext context) => TextStyle(
      color: Colors.white,
      fontSize: context.sp(3.5),
      fontWeight: FontWeight.w600,
      fontFamily: 'Tajawal',
    );

  static TextStyle bigDeepPrimaryColorStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.deepPrimaryColor,
      fontSize: context.sp(5.2),
      fontWeight: FontWeight.w800,
      height: 1.2,
      fontFamily: 'Arima',
    );
  }

   static TextStyle smallDeepPrimaryStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.deepPrimaryColor,
      fontSize: context.sp(3.4),
      fontWeight: FontWeight.w500,
      fontFamily: 'Arima',
    );
  }

  static TextStyle smallBlack54Style(BuildContext context) {
    return TextStyle(
      color: AppColors.lightBlack,
      fontSize: context.sp(3.9),
      fontWeight: FontWeight.w500,
      fontFamily: 'Arima',
    );
  }
  static TextStyle numberPrimaryStyle(BuildContext context) {
    return TextStyle(
      color: AppColors.primaryColor,
      fontSize: context.sp(3.4),
      fontWeight: FontWeight.w500,
      fontFamily: 'Arima',
    );
  }
}
