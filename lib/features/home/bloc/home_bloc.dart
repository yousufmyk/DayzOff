import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dayzoff/features/dataModels/employeeModel.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<NavigateToNewRequestScreenEvent>(navigateToNewRequestScreenEvent);
    on<AddNewRequestToTheDbEvent>(addNewRequestToTheDbEvent);
  }

  FutureOr<void> navigateToNewRequestScreenEvent(
      NavigateToNewRequestScreenEvent event, Emitter<HomeState> emit) {
    emit(NavigateToNewRequestScreenState());
  }

  FutureOr<void> addNewRequestToTheDbEvent(
      AddNewRequestToTheDbEvent event, Emitter<HomeState> emit) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("Leave Request/${event.employeeData!.fullName}/");
    try {
      await ref.child(event.id).set({
        "appliedDate": event.appliedDate,
        "fromDate": event.fromDate,
        "toDate": event.toDate,
        "reason": event.reason,
      }).then((value) => {print("data set sucessfully")});
    } catch (e) {
      print(e.toString());
    }
  }
}
