import 'package:challenge_keppri/core/presentation/design/atoms/custom_text.dart';
import 'package:challenge_keppri/core/presentation/design/atoms/primary_button.dart';
import 'package:challenge_keppri/core/presentation/design/tokens/colors.dart';
import 'package:challenge_keppri/core/presentation/utils/extension/dimens_extension.dart';
import 'package:challenge_keppri/core/presentation/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///
/// Esta clase contiene todos los mensajes de dialogo que se mostrarán dentro de la aplicación
///

extension CustomDialogs on BuildContext {
  void showMessageDialog({String? title, String? subtitle, bool? dimisible}) =>
      showDialog(
        context: this,
        barrierDismissible: dimisible ?? true,
        builder: (context) {
          return Center(
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                  width: context.width(.9),
                  padding: EdgeInsets.symmetric(
                      vertical: context.height(.04),
                      horizontal: context.width(.05)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: colors.borderButtonColor),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        title,
                        fontSize: 24,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Icon(
                        Icons.check_circle_outline,
                        color: Colors.greenAccent,
                        size: 50,
                      ),
                      const SizedBox(height: 12),
                      CustomText(
                        subtitle,
                        fontSize: 18,
                        textColor: colors.textColor,
                        textAlign: TextAlign.center,
                        height: 1.5,
                      ),
                      const SizedBox(height: 48),
                      PrimaryButton(
                          text: "Continuar",
                          onPressed: () {
                            Navigator.pop(context);
                            context.go(Routes.firstForm);
                          })
                    ],
                  )),
            ),
          );
        },
      );
}
