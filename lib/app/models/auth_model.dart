class AuthModel {
  final String accessToken;
  final String refreshToken;

  AuthModel({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthModel.fromJson(dynamic json) => AuthModel(
        accessToken: json['access_token'] ?? '',
        refreshToken: json['refresh_token'] ?? '',
      );

  AuthModel copyWith({
    String? accessToken,
    String? refreshToken,
  }) =>
      AuthModel(
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['refresh_token'] = refreshToken;
    return map;
  }
}
