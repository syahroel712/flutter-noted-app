import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map> myFolder = List.generate(
      6, (index) => {"id": index, "name": "Folder Folder  $index"}).toList();

  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  var nama;
  @override
  void initState() {
    getPref();
    super.initState();
  }

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      nama = preferences.getString('userNama');
    });
  }

  void logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('userId', '');
    preferences.setString('userNama', '');
    preferences.setString('userEmail', '');
    preferences.setString('token', '');
    preferences.commit();
    setState(() {
      Navigator.pushReplacementNamed(context, '/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.menu_rounded,
          color: const Color(0xff111113),
        ),
        actions: <Widget>[
          PopupMenuButton(
            child: Padding(
              padding: EdgeInsets.only(right: 15),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://raw.githubusercontent.com/syahroel712/syahroel712.github.io/master/images/bg-1.png'),
                backgroundColor: Colors.transparent,
              ),
            ),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'Profile',
                child: Text(
                  "Profile",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              PopupMenuItem(
                value: 'Logout',
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
            onSelected: (value) {
              if (value.contains('Profile')) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You pressed profile'),
                  ),
                );
              } else if (value == 'Logout') {
                logout();
              }
            },
            offset: Offset(0, 50),
          ),
        ],
      ),
      body: SafeArea(
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Heading
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  'Hello $nama',
                  maxLines: 1,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    fontFamily: 'Poppins-Bold',
                  ),
                ),
              ),
              // Search
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.all(3.0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Search",
                              isDense: true,
                              contentPadding: EdgeInsets.all(13),
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFF39A2DB),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                borderSide: BorderSide(
                                  color: Color(0xFF39A2DB),
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Tabbar and TabbarView
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Container(
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          Container(
                            child: TabBar(
                              indicator: UnderlineTabIndicator(
                                borderSide: BorderSide(
                                  width: 2.0,
                                  color: Color(0xFF39A2DB),
                                ),
                                insets: EdgeInsets.symmetric(horizontal: 100.0),
                              ),
                              indicatorColor: Color(0xFFFFFFFF),
                              labelColor: Colors.black,
                              labelStyle: TextStyle(
                                fontFamily: 'Poppins-SemiBold',
                                fontSize: 20,
                              ),
                              tabs: [
                                Tab(text: 'All'),
                                Tab(text: 'Folder'),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: TabBarView(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: StaggeredGridView.countBuilder(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 5,
                                        crossAxisSpacing: 5,
                                        itemCount: 8,
                                        itemBuilder: (context, index) {
                                          if (index.isEven) {
                                            return Container(
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context, '/note');
                                                },
                                                child: Card(
                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  shadowColor:
                                                      Color(0xFF39A2DB),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 20,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // title
                                                        Container(
                                                          height: 45,
                                                          child: Text(
                                                            'Reminder Reminder Reminder Reminder Reminder',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        // desc
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 14),
                                                          child: Text(
                                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse aliquet id massa nec placerat. Etiam vitae dui vel sapien scelerisque dapibus sed ut quam. Sed elementum libero vel ex fringilla cursus. Nulla sagittis, ligula in ultrices tristique, neque enim semper purus, eu placerat mauris ante eu nisi. Pellentesque accumsan ex massa, id hendrerit justo sodales sit amet. Praesent porta a libero at tempus. Cras at pulvinar nibh. Aliquam ac congue felis. ',
                                                            maxLines: 7,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ),
                                                        // date and categories
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 1.5),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                '21 Jan',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              Text(
                                                                'My Targets',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          } else {
                                            return Container(
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context, '/note');
                                                },
                                                child: Card(
                                                  elevation: 3,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  shadowColor:
                                                      Color(0xFF39A2DB),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 20,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        // title
                                                        Container(
                                                          height: 45,
                                                          child: Text(
                                                            'Reminder Reminder Reminder',
                                                            style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        // desc
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 12),
                                                          child: Text(
                                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse aliquet id massa nec placerat. Etiam vitae dui vel sapien scelerisque dapibus sed ut quam. Sed elementum libero vel ex fringilla cursus. Nulla sagittis, ligula in ultrices tristique, neque enim semper purus, eu placerat mauris ante eu nisi. Pellentesque accumsan ex massa, id hendrerit justo sodales sit amet. Praesent porta a libero at tempus. Cras at pulvinar nibh. Aliquam ac congue felis. ',
                                                            maxLines: 5,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ),
                                                        // date and categories
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                '21 Jan',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              Text(
                                                                'My Targets',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        staggeredTileBuilder: (index) {
                                          return StaggeredTile.count(
                                            1,
                                            index.isEven ? 1.4 : 1.2,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 5,
                                          crossAxisSpacing: 5,
                                          childAspectRatio: 2 / 2.3,
                                        ),
                                        itemCount: myFolder.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context, '/folder');
                                              },
                                              child: Card(
                                                elevation: 3,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                shadowColor: Color(0xFF39A2DB),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 20,
                                                  ),
                                                  child: Center(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          // title
                                                          Container(
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          10),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                child: Center(
                                                                  child: Image
                                                                      .asset(
                                                                    'images/icons/folder.png',
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width /
                                                                        3.6,
                                                                    fit: BoxFit
                                                                        .fitWidth,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Center(
                                                            child: Container(
                                                              height: 35,
                                                              child: Text(
                                                                myFolder[index]
                                                                    ["name"],
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) => FabCircularMenu(
          key: fabKey,
          // Cannot be `Alignment.center`
          alignment: Alignment.bottomRight,
          ringColor: Color(0xFFA2DBFA),
          // ringColor: Colors.transparent,
          ringDiameter: 300.0,
          ringWidth: 80.0,
          fabSize: 64.0,
          fabElevation: 30.0,
          fabIconBorder: CircleBorder(),
          // Also can use specific color based on wether
          // the menu is open or not:
          // fabOpenColor: Colors.white,
          // fabCloseColor: Colors.white
          // These properties take precedence over fabColor
          fabColor: Color(0xFF39A2DB),
          fabOpenIcon: Icon(Icons.menu, color: Colors.white),
          fabCloseIcon: Icon(Icons.close, color: Colors.white),
          fabMargin: const EdgeInsets.all(16.0),
          animationDuration: const Duration(milliseconds: 800),
          animationCurve: Curves.easeInOutCirc,
          // onDisplayChange: (isOpen) {
          //   _showSnackBar(context, "The menu is ${isOpen ? "open" : "closed"}");
          // },
          children: <Widget>[
            RawMaterialButton(
              fillColor: Color(0xFF39A2DB),
              constraints: BoxConstraints(
                minHeight: 65,
                minWidth: 65,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/folder_add');
              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add, color: Colors.white), // icon
                  Text("Folder", style: TextStyle(color: Colors.white)), // text
                ],
              ),
            ),
            RawMaterialButton(
              fillColor: Color(0xFF39A2DB),
              constraints: BoxConstraints(
                minHeight: 65,
                minWidth: 65,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/note_add');
              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add, color: Colors.white), // icon
                  Text("Note", style: TextStyle(color: Colors.white)), // text
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
