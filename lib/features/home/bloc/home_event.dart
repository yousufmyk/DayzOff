part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class NavigateToNewRequestScreenEvent extends HomeEvent {}

class AddNewRequestToTheDbEvent extends HomeEvent {
  final String id;
  final String fromDate;
  final String toDate;
  final String reason;
  final String appliedDate;
  final EmployeeData? employeeData;

  AddNewRequestToTheDbEvent({
    required this.id,
    required this.fromDate,
    required this.toDate,
    required this.reason,
    required this.appliedDate,
    required this.employeeData,
  });
}
