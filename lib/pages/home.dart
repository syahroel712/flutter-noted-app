import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map> myFolder = List.generate(
      6,
      (index) => {
            "id": index,
            "name": "Folder Folder  $index"
          }).toList();

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
          CircleAvatar(
            radius: 20,
            backgroundImage:
                NetworkImage('https://syahroel712.github.io/images/bg-2.jpg'),
            backgroundColor: Colors.transparent,
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
                  'Hello Syahrul',
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
                                                                FontWeight.bold,
                                                          ),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      // desc
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10),
                                                        child: Text(
                                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse aliquet id massa nec placerat. Etiam vitae dui vel sapien scelerisque dapibus sed ut quam. Sed elementum libero vel ex fringilla cursus. Nulla sagittis, ligula in ultrices tristique, neque enim semper purus, eu placerat mauris ante eu nisi. Pellentesque accumsan ex massa, id hendrerit justo sodales sit amet. Praesent porta a libero at tempus. Cras at pulvinar nibh. Aliquam ac congue felis. ',
                                                          maxLines: 7,
                                                          overflow: TextOverflow
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
                                                                top: 9.5),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              '21 Jan',
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              'My Targets',
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.grey,
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
                                            );
                                          } else {
                                            return Container(
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
                                                                FontWeight.bold,
                                                          ),
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      // desc
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10),
                                                        child: Text(
                                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse aliquet id massa nec placerat. Etiam vitae dui vel sapien scelerisque dapibus sed ut quam. Sed elementum libero vel ex fringilla cursus. Nulla sagittis, ligula in ultrices tristique, neque enim semper purus, eu placerat mauris ante eu nisi. Pellentesque accumsan ex massa, id hendrerit justo sodales sit amet. Praesent porta a libero at tempus. Cras at pulvinar nibh. Aliquam ac congue felis. ',
                                                          maxLines: 5,
                                                          overflow: TextOverflow
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
                                                                top: 5.5),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              '21 Jan',
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                            Text(
                                                              'My Targets',
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.grey,
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
                                                                    .network(
                                                                  'https://pngimg.com/uploads/folder/folder_PNG100450.png',
                                                                  width: MediaQuery.of(
                                                                              context)
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
                                                              style: TextStyle(
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
    );
  }
}
