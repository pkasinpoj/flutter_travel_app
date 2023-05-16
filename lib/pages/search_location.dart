// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:thamturakit_mobile/pages/bookingfilter.dart';
import 'package:thamturakit_mobile/config/font_size.dart';
import 'package:thamturakit_mobile/models/books.dart';
import 'package:flutter/material.dart';
import '../config/Palette .dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:thamturakit_mobile/controllers/bookingFilterController.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({super.key});

  @override
  _SearchLocation createState() => _SearchLocation();
}

class _SearchLocation extends State<SearchLocation> {
  final controller = TextEditingController();
  List<Book> books = allBooks;
  String _selectedlocation = "";
  final bookingFilterCon = bookingFilterController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      top: MediaQuery.of(context).size.width * 0.05,
                      bottom: MediaQuery.of(context).size.width * 0.05),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.68,
                    child: TextField(
                      controller: controller,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width *
                              FontSize.textBody,
                          color: Colors.black,
                          fontWeight: FontWeight.w100),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.04,
                            MediaQuery.of(context).size.width * 0.04,
                            MediaQuery.of(context).size.width * 0.04,
                            0),
                        suffixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(
                              end: MediaQuery.of(context).size.width * 0.03),
                          child: Icon(
                              Icons.search), // myIcon is a 48px-wide widget.
                        ),
                        // set the prefix icon constraints
                        suffixIconConstraints: BoxConstraints(
                          minWidth: MediaQuery.of(context).size.width * 0.1,
                          minHeight: MediaQuery.of(context).size.width * 0.05,
                        ),
                        hintText: "Search Location",
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Palette.greentheme),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          borderSide: BorderSide(color: Palette.greentheme),
                        ),
                      ),
                      onChanged: searchBook,
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.03,
                    top: MediaQuery.of(context).size.width * 0.05,
                    bottom: MediaQuery.of(context).size.width * 0.05),
                width: MediaQuery.of(context).size.width * 0.22,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Back'),
                ),
              )
            ],
          ),
          Expanded(
              child: ListView.separated(
            itemCount: books.length,
            itemBuilder: ((context, index) {
              final book = books[index];
              return ListTile(
                leading:
                    // Image.network(
                    //   book.urlImage,
                    //   fit: BoxFit.cover,
                    //   width: MediaQuery.of(context).size.width * 0.2,
                    //   height: MediaQuery.of(context).size.width * 0.1,
                    // ),
                    Image(
                  image: AssetImage(book.imageUrl),
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                title: Text(
                  book.title,
                  style: TextStyle(
                      fontSize:
                          MediaQuery.of(context).size.width * FontSize.textBody,
                      color: Colors.black,
                      fontWeight: FontWeight.w100),
                ),
                onTap: () {
                  setState(() => _selectedlocation = book.title);
                  // setDestination(_selectedlocation);
                  bookingFilterCon.setDestination(_selectedlocation);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookingFilterScreen(
                              whereFrom_: FontSize.toPage,
                            )),
                  );
                  // Navigator.pushNamed(context, '/');
                },
              );
            }),
            separatorBuilder: (context, index) {
              return Divider(
                height: MediaQuery.of(context).size.width * 0.01,
                indent: MediaQuery.of(context).size.width * 0.03,
                endIndent: MediaQuery.of(context).size.width * 0.03,
                thickness: MediaQuery.of(context).size.width * 0.003,
                color: Palette.greentheme,
              );
            },
          ))
        ],
      )),
    );
  }

  void setDestination(_selectedlocation) async {
    //Hive.init('somePath') -> not needed in browser

    var box = await Hive.openBox('testBox');
    // box.put('name', {'name': 'Fluffy', 'age': 4});
    box.put('destination', _selectedlocation);
    // final name_box = await box.get('name');
    // print('Loki is ${name_box?['name']} years old.');
  }

  void searchBook(String query) {
    final suggestions = allBooks.where((book) {
      final bookTitle = book.title.toLowerCase();
      final input = query.toLowerCase();
      return bookTitle.contains(input);
    }).toList();

    setState(() {
      books = suggestions;
    });
  }
}
