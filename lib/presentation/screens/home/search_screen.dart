import 'package:flutter/material.dart';
import 'package:info_profile/presentation/utils/app_strings.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: false,
                pinned: true,
                backgroundColor: Colors.white,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: TextFormField(
                        controller: null,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search_outlined),
                          hintText: AppString.search,
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 1.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      height: 100,
                      width: 100,
                      color: Colors.blueGrey,
                    );
                  },
                  childCount: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
