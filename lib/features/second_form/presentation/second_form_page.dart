import 'package:challenge_keppri/core/presentation/design/atoms/custom_text.dart';
import 'package:challenge_keppri/core/presentation/design/molecules/custom_app_bar.dart';
import 'package:challenge_keppri/core/presentation/design/molecules/custom_toggle_buttons.dart';
import 'package:challenge_keppri/core/presentation/design/atoms/primary_button.dart';
import 'package:challenge_keppri/core/presentation/utils/custom_dialogs.dart';
import 'package:challenge_keppri/core/presentation/utils/routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondFormPage extends ConsumerStatefulWidget {
  const SecondFormPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SecondFormState();
}

class _SecondFormState extends ConsumerState<SecondFormPage> {
  List<bool> isSelectedFirst = [false, true];
  List<bool> isSelectedSecond = [false, true];
  @override
  Widget build(BuildContext context) {
    // var controller = ref.watch(firstFormController.notifier);
    // var state = ref.watch(firstFormController);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: CustomAppBar(
            onPressed: () => context.go(Routes.firstForm),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    "Completa la siguiente información",
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                  const SizedBox(height: 12),
                  const CustomText(
                    "Todos los campos son obligatorios",
                    seeAsteric: true,
                    fontSize: 16,
                  ),
                  const SizedBox(height: 16),
                  CustomToggleButtons(
                    label:
                        "¿Tiene dolores frecuentes y no ha consultado al médico?",
                    isSelected: isSelectedFirst,
                    onPressed: (int index) =>
                        selectedOption(index, isSelectedFirst),
                  ),
                  const SizedBox(height: 16),
                  CustomToggleButtons(
                    label:
                        "¿Le ha dicho al médico que tiene algún problema en los huesos o en las articulaciones, que pueda desfavorecer con el ejercicio?",
                    isSelected: isSelectedSecond,
                    onPressed: (int index) =>
                        selectedOption(index, isSelectedSecond),
                  ),
                  const Spacer(),
                  PrimaryButton(
                    text: "Siguiente",
                    enabled: true,
                    onPressed: () {
                      context.showMessageDialog(
                          title: "Registro exitoso",
                          subtitle: "Se registró la información con éxito.");
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void selectedOption(int index, List<bool> options) {
    setState(() {
      for (int i = 0; i < options.length; i++) {
        options[i] = i == index;
      }
    });
  }
}
