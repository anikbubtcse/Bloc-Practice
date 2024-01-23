part of 'university_bloc.dart';

abstract class UniversityEvent extends Equatable {
  const UniversityEvent();
}

class UniversityDetailsEvent extends UniversityEvent {
  const UniversityDetailsEvent();

  @override
  List<Object?> get props => [];
}
