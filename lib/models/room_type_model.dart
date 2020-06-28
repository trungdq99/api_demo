class RoomTypeModel {
  String id;
  String code;
  String name;
  String description;

  RoomTypeModel(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    description = json['description'];
  }
}
