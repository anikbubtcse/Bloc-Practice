part of 'university_bloc.dart';

abstract class UniversityState extends Equatable {
  const UniversityState();
}

class UniversityInitial extends UniversityState {
  @override
  List<Object> get props => [];
}

class UniversityLoading extends UniversityState {
  @override
  List<Object> get props => [];
}

class UniversityLoaded extends UniversityState {
  List<UniversityModel> universityModel;

  UniversityLoaded(this.universityModel);

  @override
  List<Object> get props => [universityModel];
}

class UniversityError extends UniversityState {
  String message;

  UniversityError(this.message);

  @override
  List<Object> get props => [message];
}
