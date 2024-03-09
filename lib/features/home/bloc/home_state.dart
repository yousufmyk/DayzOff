part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeErrorState extends HomeState {
  final String? error;

  HomeErrorState({this.error});
}

class NavigateToNewRequestScreenState extends HomeActionState {}
