import 'package:challenge_keppri/features/first_form/first_form_page.dart';
import 'package:challenge_keppri/features/second_form/second_form_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String firstForm = '/first-form';
  static const String secondForm = '/second-form';
}

final router = GoRouter(initialLocation: Routes.firstForm, routes: [
  GoRoute(
      path: Routes.firstForm,
      pageBuilder: (context, state) =>
          page(state: state, child: const FirstFormPage())),
  GoRoute(
      path: Routes.secondForm,
      pageBuilder: (context, state) =>
          page(state: state, child: const SecondFormPage())),
]);

NoTransitionPage<void> page(
        {required GoRouterState state, required Widget child}) =>
    NoTransitionPage<void>(key: state.pageKey, child: child);
