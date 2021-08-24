// Redefine switch statement
// https://stackoverflow.com/a/57390589/1058292.
TValue case2<TOptionType, TValue> (
    TOptionType selectedOption,
    Map<TOptionType, TValue> branches,
    TValue defaultValue) {
  if (!branches.containsKey(selectedOption)) {
    return defaultValue;
  }

  return branches[selectedOption]!;
}