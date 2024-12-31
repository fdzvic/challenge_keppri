import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstFormRepository {}

final firstFormRepositoryProvider = Provider<FirstFormRepository>(
  (ref) => FirstFormRepository(),
);
