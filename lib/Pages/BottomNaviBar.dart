import 'package:flutter/material.dart';
import 'package:webview_rnd/Pages/RentPage.dart';
import 'package:webview_rnd/Pages/TripleNinePage.dart';
import '../../Utils/constants.dart';
import 'BuyPage.dart';
import 'HomePage.dart';

class BottomNaviBar extends StatefulWidget {
  const BottomNaviBar({Key? key}) : super(key: key);

  @override
  State<BottomNaviBar> createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<BottomNaviBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool canPop = false;
  DateTime? currentBackPressTime;
  int _selectedIndex = 0;
  late final List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      HomePage(),
      BuyPage(navigateToHomePageCallback: getNavigateToHomePageCallback()),
      RentPage(navigateToHomePageCallback: getNavigateToHomePageCallback()),
      TripleNinePage(
          navigateToHomePageCallback: getNavigateToHomePageCallback())
    ];
  }

  void _onItemTapped(int index) {
    if (index == 4) {
      _scaffoldKey.currentState?.openDrawer();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void Function() getNavigateToHomePageCallback() {
    return _navigateToHomePage;
  }

  void _navigateToHomePage() {
    setState(() {
      _selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    return PopScope(
      canPop: canPop,
      onPopInvoked: (didPos) {
        if (!_scaffoldKey.currentState!.isDrawerOpen && _selectedIndex == 0) {
          DateTime now = DateTime.now();
          if (currentBackPressTime == null ||
              now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
            currentBackPressTime = now;
            showToast(
                'Tap again to close',
                Colors.green,
                const Icon(
                  Icons.check,
                  color: Colors.white,
                ));
            setState(() {
              canPop = false;
            });
          } else {
            setState(() {
              canPop = true;
            });
          }
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: statusBarHeight),
        child: Scaffold(
          key: _scaffoldKey,
          drawer: Container(
              width: MediaQuery.of(context).size.width - 74,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.zero, // Remove the corner radius
                color: Colors.white, // Set your desired background color here
              ),
              child: const Drawer()),
          body: Column(
            children: [
              Container(
                  height: 58,
                  width: double.infinity,
                  color: greyColor,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset(
                          'assets/icons/savemaxdoller.png',
                          width: 27,
                          height: 27,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          margin: EdgeInsets.only(top: 8, bottom: 8),
                          height: double.infinity,
                          color: Colors.white,
                          child: const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 8.0, right: 8.0),
                                child: Icon(
                                  Icons.location_on,
                                  size: 17,
                                ),
                              ),
                              Text(
                                'Toronto',
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 8,
                            bottom: 8,
                          ),
                          height: double.infinity,
                          color: darkGreyColor,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 10.0, right: 6.0),
                                child: Icon(Icons.close, size: 16),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 6.0, right: 10.0),
                                child: Icon(
                                  Icons.search,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const Expanded(
                          flex: 0,
                          child: SizedBox(
                            width: 33,
                          ))

                      // Expanded(flex: 1,child: Container())
                    ],
                  )),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: Center(
                  child: _widgetOptions.elementAt(_selectedIndex),
                ),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            unselectedLabelStyle: TextStyle(color: Colors.black),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_home_outlined),
                label: 'Buy',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.vpn_key_rounded),
                label: 'Rent',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.attach_money),
                label: '999',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Menu',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.red,
            onTap: _onItemTapped,
            // Apply the desired font family to the BottomNavigationBarItem label text
            selectedLabelStyle: TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
