import 'package:flutter/material.dart';
import 'package:thamturakit_mobile/config/Palette%20.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:thamturakit_mobile/config/font_size.dart';

class GenderListItem extends StatefulWidget {
  const GenderListItem({super.key});

  @override
  State<GenderListItem> createState() => _GenderListItemlState();
}

class _GenderListItemlState extends State<GenderListItem> {
  String _gender = "เพศ";
  int _sort_by = -1;

  Future<String> setGender(String _selectedgender) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('gender', _selectedgender);
    String val = prefs.getString('gender') == null
        ? ""
        : (prefs.getString('gender')).toString();
    return val;
  }

  ChangeGender(String _selectedgender, int sort_by) {
    setGender(_selectedgender).then((val) => setState(() {
          _gender = val;
          _sort_by = sort_by;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        genderList();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: MediaQuery.of(context).size.width * FontSize.thinBorder,
          ),
          borderRadius: BorderRadius.circular(
              MediaQuery.of(context).size.width * FontSize.borderRadius),
        ),
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.025,
            horizontal: MediaQuery.of(context).size.width * 0.025),
        child: Row(
          children: [
            Text(
              _gender,
              style: TextStyle(
                  fontSize:
                      MediaQuery.of(context).size.width * FontSize.textBody),
            ),
            Icon(Icons.arrow_drop_down)
          ],
        ),
      ),
    );
  }

  void genderList() {
    Future<void> future = showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(MediaQuery.of(context).size.width * 0.1),
            topRight: Radius.circular(MediaQuery.of(context).size.width * 0.1)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(builder:
            (BuildContext context, void Function(void Function()) setState) {
          return Container(
              height: MediaQuery.of(context).size.width * 0.7,
              child: Container(
                margin:
                    EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text("โปรดระบุเพศของคุณ :",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: MediaQuery.of(context).size.width *
                                    FontSize.textSubHeader))),
                    Divider(
                      height: MediaQuery.of(context).size.width * 0.01,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    InkWell(
                      onTap: () async {
                        ChangeGender("ชาย", 0);
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ชาย ",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textBody)),
                          _sort_by == 0 ? Icon(Icons.check) : Container()
                        ],
                      ),
                    ),
                    Divider(
                      height: MediaQuery.of(context).size.width * 0.01,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    InkWell(
                      onTap: () {
                        ChangeGender("หญิง", 1);
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("หญิง ",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textBody)),
                          _sort_by == 1 ? Icon(Icons.check) : Container()
                        ],
                      ),
                    ),
                    Divider(
                      height: MediaQuery.of(context).size.width * 0.01,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    InkWell(
                      onTap: () {
                        ChangeGender("ไม่ระบุ", 2);
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ไม่ระบุ ",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textBody)),
                          _sort_by == 2 ? Icon(Icons.check) : Container()
                        ],
                      ),
                    ),
                    Divider(
                      height: MediaQuery.of(context).size.width * 0.01,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    InkWell(
                      onTap: () {
                        ChangeGender("อื่นๆ", 3);
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("อื่นๆ ",
                              style: TextStyle(
                                  fontSize: MediaQuery.of(context).size.width *
                                      FontSize.textBody)),
                          _sort_by == 3 ? Icon(Icons.check) : Container()
                        ],
                      ),
                    ),
                    Divider(
                      height: MediaQuery.of(context).size.width * 0.01,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ));
        });
      },
    );
  }
}
