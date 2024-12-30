import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'first_form_state.dart';

class FirstFormController extends StateNotifier<FirstFormState> {
 
  FirstFormController(): super(FirstFormState());
}

final firstFormController =
    StateNotifierProvider<FirstFormController, FirstFormState>(
        (ref) {
  return FirstFormController();
});