class BookRedemptionEntity {
  final String libraryLocation;
  final String workingHours;

  const BookRedemptionEntity({
    required this.libraryLocation,
    required this.workingHours,
  });
}
class BookRedemptionResponseEntity {
  final int status;
  final BookRedemptionEntity data;
  final String message;

  const BookRedemptionResponseEntity({
    required this.status,
    required this.data,
    required this.message,
  });
}