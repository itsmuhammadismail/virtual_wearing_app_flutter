import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:virtual_wearing_app_flutter/features/user/data/models/user.dart';
import 'package:virtual_wearing_app_flutter/features/user/data/repositories/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;

  UserCubit({
    required this.userRepository,
  }) : super(UserState.initial());

  Future<void> login(String email, String password) async {
    emit(state.copyWith(status: UserStatus.loading));

    try {
      // User user = await userRepository.login(email, password);
      if (email == 'ismail@gmail.com' && password == '1234') {
        emit(state.copyWith(
          status: UserStatus.loaded,
          user: const User(
            name: 'Muhammad Ismail',
            token:
                'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpdHNtdWhhbW1hZGlzbWFpbEBnbWFpbC5jb20iLCJpYXQiOjE2NjIzNDMxNDMsImV4cCI6MTY2MzU1Mjc0M30.NIXqm67hABcavI0mjlr8etOX-5edPHyCQJst2odrWOs',
            email: 'ismail@gmail.com',
          ),
        ));
      } else {
        throw Error();
      }
      // print("hello ${user.name}");
    } catch (err) {
      print("error");
      emit(state.copyWith(
        status: UserStatus.error,
      ));
    }
  }

  void logout() {
    emit(state.copyWith(
      status: UserStatus.initial,
      user: const User(
        name: '',
        token: '',
        email: '',
      ),
    ));
  }

  Future<void> register(String name, String email, String password) async {
    emit(state.copyWith(status: UserStatus.loading));

    try {
      // User user = await userRepository.register(name, email, password);
      emit(state.copyWith(
        status: UserStatus.loaded,
        user: const User(
          name: 'Muhammad Ismail',
          token:
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpdHNtdWhhbW1hZGlzbWFpbEBnbWFpbC5jb20iLCJpYXQiOjE2NjIzNDMxNDMsImV4cCI6MTY2MzU1Mjc0M30.NIXqm67hABcavI0mjlr8etOX-5edPHyCQJst2odrWOs',
          email: 'ismail@gmail.com',
        ),
      ));
    } catch (err) {
      emit(state.copyWith(
        status: UserStatus.error,
      ));
    }
  }
}
