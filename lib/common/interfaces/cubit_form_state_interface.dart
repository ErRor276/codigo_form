import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

enum FormStatus { initial, success, loading, error }

@immutable
abstract class CubitFormState extends Equatable {
  final Map<String, dynamic> data;
  final FormStatus status;
  final String errorMessage;

  const CubitFormState({
    required this.status,
    required this.data,
    required this.errorMessage,
  });
}
