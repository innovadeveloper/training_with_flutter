import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:training_with_flutter/utils/AssetsUtils.dart';
import 'package:training_with_flutter/utils/DecorationUtils.dart';
// import 'package:steel_crypt/steel_crypt.dart';

class Home extends StatefulWidget {
  Home({required Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // TextEditingController placeNameController = TextEditingController();

  static const PADDING_PRIMARY_VIEW = 20.0; // APP BAR, CARDVIEWS
  static const ROUND_PRIMARY_VIEW = 20.0; // TEXTFIELD, CARD
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
            _optionsHomeTop(context),
            SizedBox(
              height: 30,
            ),
            _listBannerSponsored(context),
            _listDoctorsNearbyYou(context),
          ],
        ),
      ]),
    );
  }


// #region background top and circle container
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
              bottomLeft: Radius.circular(ROUND_PRIMARY_VIEW),
              bottomRight: Radius.circular(ROUND_PRIMARY_VIEW),
            ),
          ),
        ),
      ],
    );
  }

  Widget _toolbarTop(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(PADDING_PRIMARY_VIEW),
        child: Text(
          'Medico',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
// #endregion

//#region option_menu_buttons_top
  /**
   * circle options
   * Doctor
   * Medicines
   * Diagnostic
   */
  Widget _optionsHomeTop(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 110,
        left: 20,
        right: 20,
      ),
      // padding: EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _optionMenu(AssetsUtils.ICON_NURSE, "Doctor",
              "Search doctor around you", () {}),
          _optionMenu(AssetsUtils.ICON_MICROSCOPE, "Medicines",
              "Order Medicine to home", () {}),
          _optionMenu(AssetsUtils.ICON_PILL, "Digonostic",
              "Book test at Doorstep", () {}),
        ],
      ),
    );
  }

  Widget _optionMenu(
      String imagePath, String title, String subtitle, Function function) {
    return Column(
      children: <Widget>[
        _ovalButton(imagePath, function),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: 70,
          child: Text(
            subtitle,
            maxLines: 2,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Colors.black, fontSize: 9, fontWeight: FontWeight.w100),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _ovalButton(String imagePath, Function function) {
    final sizeOption = 70.0;
    return Container(
      decoration: DecorationUtils.boxDecorationShadowOval(sizeOption),
      child: ClipOval(
        child: Material(
          elevation: 16.0,
          child: InkWell(
            child: SizedBox(
              width: sizeOption,
              height: sizeOption,
              child: Image.asset(imagePath),
            ),
            onTap: () => function(),
          ),
        ),
      ),
    );
  }
//#endregion

// #region list banner sponsored horizontal
  Widget _listBannerSponsored(BuildContext context) {
    return Container(
      height: 160,
      child: Padding(
        padding: EdgeInsets.only(left: PADDING_PRIMARY_VIEW),
        child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return _itemBannerSponsored(context);
            }),
      ),
    );
  }

  Widget _itemBannerSponsored(BuildContext context) {
    final RADIUS_BANNER = 20.0;
    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width * 0.9;
    // const photoWidthCut = 20.0; // space of cutted

    return Container(
      margin: EdgeInsets.only(right: 10.0),
      padding: EdgeInsets.all(1.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(RADIUS_BANNER),
        child: Image(
          image: AssetImage(
            AssetsUtils.BG_SPONSORED,
          ),
          fit: BoxFit.cover,
          width: width,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(RADIUS_BANNER),
      ),
    );
  }
// #endregion

  Widget _listDoctorsNearbyYou(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: PADDING_PRIMARY_VIEW, vertical: PADDING_PRIMARY_VIEW),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Doctors nearby you',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                'See all',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          _listDoctorCards(context),
        ],
      ),
    );
  }

  Widget _listDoctorCards(BuildContext context) {
    final List<Map<String, String>> listDoctor = [
      {
        "title": "Dr. Vannesa James",
        "subtitle": "B.Sc MBBS DDVL MD-Dermitologist",
        "startCount": "4.2",
        "assetImg": AssetsUtils.BG_DOCTOR_1
      },
      {
        "title": "Dr. Steve",
        "subtitle": "B.Sc MBBS DDVL MDDL",
        "startCount": "3.6",
        "assetImg": AssetsUtils.BG_DOCTOR_3
      },
      {
        "title": "Dr. Luciana",
        "subtitle": "B.Sc MBBS MD-Dermitologist",
        "startCount": "3.0",
        "assetImg": AssetsUtils.BG_DOCTOR_2
      },
      {
        "title": "Dr. Vannesa James",
        "subtitle": "B.Sc MBBS DDVL MD-Dermitologist",
        "startCount": "4.2",
        "assetImg": AssetsUtils.BG_DOCTOR_1
      },
      {
        "title": "Dr. Steve",
        "subtitle": "B.Sc MBBS DDVL MDDL",
        "startCount": "3.6",
        "assetImg": AssetsUtils.BG_DOCTOR_3
      },
      {
        "title": "Dr. Luciana",
        "subtitle": "B.Sc MBBS MD-Dermitologist",
        "startCount": "3.0",
        "assetImg": AssetsUtils.BG_DOCTOR_2
      },
    ];
    return Container(
      height: 200,
      child: ListView.builder(
          itemCount: listDoctor.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            final item = listDoctor[index];
            return _itemDoctorCard(context, item["title"]!, item["subtitle"]!,
                item["startCount"]!, item["assetImg"]!);
          }),
    );
  }

  Widget _itemDoctorCard(BuildContext context, String title, String subtitle,
      String startCount, String assetImg) {
    var mediaQuery = MediaQuery.of(context);
    var width = mediaQuery.size.width * 0.35;
    // const photoWidthCut = 20.0; // space of cutted

    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 30),
          width: width,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    subtitle,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 11, fontWeight: FontWeight.w100),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        startCount,
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        CircleAvatar(
          radius: 31,
          backgroundColor: Colors.white,
          child: ClipOval(
            child: Image.asset(
              assetImg,
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
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
