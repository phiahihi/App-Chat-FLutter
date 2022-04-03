import 'dart:async';

import 'package:app_chat/controller/chat_provider.dart';
import 'package:app_chat/model/user.dart';
import 'package:app_chat/widget/userItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_chat/widget/searchFilter.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String txtSearch = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  iconTheme: const IconThemeData(
                    color: Colors.black,
                  ),
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 0, //shadow
                  automaticallyImplyLeading: false,
                  bottom: PreferredSize(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          const BackButton(),
                          Expanded(
                              child: searchFilter(
                                search: txtSearch,
                                label: "Search Anyone",
                                changed: (value) => ( setState(() => txtSearch = value)),
                              ))
                        ],
                      ),
                    ),
                    preferredSize: const Size(0.0, 40.0),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                      FutureBuilder<List<User>>(
                          future: Provider.of<chatController>(context, listen: false).filterSearch(txtSearch),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Center(
                                child: Text(snapshot.error.toString()),
                              );
                            }
                            if (snapshot.hasData) {
                              return (snapshot.data!.isEmpty)
                                  ? Container(
                                margin: EdgeInsets.only(top: 30),
                                child: const Center(
                                  child: Text('Not found', style: TextStyle(fontSize: 18),),
                              ),)
                                  : Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(top: 10, bottom: 10),
                                     child: Text("${snapshot.data!.length} result found", style: TextStyle(fontSize: 15),)
                                  ),
                                  ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (context, index) => UserItem(user: snapshot.data![index])
                                  )
                                ],
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          })
                    ]))
              ],
            ),
          ),
        ));
  }
}
