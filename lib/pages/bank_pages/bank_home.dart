import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BankHomePage extends StatefulWidget {
  const BankHomePage({super.key});

  @override
  State<BankHomePage> createState() => _BankHomePageState();
}

class _BankHomePageState extends State<BankHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController; // Declaración del TabController

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3, vsync: this); // Inicialización del TabController
  }

  @override
  void dispose() {
    _tabController.dispose(); // Dispose del TabController al finalizar
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                // Contenido del primer tab
                _createPageFromTabBar(context, "FirstPage", 1),
                _createPageFromTabBar(context, "SecondPage", 0),
                _createPageFromTabBar(context, "ThirdPage", 0),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (value) {
          _tabController.animateTo(value);  // change page from tabbarview
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
  Center _createPageFromTabBar(
      BuildContext context, String content, int nextPage) {
    return Center(
        child: InkWell(
            child: Text(
              content,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            onTap: () {
              Fluttertoast.showToast(msg: 'next page ${nextPage}');
              _tabController.animateTo(nextPage);
            }));
  }
}
