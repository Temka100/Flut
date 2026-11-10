part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {
  const HomeEvent();
}

final class LoadAntivirusesEvent extends HomeEvent {
  const LoadAntivirusesEvent();
}
