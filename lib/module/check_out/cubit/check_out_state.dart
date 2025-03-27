import 'package:flutter/widgets.dart';

@immutable
sealed class CheckOutStates {}

final class CheckOutInitialState extends CheckOutStates {}

final class CheckOutLoadingState extends CheckOutStates {}

final class CheckOutSuccessState extends CheckOutStates {}

final class CheckOutErrorState extends CheckOutStates {
  final String error;
  CheckOutErrorState({required this.error});
}
