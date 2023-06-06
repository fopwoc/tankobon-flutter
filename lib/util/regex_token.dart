final tokenRegex = RegExp(r"^Bearer (.*)$");

String regexToken(String tokenHeader) {
  final match = tokenRegex.firstMatch(tokenHeader);

  return match!.group(1)!;
}
