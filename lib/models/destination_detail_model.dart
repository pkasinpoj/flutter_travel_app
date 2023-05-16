import 'package:thamturakit_mobile/models/room_model.dart';
import 'package:thamturakit_mobile/models/type_rooms_model.dart';

class DestinationDetailModel {
  List<String> headerImages;
  String name;
  String typeHotel;
  double rating;
  String address;
  List<TypeRoomsModel> typeRooms;
  String email;
  String tel;
  String contactAddress;
  List<String> facilities;
  List<String> activities;

  DestinationDetailModel({
    required this.headerImages,
    required this.name,
    required this.typeHotel,
    required this.rating,
    required this.address,
    required this.typeRooms,
    required this.email,
    required this.tel,
    required this.contactAddress,
    required this.facilities,
    required this.activities,
  });
}

DestinationDetailModel resDetailHotel = DestinationDetailModel(
    headerImages: [
      'assets/images/paris.jpg',
      'assets/images/newyork.jpg',
      'assets/images/venice.jpg',
    ],
    name: 'โรงแรมแชงกรี-ลา กรุงเทพฯ',
    typeHotel: "โรงเเรม",
    rating: 4.5,
    address: "กรุงเทพ , ไทย",
    typeRooms: resTypeRooms,
    email: "tester@gmail.com",
    tel: "66 0979455462",
    contactAddress: "ดอนเมือง ดอนเมือง กรุงเทพมหานคร 10210",
    facilities: ["รูมเซอร์วิส", "ไมโครเวฟ", "ห้องพักส่วนกลาง"],
    activities: ["สระว่ายน้ำ", "จักรยาน", "สนามวิ่ง"]);

List<TypeRoomsModel> resTypeRooms = [
  TypeRoomsModel(
      typeRoomImages: [
        'assets/images/hotel0.jpg',
        'assets/images/hotel1.jpg',
        'assets/images/hotel_demo_4.jpg',
      ],
      typeName: 'Single',
      listInfoRooms: ["รวมอาหารเช้า", "เตียงเดี่ยว"],
      rooms: [
        Rooms(roomId: 1, roomType: "Single", roomPrice: 3000),
        Rooms(roomId: 2, roomType: "Single", roomPrice: 3000),
        Rooms(roomId: 3, roomType: "Single", roomPrice: 3000),
        Rooms(roomId: 4, roomType: "Single", roomPrice: 3000),
        Rooms(roomId: 5, roomType: "Single", roomPrice: 3000),
        Rooms(roomId: 6, roomType: "Single", roomPrice: 3000),
      ],
      price: 3000),
  TypeRoomsModel(
      typeRoomImages: [
        'assets/images/saopaulo.jpg',
        'assets/images/newdelhi.jpg',
        'assets/images/murano.jpg',
      ],
      typeName: 'Double',
      listInfoRooms: ["รวมอาหารเช้า", "เตี่ยงคู่"],
      rooms: [
        Rooms(roomId: 7, roomType: "Double", roomPrice: 4000),
        Rooms(roomId: 8, roomType: "Double", roomPrice: 4000),
        Rooms(roomId: 9, roomType: "Double", roomPrice: 4000),
        Rooms(roomId: 10, roomType: "Double", roomPrice: 4000),
        Rooms(roomId: 11, roomType: "Double", roomPrice: 4000),
        Rooms(roomId: 12, roomType: "Double", roomPrice: 4000),
      ],
      price: 4000)
];
