import 'package:flutter/material.dart';
import 'package:flutter_property_finder/models/nestoria.dart';
import 'package:flutter_property_finder/ui_widgets/text_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final Property property;

  const DetailScreen(this.property);

  _launchURL(BuildContext context, String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
//      throw 'Could not launch $url';
      Scaffold.of(context).showSnackBar(SnackBar(content: Text("Can't Load: $url")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: Container(
        color: Theme.of(context).primaryColor,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Builder(
                builder: (context) => FlatButton.icon(
                  onPressed: () {
                    _launchURL(context, property.listerUrl);
                  },
                  icon: Icon(Icons.launch),
                  label: Text("Visit Listing"),
                  textColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: false,
            expandedHeight: 256,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.network(
                    property.imgUrl,
                    fit: BoxFit.cover,
                  ),
                  // This gradient ensures that the toolbar icons are distinct
                  // against the background image.
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, -0.4),
                        colors: <Color>[Color(0x60000000), Color(0x00000000)],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              FontAwesomeIcons.tag,
                              size: 20,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          Text(
                            property.priceFormatted,
                            style: Theme.of(context).textTheme.title,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    property.title,
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 24.0),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 16.0),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.grey, width: 0.4),
                        bottom: BorderSide(color: Colors.grey, width: 0.4),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        TextIcon(
                          icon: FontAwesomeIcons.bed,
                          text: "${property.bedroomNumber ?? "#"} Bedrooom",
                        ),
                        TextIcon(
                          icon: FontAwesomeIcons.shower,
                          text: "${property.bathroomNumber ?? "#"} Bathrooom",
                        ),
                        TextIcon(
                          icon: FontAwesomeIcons.car,
                          text: "${property.carSpaces ?? "#"} Carspace",
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Summary",
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(property.summary),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      "Tags",
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                  ),
                  Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children: property.keyWordList
                        .map((kl) => Chip(
                              label: Text(kl),
                              labelStyle: TextStyle(color: Colors.white),
                              backgroundColor: Theme.of(context).accentColor,
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Lister",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(fontSize: 20.0),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text("${property?.listerName ?? "unavailable"}"),
                    subtitle: Text(
                        "${property?.datasourceName ?? "source unavailable"}"),
                  ),
                ],
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
