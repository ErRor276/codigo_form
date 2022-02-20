import 'package:codigo_form/common/enums/gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/interfaces/cubit_form_state_interface.dart';
import '../../common/models/user.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  AuthState _createError(e) => state.copyWith(
        status: FormStatus.error,
        errorMessage: e.toString(),
      );

  void updateData(Map<String, dynamic> data) => emit(state.copyWith(
        data: data,
        status: FormStatus.initial,
      ));

  Future<void> createAccount() async {
    try {
      emit(state.copyWith(status: FormStatus.loading));

      final _user = User(
        firstName: state.data['firstName'],
        lastName: state.data['lastName'],
        email: state.data['email'],
        dob: state.data['dob'],
        gender: state.data['gender'] ?? Gender.female,
        nationality: state.data['nationality'],
        cor: state.data['cor'],
        countryCode: state.data['countryCode'] ?? '',
        phNo: state.data['phNo'] ?? '',
      );
      // now can use _user to save in db or do api call

      emit(state.copyWith(status: FormStatus.success, user: _user));
    } catch (e) {
      emit(_createError(e));
    }
  }
}
