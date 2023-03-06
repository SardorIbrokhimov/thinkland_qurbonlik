enum PlatformStatus {
  MOBILE,
  WEB;

  String get typesToString {
   switch (this) {
    case PlatformStatus.MOBILE:
      return "Mobile";
    case PlatformStatus.WEB:
      return "Web";
  }
}
}