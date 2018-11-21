import 'package:flutter/material.dart';
import 'package:flutter_property_finder/models/property_scoped_model.dart';
import 'package:flutter_property_finder/ui_widgets/property_item.dart';
import 'package:flutter_property_finder/ui_widgets/search.dart';
import 'package:scoped_model/scoped_model.dart';

class SearchScreen extends StatefulWidget {
  @override
  SearchScreenState createState() {
    return new SearchScreenState();
  }
}

class SearchScreenState extends State<SearchScreen> {
  ScrollController controller;
  int page = 1;

  @override
  void initState() {
    super.initState();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void _scrollListener(){
    var props = PropertyScopedModel.of(context);
    if(controller.position.pixels == controller.position.maxScrollExtent){
      print("Reached end");
      if(!props.isLoadingMore && props.hasMorePages){
        page++;
        print("UI page: $page");
        props.getProperties(props.placeName, page);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<PropertyScopedModel>(
        builder: (context, child, model) {
          return CustomScrollView(
            controller: controller,
            slivers: <Widget>[
              SliverAppBar(
                title: SearchWidget(
                  performSearch: model.getProperties,
                ),
                floating: true,
                snap: true,
              ),
              model.isLoading
                  ? SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : model.getPropertyCount() < 1
                      ? SliverFillRemaining(
                          child: Center(
                            child: Text(
                              model.statusText,
                              style: Theme.of(context).textTheme.headline,
                            ),
                          ),
                        )
                      : SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              print("Index: $index");
                              if(index == model.getPropertyCount()){
                                if(model.hasMorePages){
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                                    child: Center(child: CircularProgressIndicator()),
                                  );
                                }
                              } else if (index == 0) {
                                return Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[300]))
                                  ),
                                  child: Text(
                                    "${model.totalResults} results",
                                    style: Theme.of(context)
                                        .textTheme
                                        .body2
                                        .copyWith(color: Colors.grey[600]),
                                  ),
                                );
                              } else {
                                return Column(
                                  children: <Widget>[
                                    PropertyItem(model.properties[index - 1]),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Divider(
                                        height: 1,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                );
                              }
                            },
                            childCount: model.getPropertyCount() + 1,
                          ),
                        )
            ],
          );
        },
      ),
    );
  }
}
