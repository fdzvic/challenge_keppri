import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'second_form_controller.dart';


class SecondFormPage extends ConsumerWidget {
  const SecondFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(secondFormController.notifier);
    var state = ref.watch(secondFormController);
    return Container();
  }
}