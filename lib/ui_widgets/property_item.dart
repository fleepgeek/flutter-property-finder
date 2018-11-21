import 'package:flutter/material.dart';
import 'package:flutter_property_finder/models/nestoria.dart';
import 'package:flutter_property_finder/ui_widgets/text_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PropertyItem extends StatelessWidget {
  final Property property;

  const PropertyItem(this.property);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Container(
              height: 100,
              width: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(property.thumbUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      property.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.deepPurple),
                    ),
                    Text(
                      "By ${property.listerName}" ?? "unavailable",
                      style: Theme.of(context)
                          .textTheme
                          .body2
                          .copyWith(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            property.priceFormatted,
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ),
                        TextIcon(
                          text: "${property.bedroomNumber ?? "#"}",
                          icon: FontAwesomeIcons.bed,
                          isColumn: false,
                        ),
                        TextIcon(
                          text: "${property.bathroomNumber ?? "#"}",
                          icon: FontAwesomeIcons.shower,
                          isColumn: false,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
