class SingerModel {
  String? id;
  String? username;
  String? name;
  String? email;
  String? city;
  String? avatar;

  SingerModel({
    this.id,
    this.username,
    this.name,
    this.email,
    this.city,
    this.avatar,
  });

  factory SingerModel.fromJson(Map<String, dynamic> json) => SingerModel(
        id: json['id'] as String?,
        username: json['username'] as String?,
        name: json['first_name'] + ' ' + json['last_name'] as String?,
        email: json['email'] as String?,
        city: json['city'] as String?,
        avatar: json['avatar'] as String?,
      );
}
