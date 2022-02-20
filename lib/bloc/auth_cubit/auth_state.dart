part of 'auth_cubit.dart';

@immutable
class AuthState extends CubitFormState {
  final User? user;
  const AuthState({
    Map<String, dynamic> data = const {},
    FormStatus status = FormStatus.initial,
    String errorMessage = '',
    this.user,
  }) : super(
          data: data,
          status: status,
          errorMessage: errorMessage,
        );

  AuthState copyWith({
    FormStatus? status,
    Map<String, dynamic> data = const {},
    String? errorMessage,
    User? user,
  }) {
    return AuthState(
      data: {...this.data, ...data},
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }

  @override
  String toString() {
    return "Status: $status \nData: $data \nErrorMessage: $errorMessage--";
  }

  @override
  List<Object?> get props => [data, status, user, errorMessage];
}
