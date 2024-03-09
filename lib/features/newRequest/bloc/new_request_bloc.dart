import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dayzoff/features/dataModels/employeeModel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';

part 'new_request_event.dart';
part 'new_request_state.dart';

class NewRequestBloc extends Bloc<NewRequestEvent, NewRequestState> {
  NewRequestBloc() : super(NewRequestInitial()) {
    on<AddNewRequestToTheDbEvent>(addNewRequestToTheDbEvent);
  }

  FutureOr<void> addNewRequestToTheDbEvent(
      AddNewRequestToTheDbEvent event, Emitter<NewRequestState> emit) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("Leave Request/${event.employeeData!.fullName}/");
    try {
      emit(NewLeaveRequestLoadingState());

      await ref.child(event.id).set({
        "appliedDate": event.appliedDate,
        "fromDate": event.fromDate,
        "toDate": event.toDate,
        "reason": event.reason,
      }).then((value) => {emit(NewLeaveRequestSubmitSucessState())});

      // .then((value) => {print("data set sucessfully")});
    } catch (e) {
      emit(NewRequestErrorState(error: e.toString()));
      print(e.toString());
    }
  }
}
