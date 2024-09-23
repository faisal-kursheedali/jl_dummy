class ProfileException implements Exception {
  final String errorMessageCode;

  ProfileException({required this.errorMessageCode});
  @override
  String toString() => errorMessageCode;
}
