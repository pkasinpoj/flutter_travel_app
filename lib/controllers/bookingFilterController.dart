import 'package:shared_preferences/shared_preferences.dart';
import 'package:thamturakit_mobile/models/hotel_appbar_model.dart';
import 'package:thamturakit_mobile/models/price_filter_model.dart';
import 'package:thamturakit_mobile/models/resident_filter_model.dart';
import 'package:intl/intl.dart';

class bookingFilterController {
  void clearALl() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  void setDestination(_selectedlocation) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('destination', _selectedlocation);
  }

  getDestination() async {
    final prefs = await SharedPreferences.getInstance();
    final String? destination = prefs.getString('destination');
    if (destination != null) {
      return destination;
    } else {
      return "โปรดเลือกสถานที่";
    }
    // return destination;
  }

  void clearDestination() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('destination');
    // await prefs.setString('start_date', _date);
  }


  void setEndDate(_date) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('end_date', _date.millisecondsSinceEpoch);
  }

  getEndDate() async {
    final prefs = await SharedPreferences.getInstance();
    DateTime dta = DateTime.fromMillisecondsSinceEpoch((prefs
            .getInt('end_date') ??
        DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch));

    return dta;
  }

  getTotalDate() async {
    final prefs = await SharedPreferences.getInstance();
    DateTime dt = DateTime.fromMillisecondsSinceEpoch(
        (prefs.getInt('start_date') ?? DateTime.now().millisecondsSinceEpoch));
    DateTime dta = DateTime.fromMillisecondsSinceEpoch((prefs
            .getInt('end_date') ??
        DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch));
    final totalDate = dta.difference(dt).inDays;
    return totalDate;
  }

  void setAdultAmount(_amount) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('adult_amount', _amount);
  }

  void setChildAmount(_amount) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('child_amount', _amount);
  }

  getRoomPrice() async {
    final prefs = await SharedPreferences.getInstance();
    // int? startPrice = prefs.getInt('start');
    List<String>? price = prefs.getStringList('price');
    int? startPrice = int.tryParse(price?[0] ?? "");
    int? endPrice = int.tryParse(price?[1] ?? "");
    return PriceFilterModel(
        startPrice: (startPrice ?? 0), endPrice: (endPrice ?? 50000));
  }

  getHotelAppBar() async {
    final prefs = await SharedPreferences.getInstance();
    DateTime startDate = DateTime.fromMillisecondsSinceEpoch(
        (prefs.getInt('start_date') ?? DateTime.now().millisecondsSinceEpoch));
    DateTime endDate = DateTime.fromMillisecondsSinceEpoch((prefs
            .getInt('end_date') ??
        DateTime.now().add(const Duration(days: 1)).millisecondsSinceEpoch));
    String? destination = prefs.getString('destination');
    int? adultAmount = prefs.getInt('adult_amount');
    int? childAmount = prefs.getInt('child_amount');
    destination = (destination ?? "โรงเเรมทั่วทุกประเทศ");
    adultAmount = (adultAmount ?? 2);
    childAmount = (childAmount ?? 0);
    return HotelAppBarModel(
        hotalName: destination,
        bookingInfo:
            "${DateFormat('E').format(startDate)},${startDate.day} ${DateFormat('MMMM').format(startDate)} - ${DateFormat('E').format(endDate)},${endDate.day} ${DateFormat('MMMM').format(endDate)}",
        residentInfo: "ผญ. ${adultAmount},ด. ${childAmount}คน");
  }
}
