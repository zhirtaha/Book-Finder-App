import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_book_finder/components/components.dart';
import 'package:my_book_finder/models/book_model.dart';
import 'package:my_book_finder/services/book_api_service.dart';
import 'package:my_book_finder/styles/colors/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(0.0),
                  child: TextFormField(
                    cursorColor: secondaryColor,
                    style: TextStyle(
                      color: accentColor,
                    ),
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 16),
                        hintText: 'Search for a book',
                        prefixIcon: Icon(color: secondaryColor, Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: secondaryColor))),
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return 'Search Must not be empty';
                      }
                      return null;
                    }),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                  height: 50.0,
                  margin: EdgeInsets.all(0),
                  child: buildDefaultButton(
                    function: () {
                      if (searchController.value.text.isEmpty) {
                          return 'Search must not be empty';
                        }
                      setState(() {
                        BookService.getBooksBySearch(
                            searchController.value.text);
                      });
                      return null;
                    },
                    text: 'Search',
                    backgroundColor: secondaryColor,
                    shadowColor: secondaryColor,
                    textColor: Colors.white,
                  )),
            ],
          ),
          searchController.value.text == ''
              ? Container(
                  margin: EdgeInsets.only(top: 200, right: 30),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Please Search for a book to show',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: accentColor),
                  ),
                )
              : Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: FutureBuilder<BookModel>(
                      future: BookService.getBooksBySearch(
                          searchController.value.text),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SpinKitWave(
                            itemBuilder: (BuildContext context, int index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  color: accentColor,
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else if (snapshot.data == null) {
                          return Text('There is No Data');
                        }
                        return GridView.builder(
                          itemCount: 10,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 25.0,
                                  crossAxisSpacing: 25.0),
                          itemBuilder: (context, index) {
                            Item item = snapshot.data!.items[index];
                            return buildBookItem(item);
                          },
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
