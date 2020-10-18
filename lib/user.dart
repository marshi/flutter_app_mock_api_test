class User {
  String id;
  String createdAt;
  String name;
  String avatar;

  User({this.id, this.createdAt, this.name, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    name = json['name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    return data;
  }

  @override
  String toString() {
    return 'User{id: $id, createdAt: $createdAt, name: $name, avatar: $avatar}';
  }
}
