import '../../domain/entities/home_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final HomeEntity home;

  HomeSuccess(this.home);
}

class HomeFailure extends HomeState {
  final String message;

  HomeFailure(this.message);
}