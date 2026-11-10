import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/antiviruses_data.dart';
import '../../models/antivirus.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<LoadAntivirusesEvent>(_onLoadAntiviruses);
  }

  Future<void> _onLoadAntiviruses(
    LoadAntivirusesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoading());

    try {
      await Future.delayed(const Duration(milliseconds: 500));
      emit(HomeLoaded(antiviruses));
    } catch (e) {
      emit(const HomeError('Не удалось загрузить список антивирусов'));
    }
  }
}
