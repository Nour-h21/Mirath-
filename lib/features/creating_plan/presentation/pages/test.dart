import 'package:flutter/material.dart';

import '../../../../core/design/tokens/colors.dart';
import '../../../../core/utils/extensions/context_extensions.dart';

class CreatePlanPage extends StatefulWidget {
  const CreatePlanPage({super.key});

  @override
  State<CreatePlanPage> createState() => _CreatePlanPageState();
}

class _CreatePlanPageState extends State<CreatePlanPage> {
  bool isDailyPlan = true;

  List<String> selectedCategories = [];

  List<int> selectedBooks = [];

  bool dailyStudy = true;

  List<String> selectedDays = [];

  bool notificationsEnabled = true;

  TimeOfDay? selectedTime;

  final TextEditingController dailyWirdController =
      TextEditingController();

  final TextEditingController durationController =
      TextEditingController();

  final List<String> categories = [
    "عقيدة",
    "فقه",
    "حديث",
    "سيرة",
    "تفسير",
    "أصول",
  ];

  final List<BookModel> books = [
    BookModel(
      id: 1,
      title: "العقيدة الواسطية",
      category: "عقيدة",
      chapters: 12,
      image:
          "https://images.unsplash.com/photo-1544717305-2782549b5136",
    ),
    BookModel(
      id: 2,
      title: "الأصول الثلاثة",
      category: "عقيدة",
      chapters: 8,
      image:
          "https://images.unsplash.com/photo-1512820790803-83ca734da794",
    ),
    BookModel(
      id: 3,
      title: "رياض الصالحين",
      category: "حديث",
      chapters: 25,
      image:
          "https://images.unsplash.com/photo-1521587760476-6c12a4b040da",
    ),
  ];

  List<BookModel> get filteredBooks {
    if (selectedCategories.isEmpty) {
      return books;
    }

    return books
        .where(
          (book) => selectedCategories.contains(
            book.category,
          ),
        )
        .toList();
  }

  int get totalChapters {
    return books
        .where(
          (book) => selectedBooks.contains(book.id),
        )
        .fold(
          0,
          (sum, book) => sum + book.chapters,
        );
  }

  int get calculatedDays {
    if (dailyWirdController.text.isEmpty) return 0;

    final daily =
        int.tryParse(dailyWirdController.text) ?? 0;

    if (daily == 0) return 0;

    return (totalChapters / daily).ceil();
  }

