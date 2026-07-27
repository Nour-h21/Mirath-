
import '../../../domain/entities/nationality_entity.dart';

abstract class NationalityState {}

class NationalityInitial extends NationalityState {}

class NationalityLoading extends NationalityState {}

class NationalitySuccess extends NationalityState {
  final List<NationalityEntity> nationalities;

  NationalitySuccess(this.nationalities);
}

class NationalityFailed extends NationalityState {
  final String message;

  NationalityFailed(this.message);
}