import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:training_with_flutter/model/category_option_dto.dart';

class BankHomePage extends StatefulWidget {
  const BankHomePage({super.key});

  @override
  State<BankHomePage> createState() => _BankHomePageState();
}

class _BankHomePageState extends State<BankHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController; // Declaración del TabController

  late int selectedPage = 1;

  int categorySelected = 0;
  int categorySizePage = 3;
  late final PageController _pageController;

  List<CategoryOptionDTO> categoryOptionList = [
    CategoryOptionDTO(
        imagePath: './assets/images/credit_card_64.png',
        color: Colors.green,
        categoryName: 'Balance'),
    CategoryOptionDTO(
        imagePath: './assets/images/billetera_64.png',
        color: Colors.purple,
        categoryName: 'Bill'),
    CategoryOptionDTO(
        imagePath: './assets/images/factura_64.png',
        color: Colors.orange,
        categoryName: 'History'),
    CategoryOptionDTO(
        imagePath: './assets/images/bank_transfer_64.png',
        color: Colors.pink,
        categoryName: 'Split'),
    CategoryOptionDTO(
        imagePath: './assets/images/wallet_64.png',
        color: Colors.red,
        categoryName: 'Wallet'),
  ];

  @override
  void initState() {
    super.initState();
    selectedPage = 1;
    _tabController = TabController(
        length: 3,
        vsync: this,
        initialIndex: selectedPage); // Inicialización del TabController
    _pageController = PageController(initialPage: categorySelected);
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose del TabController al finalizar
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(
          "Scan to pay",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
              child: Icon(Icons.notification_add),
              onTap: () {
                Fluttertoast.showToast(msg: 'notification');
              },
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0), // Altura del borde inferior
          child: Container(
            color: Colors.black12, // Color del borde inferior
            height: 0.5, // Altura del borde inferior
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  // Contenido del primer tab
                  _createPageFromTabBar(context, "..", 1),
                  _createPageFromTabBar(context, "..", 0),
                  _createPageFromTabBar(context, "..", 0),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 1, // por defecto lo mandamos al centro del page
        onTap: (value) {
          _tabController.animateTo(value); // change page from tabbarview
        },
        backgroundColor: Theme.of(context).primaryColorLight,
        color: Theme.of(context).primaryColorDark, // change for theme
        animationDuration: Duration(milliseconds: 200),
        // height: 70,
        items: [
          Icon(Icons.favorite, color: Theme.of(context).primaryColorLight),
          Icon(
            Icons.home,
            color: Theme.of(context).primaryColorLight,
          ),
          Icon(Icons.settings, color: Theme.of(context).primaryColorLight),
        ],
      ),
    );
  }

  /**
   * crea una vista q simulará ser la página actual del tabview seleccionado,
   * además de tener un ìndice del siguiente tabview al q saltará cuando
   * se le de click al textview...
   */
  Widget _createPageFromTabBar(
      BuildContext context, String content, int nextPage) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ####################################################################################
          // section card bank - widget
          Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 2.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage('./assets/images/credit_card_5759x3363.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // ####################################################################################
          // section category - widget
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Category",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          // category options - widget list
          Card(
            elevation: 10,
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 2.0),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  height: 90,
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (page) {
                      print("onPageChanged ${page}");
                      setState(() {
                        selectedPage = page;
                      });
                    },
                    children: List.generate(categorySizePage, (index) {
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: categoryOptionList
                              .map((categoryOption) =>
                                  _createCategoryOptionWidget(categoryOption))
                              .toList());
                    }),
                  ),
                ),
                Container(
                  height: 20,
                  padding: EdgeInsets.only(bottom: 10),
                  child: PageViewDotIndicator(
                    currentItem: selectedPage,
                    count: categorySizePage,
                    unselectedColor: Colors.black26,
                    selectedColor: Colors.blue,
                    duration: const Duration(milliseconds: 200),
                    boxShape: BoxShape.circle,
                    onItemClicked: (index) {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          // ####################################################################################
          // section bill - widge
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Active Bills",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // ####################################################################################
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Center(
                child: InkWell(
                    child: Text(
                      content,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    onTap: () {
                      Fluttertoast.showToast(msg: 'next page ${nextPage}');
                      _tabController.animateTo(nextPage);
                    })),
          ),
        ],
      ),
    );
  }

  Widget _createCategoryOptionWidget(CategoryOptionDTO categoryOptionDTO) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          ClipOval(
            clipper:
                OvalClipper(), // [ENHANCEMENT] llevar esta clase a un package util
            child: Container(
              width: 50, // Ancho del contenedor
              height: 50, // Alto del contenedor
              color: categoryOptionDTO.color,
              child: Center(
                child: Image.asset(
                  categoryOptionDTO.imagePath,
                  fit: BoxFit.cover,
                  height: 30,
                  width: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
            width: 1,
          ),
          Text(
            categoryOptionDTO.categoryName,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontWeight: FontWeight.normal),
          )
        ],
      ),
    );
  }

  static const ROUND_PRIMARY_VIEW = 20.0; // TEXTFIELD, CARD

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
}

class OvalClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