  int get calculatedDailyWird {
    if (durationController.text.isEmpty) return 0;

    final days =
        int.tryParse(durationController.text) ?? 0;

    if (days == 0) return 0;

    return (totalChapters / days).ceil();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.offWhite,
        title: Text(
          "إضافة خطة",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: context.sp(4),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          context.w(4),
        ),
        child: Container(
          padding: EdgeInsets.all(
            context.w(4),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              context.w(5),
            ),
            border: Border.all(
              color: AppColors.offPink,
            ),
          ),
          child: Column(
            children: [

              /// نوع الخطة
              _sectionTitle("نوع الخطة"),

              SizedBox(height: context.h(1.5)),

              Row(
                children: [
                  Expanded(
                    child: _planTypeButton(
                      title: "ورد يومي",
                      selected: isDailyPlan,
                      onTap: () {
                        setState(() {
                          isDailyPlan = true;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: context.w(3)),
                  Expanded(
                    child: _planTypeButton(
                      title: "مدة معينة",
                      selected: !isDailyPlan,
                      onTap: () {
                        setState(() {
                          isDailyPlan = false;
                        });
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: context.h(3)),

              /// التصنيفات

              _sectionTitle("التصنيفات"),

              SizedBox(height: context.h(1.5)),

              Wrap(
                spacing: context.w(2),
                runSpacing: context.h(1),
                children: categories.map((category) {
                  final selected =
                      selectedCategories.contains(
                    category,
                  );

                  return FilterChip(
                    label: Text(category),
                    selected: selected,
                    selectedColor:
                        AppColors.primaryColor,
                    checkmarkColor: Colors.white,
                    labelStyle: TextStyle(
                      color: selected
                          ? Colors.white
                          : AppColors.black,
                    ),
                    onSelected: (_) {
                      setState(() {
                        selected
                            ? selectedCategories
                                .remove(category)
                            : selectedCategories
                                .add(category);
                      });
                    },
                  );
                }).toList(),
              ),

              SizedBox(height: context.h(3)),

              /// الكتب

              _sectionTitle("الكتب"),

              SizedBox(height: context.h(1.5)),

              ...filteredBooks.map(
                (book) => _bookCard(book),
              ),

              SizedBox(height: context.h(3)),

              /// الورد أو المدة

              _sectionTitle(
                isDailyPlan
                    ? "الورد اليومي"
                    : "المدة المطلوبة",
              ),

              SizedBox(height: context.h(1.5)),

              TextField(
                controller: isDailyPlan
                    ? dailyWirdController
                    : durationController,
                keyboardType:
                    TextInputType.number,
                onChanged: (_) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: isDailyPlan
                      ? "عدد الأبواب يومياً"
                      : "عدد الأيام",
                  filled: true,
                  fillColor: AppColors.offWhite,
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(
                      context.w(3),
                    ),
                  ),
                ),
              ),

              SizedBox(height: context.h(1.5)),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(
                  context.w(3),
                ),
                decoration: BoxDecoration(
                  color: AppColors.baieg,
                  borderRadius:
                      BorderRadius.circular(
                    context.w(3),
                  ),
                ),
                child: Text(
                  isDailyPlan
                      ? "ستنتهي خلال $calculatedDays يوم"
                      : "تحتاج إلى $calculatedDailyWird باب يومياً",
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: context.h(3)),

              /// أيام الدراسة

              _sectionTitle("أيام الدراسة"),

              SwitchListTile(
                value: dailyStudy,
                activeColor:
                    AppColors.primaryColor,
                title: const Text("يومياً"),
                onChanged: (value) {
                  setState(() {
                    dailyStudy = value;
                  });
                },
              ),

              SizedBox(height: context.h(2)),

              /// التنبيه

              _sectionTitle("وقت التنبيه"),

              SwitchListTile(
                value: notificationsEnabled,
                activeColor:
                    AppColors.primaryColor,
                onChanged: (value) {
                  setState(() {
                    notificationsEnabled =
                        value;
                  });
                },
              ),

              if (notificationsEnabled)
                ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(
                      context.w(3),
                    ),
                    side: BorderSide(
                      color: AppColors.offPink,
                    ),
                  ),
                  title: Text(
                    selectedTime == null
                        ? "اختر الوقت"
                        : selectedTime!
                            .format(context),
                  ),
                  trailing: const Icon(
                    Icons.access_time,
                  ),
                  onTap: () async {
                    final time =
                        await showTimePicker(
                      context: context,
                      initialTime:
                          TimeOfDay.now(),
                    );

                    if (time != null) {
                      setState(() {
                        selectedTime = time;
                      });
                    }
                  },
                ),

              SizedBox(height: context.h(4)),

              SizedBox(
                width: double.infinity,
                height: context.h(6),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        AppColors.primaryColor,
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                        context.w(3),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "حفظ الخطة",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: context.sp(3.8),
        ),
      ),
    );
  }

  Widget _planTypeButton({
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.h(5.5),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.primaryColor
              : AppColors.offWhite,
          borderRadius:
              BorderRadius.circular(
            context.w(6),
          ),
          border: Border.all(
            color: AppColors.offPink,
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: selected
                  ? Colors.white
                  : AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _bookCard(BookModel book) {
    final selected =
        selectedBooks.contains(book.id);

    return Container(
      margin: EdgeInsets.only(
        bottom: context.h(1),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(
          context.w(4),
        ),
        border: Border.all(
          color: AppColors.offPink,
        ),
      ),
      child: CheckboxListTile(
        value: selected,
        activeColor:
            AppColors.primaryColor,
        onChanged: (_) {
          setState(() {
            selected
                ? selectedBooks.remove(book.id)
                : selectedBooks.add(book.id);
          });
        },
        title: Text(book.title),
        subtitle: Text(book.category),
        secondary: ClipRRect(
          borderRadius:
              BorderRadius.circular(
            context.w(2),
          ),
          child: Image.network(
            book.image,
            width: context.w(12),
            height: context.w(12),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class BookModel {
  final int id;
  final String title;
  final String category;
  final int chapters;
  final String image;

  BookModel({
    required this.id,
    required this.title,
    required this.category,
    required this.chapters,
    required this.image,
  });
}