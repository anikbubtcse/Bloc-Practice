import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

import '../../models/university_model.dart';
import '../../services/university_service.dart';

part 'university_event.dart';

part 'university_state.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  final UniversityService universityService;

  UniversityBloc(this.universityService) : super(UniversityInitial()) {
    on<UniversityDetailsEvent>(_onUniversityDetails);
  }

  _onUniversityDetails(
      UniversityDetailsEvent event, Emitter<UniversityState> emit) async {
    emit(UniversityLoading());
    try {
      http.Response data = await universityService.universityService();
      if (data.statusCode == 200) {
        final universityModel = List<UniversityModel>.from(
            json.decode(data.body).map((x) => UniversityModel.fromJson(x)));
        emit(UniversityLoaded(universityModel));
      } else {
        emit(UniversityError("Something went wrong"));
      }
    } catch (e) {
      emit(UniversityError(e.toString()));
    }
  }
}
