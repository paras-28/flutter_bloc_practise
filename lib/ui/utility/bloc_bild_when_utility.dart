
import 'package:flutter/material.dart';

bool buildWhenBlocUtil({required List<Type> possibleStates, required  Object currentState}) {
  // debugPrint(tag: "buildWhenBlocUtil", value: currentState);
  return possibleStates.any((stateType) => currentState.runtimeType == stateType);
}