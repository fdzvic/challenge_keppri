import 'package:flutter_riverpod/flutter_riverpod.dart';

class SecondFormRepository {}

final secondFormRepositoryProvider = Provider<SecondFormRepository>(
  (ref) => SecondFormRepository(),
);
