import 'package:uuid/uuid.dart';

class PublicationModel {
  // String name;
  String id;
  String description;
  // String url;
  String publicTime;

  bool isCompleted;

  PublicationModel(this.id, this.description, this.publicTime, this.isCompleted)
  // : this.id = Uuid().v1(),
  // this.isCompleted = false
  ;
}
