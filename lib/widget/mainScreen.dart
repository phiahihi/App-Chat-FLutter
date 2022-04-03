import 'dart:async';

import 'package:app_chat/model/user.dart';
import 'package:app_chat/widget/searchFilter.dart';
import 'package:app_chat/widget/userItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/chat_provider.dart';
import 'filterPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 3,
          bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: searchFilter(
                label: "Search Anyone",
                tap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchPage(),
                    ),
                  );
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
            ),
            preferredSize: const Size(0.0, 40.0),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
              FutureBuilder<List<User>>(
                  future: Provider.of<chatController>(context, listen: false).fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }
                    if (snapshot.hasData) {
                      return (snapshot.data!.isEmpty)
                          ? const Center(
                        child:
                          Text("Not found"),
                      )
                          : ListView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => UserItem(user: snapshot.data![index])
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  })
            ]))
      ],
    );
  }
}