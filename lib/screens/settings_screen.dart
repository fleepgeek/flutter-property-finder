import 'package:flutter/material.dart';
import 'package:flutter_property_finder/api/property_scoped_model.dart';
import 'package:flutter_property_finder/ui_widgets/dropdown_button.dart';
import 'package:scoped_model/scoped_model.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<PropertyScopedModel>(
      builder: (context, child, model) => Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text("Country"),
//              subtitle: Text(model.country),
              trailing: CustomDropdownButton(
                value: model.country,
                items: model.countryList,
                onChanged: model.setCountry,
              ),
            ),
            Divider(),
            ListTile(
              title: Text("Listing Type"),
//              subtitle: Text(model.listingType),
              trailing: CustomDropdownButton(
                value: model.listingType,
                items: model.listingTypeList,
                onChanged: model.setListingType,
              ),
            ),
            Divider(),
            ListTile(
              title: Text("Sort"),
//              subtitle: Text(model.sort),
              trailing: CustomDropdownButton(
                value: model.sort,
                items: model.sortList,
                onChanged: model.setSort,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
