import 'package:flutter/material.dart';
import 'package:flutter_property_finder/models/property_scoped_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant<PropertyScopedModel>(
        builder: (context, child, model) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                title: Text("Property Finder"),
              ),
              model.isLoading
                  ? SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(model.properties[index].title),
                          );
                        },
                        childCount: model.properties.length,
                      ),
                    )
            ],
          );
        },
      ),
    );
  }
}
