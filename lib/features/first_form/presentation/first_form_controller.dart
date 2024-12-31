import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'first_form_state.dart';

class FirstFormController extends StateNotifier<FirstFormState> {
  FirstFormController() : super(FirstFormState());

  setEnabledButton(bool value) {
    state = state.copyWith(enabledButton: value);
  }

  setFirstValidation(bool value) {
    state = state.copyWith(firstValidation: value);
  }
}

final firstFormController =
    StateNotifierProvider.autoDispose<FirstFormController, FirstFormState>(
        (ref) {
  return FirstFormController();
});
