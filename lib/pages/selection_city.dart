import 'package:flutter/material.dart';
import 'package:training_with_flutter/utils/DecorationUtils.dart';

class SelectionCity extends StatefulWidget {
  SelectionCity({required Key key}) : super(key: key);
  static const PADDING_PRIMARY_VIEW = 20.0; // APP BAR, CARDVIEWS
  static const ROUND_PRIMARY_VIEW = 20.0; // TEXTFIELD, CARD

  @override
  _SelectionCityState createState() => _SelectionCityState();
}

class _SelectionCityState extends State<SelectionCity> {
  // TextEditingController placeNameController = TextEditingController();

  static const DEPARTMENTS_DATA = [
    "Ancash",
    "Apurímac",
    "Arequipa",
    "Ayacucho",
    "Cajamarca",
    "Cuzco",
    "Huancavelica",
    "Huánuco",
    "Ica",
    "Junín",
    "La Libertad",
    "Lambayeque",
    "Lima",
    "Loreto",
    "Madre de Dios",
    "Moquegua",
    "Pasco",
    "Piura",
    "Puno",
    "San Martin",
    "Tacna",
    "Tumbes",
    "Ucayali"
  ];
  List<String> filteredDeparments = DEPARTMENTS_DATA;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _backgroundColor(context),
        _backgroundTop(context),
        _toolbarTop(context),
        Column(
          children: <Widget>[
            _searchInputTop(context),
            _useLocationBody(context),
            Expanded(
              child: _listViewDepartmentsBody(context),
            ),
          ],
        ),
      ]),
    );
  }

  Widget _backgroundColor(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey[200],
    );
  }

  Widget _backgroundTop(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(SelectionCity.ROUND_PRIMARY_VIEW),
              bottomRight: Radius.circular(SelectionCity.ROUND_PRIMARY_VIEW),
            ),
          ),
        ),
      ],
    );
  }

  Widget _toolbarTop(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(SelectionCity.PADDING_PRIMARY_VIEW),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.clear,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Select your city',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchInputTop(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 110,
        left: 20,
        right: 20,
      ),
      padding: EdgeInsets.all(5.0),
      decoration: DecorationUtils.boxDecorationShadowOval(SelectionCity.ROUND_PRIMARY_VIEW),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        child: TextField(
          decoration: new InputDecoration(
            border: InputBorder.none,
            hintText: 'Search here',
            icon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          textInputAction: TextInputAction.done,
          onChanged: (text) {
            // print(value);
            setState(() {
              if (text.isEmpty) {
                filteredDeparments = DEPARTMENTS_DATA;
              } else {
                filteredDeparments = DEPARTMENTS_DATA
                    .where((element) =>
                        element.toLowerCase().startsWith(text.toLowerCase()))
                    .toList();
              }
            });
          },
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }

  Widget _useLocationBody(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 30.0,
        ),
        child: InkWell(
          splashColor: Colors.white60,
          onTap: () {
            print("click..!");
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: SelectionCity.PADDING_PRIMARY_VIEW,
            ),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.location_on,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Use current location',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listViewDepartmentsBody(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(
      //   horizontal: SelectionCity.PADDING_PRIMARY_VIEW,
      // ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SelectionCity.ROUND_PRIMARY_VIEW),
          topRight: Radius.circular(SelectionCity.ROUND_PRIMARY_VIEW),
        ),
      ),
      child: filteredDeparments.length == 0
          ? Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.save_alt,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Ups! There are departments with that name..',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.grey,
                        ),
                  )
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: filteredDeparments.length,
              itemBuilder: (BuildContext context, int index) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: Colors.white.withOpacity(0.5),
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SelectionCity.PADDING_PRIMARY_VIEW),
                      child: Column(children: [
                        ListTile(
                          title: Text(
                            filteredDeparments[index],
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        Divider(
                          color: Colors.grey.withOpacity(0.4),
                        )
                      ]),
                    ),
                  ),
                );
              }),
    );
  }

  List<Map<int, String>> _listElements(int listSize) {
    return List<Map<int, String>>.generate(
        listSize,
        (int index) => {
              index: "A${index}",
            });
  }

  Widget? _widget(BuildContext context) {}
}
