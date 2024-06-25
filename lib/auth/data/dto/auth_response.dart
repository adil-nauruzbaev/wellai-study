class AuthResponseDto {
  AuthResponseDto({
    this.accessToken,
    this.refreshToken,
    this.expiredAt,
  });

  factory AuthResponseDto.fromJson(dynamic json) {
    return AuthResponseDto(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
      expiredAt: DateTime.tryParse(json['expiredAt']),
    );
  }

  final String? accessToken;
  final String? refreshToken;
  final DateTime? expiredAt;
}
