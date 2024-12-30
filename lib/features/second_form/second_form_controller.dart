import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'second_form_state.dart';

class SecondFormController extends StateNotifier<SecondFormState> {
 
  SecondFormController(): super(SecondFormState());
}

final secondFormController =
    StateNotifierProvider<SecondFormController, SecondFormState>(
        (ref) {
  return SecondFormController();
});