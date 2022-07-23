class DataModel {
  DataModel({
    String? name,
    String? job,
    String? id,
    String? createdAt,
  }) {
    _name = name;
    _job = job;
    _id = id;
    _createdAt = createdAt;
  }

  DataModel.fromJson(dynamic json) {
    _name = json['name'];
    _job = json['job'];
    _id = json['id'];
    _createdAt = json['createdAt'];
  }
  String? _name;
  String? _job;
  String? _id;
  String? _createdAt;

  DataModel copyWith({
    String? name,
    String? job,
    String? id,
    String? createdAt,
  }) =>
      DataModel(
        name: name ?? _name,
        job: job ?? _job,
        id: id ?? _id,
        createdAt: createdAt ?? _createdAt,
      );
  String? get name => _name;
  String? get job => _job;
  String? get id => _id;
  String? get createdAt => _createdAt;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['job'] = _job;
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    return map;
  }
}
