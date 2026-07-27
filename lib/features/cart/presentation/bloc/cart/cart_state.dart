import '../../../domain/entities/cart_item_entity.dart';
import '../../../domain/entities/request_book_redemption_entity.dart';

// class CartState {
//   final bool isLoading;
//   final List<CartItemEntity> books;
//   final List<int> selectedBookIds; // ✅ أهم تغيير
//   final int totalPoints;
//   final String? error;
//   final bool redeemSuccess;

//   const CartState({
//     required this.isLoading,
//     required this.books,
//     required this.selectedBookIds,
//     required this.totalPoints,
//     this.error,
//     required this.redeemSuccess,
//   });

//   factory CartState.initial() {
//     return const CartState(
//       isLoading: false,
//       books: [],
//       selectedBookIds: [],
//       totalPoints: 0,
//       redeemSuccess: false,
//     );
//   }

//   List<CartItemEntity> get selectedBooks =>
//       books.where((e) => selectedBookIds.contains(e.book.id)).toList();

//   int get totalRequiredPoints =>
//       selectedBooks.fold(0, (sum, item) => sum + item.book.price);

//   int get remainingPoints => totalPoints - totalRequiredPoints;

//   bool get hasSelection => selectedBookIds.isNotEmpty;

//   bool get isAllSelected =>
//       books.isNotEmpty &&
//       selectedBookIds.length == books.length;

//   CartState copyWith({
//     bool? isLoading,
//     List<CartItemEntity>? books,
//     List<int>? selectedBookIds,
//     int? totalPoints,
//     String? error,
//     bool? redeemSuccess,
//   }) {
//     return CartState(
//       isLoading: isLoading ?? this.isLoading,
//       books: books ?? this.books,
//       selectedBookIds: selectedBookIds ?? this.selectedBookIds,
//       totalPoints: totalPoints ?? this.totalPoints,
//       error: error,
//       redeemSuccess: redeemSuccess ?? false,
//     );
//   }
// }

class CartState {
  final bool isLoading;
  final List<CartItemEntity> books;
  final List<int> selectedBookIds;
  final int totalPoints;
  final String? error;
  final bool redeemSuccess;

  final BookRedemptionResponseEntity? redemptionResponse;

  const CartState({
    required this.isLoading,
    required this.books,
    required this.selectedBookIds,
    required this.totalPoints,
    this.error,
    required this.redeemSuccess,
    this.redemptionResponse,
  });

  factory CartState.initial() {
    return const CartState(
      isLoading: false,
      books: [],
      selectedBookIds: [],
      totalPoints: 0,
      error: null,
      redeemSuccess: false,
      redemptionResponse: null,
    );
  }

  List<CartItemEntity> get selectedBooks =>
      books.where((e) => selectedBookIds.contains(e.book.id)).toList();

  int get totalRequiredPoints =>
      selectedBooks.fold(0, (sum, item) => sum + item.book.price);

  int get remainingPoints => totalPoints - totalRequiredPoints;

  bool get hasSelection => selectedBookIds.isNotEmpty;

  bool get isAllSelected =>
      books.isNotEmpty && selectedBookIds.length == books.length;

 CartState copyWith({
  bool? isLoading,
  List<CartItemEntity>? books,
  List<int>? selectedBookIds,
  int? totalPoints,
  String? error,
  bool? redeemSuccess,
  BookRedemptionResponseEntity? redemptionResponse,
}) {
  return CartState(
    isLoading: isLoading ?? this.isLoading,
    books: books ?? this.books,
    selectedBookIds: selectedBookIds ?? this.selectedBookIds,
    totalPoints: totalPoints ?? this.totalPoints,
    error: error,
    redeemSuccess: redeemSuccess ?? this.redeemSuccess,
    redemptionResponse: redemptionResponse ?? this.redemptionResponse,
  );
}
}
