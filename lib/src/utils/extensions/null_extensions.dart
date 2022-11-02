
extension ValidNullString on String? {
  String get orEmptyString{
    return this ?? "";
  }

  String get orDefaultColor{
    return this ?? "#00BA8B";
  }
}

extension ValidNullInt on int? {
  int get orIntZero{
    return this ?? 0;
  }
}

extension ValidNullDouble on double? {
  double get orDoubleZero{
    return this ?? 0;
  }
}
extension ValidNullListDouble on List<double>? {
  List<double> get orDoubleList{
    return this ?? [0.0,0.0];
  }
}

extension ValidNullBoolean on bool? {
  bool get orFalse{
    return this ?? false;
  }
}
