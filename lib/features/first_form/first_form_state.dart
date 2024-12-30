class FirstFormState {
  final bool? enabledButton;
  final bool? firstValidation;

  FirstFormState({
    this.enabledButton = false,
    this.firstValidation = false,
  });

  FirstFormState copyWith({
    bool? enabledButton,
    bool? firstValidation,
  }) {
    return FirstFormState(
      enabledButton: enabledButton ?? this.enabledButton,
      firstValidation: firstValidation ?? this.firstValidation,
    );
  }
}
