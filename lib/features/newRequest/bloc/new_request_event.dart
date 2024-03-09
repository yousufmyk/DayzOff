part of 'new_request_bloc.dart';

@immutable
abstract class NewRequestEvent {}

class AddNewRequestToTheDbEvent extends NewRequestEvent {
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

class NavigateToNewRequestScreenEvent extends NewRequestEvent {}
