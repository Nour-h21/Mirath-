import '../../domain/entities/request_book_redemption_entity.dart';

class BookRedemptionModel extends BookRedemptionEntity {
  const BookRedemptionModel({
    required super.libraryLocation,
    required super.workingHours,
  });

  factory BookRedemptionModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return BookRedemptionModel(
      libraryLocation: json['library_location'] ?? '',
      workingHours: json['working_hours'] ?? '',
    );
  }
}

class BookRedemptionResponseModel
    extends BookRedemptionResponseEntity {
  const BookRedemptionResponseModel({
    required super.status,
    required super.data,
    required super.message,
  });

  factory BookRedemptionResponseModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return BookRedemptionResponseModel(
      status: json['status'] ?? 0,
      data: BookRedemptionModel.fromJson(
        json['data'] ?? {},
      ),
      message: json['message'] ?? '',
    );
  }
}