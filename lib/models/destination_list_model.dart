class DestinationListModel {
  String name;
  String address;
  double rating;
  int price;
  List<String> images;
  List<String> chip;

  DestinationListModel({
    required this.name,
    required this.address,
    required this.rating,
    required this.price,
    required this.images,
    required this.chip,
  });
}

List<DestinationListModel> destinationList = [
  DestinationListModel(
      name: "โรงแรมแชงกรี-ลา กรุงเทพฯ",
      address: "กรุงเทพ , ไทย",
      rating: 4.5,
      price: 2999,
      images: [
        'assets/images/paris.jpg',
        'assets/images/newyork.jpg',
        'assets/images/venice.jpg',
      ],
      chip: [
        'รวมอาหารเช้า',
        'ฟรีไวไฟ',
        '2 ห้องนอน',
        'สระว่ายน้ำ',
        'ฟิตเนส'
      ]),
  DestinationListModel(
      name: "โรงแรมแมนดาริน โอเรียนเต็ล กรุงเทพ",
      address: "กรุงเทพ , ไทย",
      rating: 3,
      price: 1549,
      images: [
        'assets/images/saopaulo.jpg',
        'assets/images/newdelhi.jpg',
        'assets/images/murano.jpg',
      ],
      chip: [
        'รวมอาหารเช้า',
        'ฟรีไวไฟ',
        'สระว่ายน้ำ',
        'ฟิตเนส'
      ]),
  DestinationListModel(
      name: "แมริออท เอ็กเซกคิวทีฟ อพาร์ทเมนท์ สุขุมวิท พาร์ค",
      address: "กรุงเทพ , ไทย",
      rating: 2.7,
      price: 4500,
      images: [
        'assets/images/hotel0.jpg',
        'assets/images/hotel1.jpg',
        'assets/images/hotel_demo_4.jpg',
      ],
      chip: [
        'รวมอาหารเช้า',
        'สระว่ายน้ำ',
        'ฟิตเนส'
      ])
];
