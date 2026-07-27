class UserPointsState {
  final bool isLoading;
  final int points;
  final String? error;

  const UserPointsState({
    required this.isLoading,
    required this.points,
    this.error,
  });

  factory UserPointsState.initial() {
    return const UserPointsState(
      isLoading: false,
      points: 0,
    );
  }

  UserPointsState copyWith({
    bool? isLoading,
    int? points,
    String? error,
  }) {
    return UserPointsState(
      isLoading: isLoading ?? this.isLoading,
      points: points ?? this.points,
      error: error,
    );
  }
}