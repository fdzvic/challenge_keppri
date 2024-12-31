import 'package:challenge_keppri/core/presentation/design/atoms/custom_text.dart';
import 'package:challenge_keppri/core/presentation/design/molecules/custom_app_bar.dart';
import 'package:challenge_keppri/core/presentation/design/molecules/custom_text_form_field.dart';
import 'package:challenge_keppri/core/presentation/design/atoms/primary_button.dart';
import 'package:challenge_keppri/core/presentation/utils/routes.dart';
import 'package:challenge_keppri/features/first_form/presentation/first_form_controller.dart';
import 'package:challenge_keppri/features/first_form/presentation/first_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstFormPage extends ConsumerStatefulWidget {
  const FirstFormPage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FirstFormState();
}

class _FirstFormState extends ConsumerState<FirstFormPage> {
  TextEditingController tecHasOperations = TextEditingController();
  TextEditingController tecHasDisease = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(firstFormController.notifier);
    var state = ref.watch(firstFormController);
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 50), child: CustomAppBar()),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Form(
                key: formkey,
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
                    CustomTextFormField(
                      controller: tecHasOperations,
                      label:
                          "¿Ha tenido operaciones? ¿Cuáles y hace cuánto tiempo?",
                      seeAsteric: true,
                      inputValueType: InputValueType.paragraph,
                      hintText: "Escribe aquí",
                      onChanged: (p0) => validateForm(controller, state),
                    ),
                    CustomTextFormField(
                      controller: tecHasDisease,
                      label:
                          "¿Ha tenido operaciones? ¿Cuáles y hace cuánto tiempo?",
                      seeAsteric: true,
                      hintText: "Escribe aquí",
                      inputValueType: InputValueType.paragraph,
                      onChanged: (p0) => validateForm(controller, state),
                    ),
                    const Spacer(),
                    PrimaryButton(
                      text: "Siguiente",
                      enabled: state.enabledButton ?? false,
                      onPressed: () {
                        controller.setFirstValidation(true);
                        if (formkey.currentState!.validate()) {
                          context.go(Routes.secondForm);
                        } else {
                          controller.setEnabledButton(false);
                        }
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void validateForm(FirstFormController controller, FirstFormState state) {
    bool hasDisease = tecHasDisease.text.isNotEmpty;
    bool hasOperations = tecHasOperations.text.isNotEmpty;

    if (state.firstValidation == true) {
      controller.setEnabledButton(
          hasDisease && hasOperations && formkey.currentState!.validate());
    } else {
      controller.setEnabledButton(hasDisease && hasOperations);
    }
  }
}
