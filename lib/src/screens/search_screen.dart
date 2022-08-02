import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_book_finder/src/components/components.dart';
import 'package:my_book_finder/src/models/book_model.dart';
import 'package:my_book_finder/src/services/book_api_service.dart';
import 'package:my_book_finder/src/styles/colors/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  String? maxResult;
  String mR = "10";
  List<String> maxResultsList = ["10", "20", "30", "40"];
  String? orderBy;
  String oB = "relevance";
  List<String> orderByList = ["newest", "relevance"];
  String? filter;
  String f = 'partial';
  List<String> filterList = [
    "partial",
    "full",
    "free-ebooks",
    "paid-ebooks",
    "ebooks"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.0),
      child: Column(
        children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(0.0),
                      child: Form(
                        key: formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          cursorColor: secondaryColor,
                          style: TextStyle(
                            color: accentColor,
                          ),
                          controller: searchController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 16),
                              hintText: 'Search for a book',
                              prefixIcon:
                                  Icon(color: secondaryColor, Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: secondaryColor))),
                          validator: ((value) {
                            if (value == null || value.isEmpty) {
                              return 'Search Must not be empty';
                            }
                            return null;
                          }),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                      height: 50.0,
                      margin: EdgeInsets.only(top: 3),
                      child: buildDefaultButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              BookService.getBooksBySearch(
                                  searchController.value.text,mR,oB,f);
                            });
                          } else {
                            return 'Search Must Not be Empty';
                          }
                          return null;
                        },
                        text: 'Search',
                        backgroundColor: secondaryColor,
                        shadowColor: secondaryColor,
                        textColor: Colors.white,
                      ),
                   ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      style: TextStyle(
                        color: accentColor
                      ),
                     dropdownColor: backgroundColor,
                     iconEnabledColor: secondaryColor,
                      hint: Text('Results'),
                      value: maxResult,
                      items: maxResultsList
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          maxResult = value.toString();
                          if (maxResult == "10") {
                            mR = "10";
                          } else if (maxResult == "20") {
                            mR = "20";
                          }
                          else if (maxResult == "30") {
                            mR = "30";
                          }
                          else if (maxResult == "40") {
                            mR = "40";
                          }
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      iconEnabledColor: secondaryColor,
                       dropdownColor: backgroundColor,
                      hint: Text('Filter'),
                      value: filter,
                      items: filterList
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          filter = value.toString();
                          if (filter == "partial") {
                            f = "partial";
                          } else if (filter == "full") {
                            f = "full";
                          }
                          else if (filter == "free-ebooks") {
                            f = "free-ebooks";
                          }
                          else if (filter == "paid-ebooks") {
                            f = "paid-ebooks";
                          }
                          else if (filter == "ebooks") {
                            f = "ebooks";
                          }
                        });
                      },
                    ),
                  ),
                   SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: DropdownButton(
                      isExpanded: true,
                      iconEnabledColor: secondaryColor,
                       dropdownColor: backgroundColor,
                      hint: Text('Order By'),
                      value: orderBy,
                      items: orderByList
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          orderBy = value.toString();
                          if (orderBy == "newest") {
                            oB= "newest";
                          } else if (orderBy == "relevance") {
                            oB = "relevance";
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
           
          searchController.value.text == ''
              ? Container(
                  margin: EdgeInsets.only(
                    top: 200,
                  ),
                  child: Text(
                    'No Books to show, search for a book',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: accentColor),
                  ),
                )
              : Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: FutureBuilder<BookModel>(
                      future: BookService.getBooksBySearch(
                          searchController.value.text,mR,oB,f),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SpinKitPouringHourGlassRefined(
                            color: accentColor,
                            size: 70.0,
                          );
                        } else if (snapshot.hasError) {
                          return Text(snapshot.error.toString());
                        } else if (snapshot.data == null) {
                          return Text('There is No Data');
                        }
                        return GridView.builder(
                          itemCount: snapshot.data!.items.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 25.0,
                                  crossAxisSpacing: 25.0),
                          itemBuilder: (context, index) {
                            Item item = snapshot.data!.items[index];
                            return buildBookItem(item, context);
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
