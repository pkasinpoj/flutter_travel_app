import 'package:thamturakit_mobile/models/room_model.dart';

class TypeRoomsModel {
  List<String> typeRoomImages;
  String typeName;
  List<String> listInfoRooms;
  List<Rooms> rooms;
  int price;

  TypeRoomsModel({
    required this.typeRoomImages,
    required this.typeName,
    required this.listInfoRooms,
    required this.rooms,
    required this.price,
  });
}
