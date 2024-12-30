import 'package:challenge_keppri/core/presentation/design/atoms/custom_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'first_form_controller.dart';

class FirstFormPage extends ConsumerWidget {
  const FirstFormPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controller = ref.watch(firstFormController.notifier);
    var state = ref.watch(firstFormController);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomText("Hola mundo"),
          )
        ],
      ),
    );
  }
}
