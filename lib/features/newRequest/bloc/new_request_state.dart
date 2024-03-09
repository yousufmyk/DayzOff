part of 'new_request_bloc.dart';

@immutable
abstract class NewRequestState {}

class NewRequestActionState extends NewRequestState {}

final class NewRequestInitial extends NewRequestState {}

class NewLeaveRequestSubmitSucessState extends NewRequestActionState {}

class NewRequestErrorState extends NewRequestState {
  final String? error;

  NewRequestErrorState({this.error});
}

class NewLeaveRequestLoadingState extends NewRequestState {}
