class AppExcaption implements Exception {
  final String errorMessage;

  AppExcaption({required this.errorMessage});

  @override
  String toString() => errorMessage;
}

class FetchDataExcaption extends AppExcaption {
  FetchDataExcaption() : super(errorMessage: "Check Your Internet Connection");
}

class BadRequestExcaption extends AppExcaption {
  BadRequestExcaption() : super(errorMessage: "Invalid Request Excaption");
}

class UnAuthorisedExcaption extends AppExcaption {
  UnAuthorisedExcaption() : super(errorMessage: "UnAuthorised Excaption");
}
