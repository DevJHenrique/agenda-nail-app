class TokenEntity {
  final String? id;
  final String token;
  final String? refreshToken;

  TokenEntity(this.token, {this.id, this.refreshToken});
}
