import 'package:flutter/material.dart';

class FolderPage extends StatefulWidget {
  const FolderPage({Key key}) : super(key: key);

  @override
  _FolderPageState createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  final List<Map> myNote = List.generate(
      10, (index) => {"id": index, "name": "Folder Folder  $index"}).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          PopupMenuButton(
            child: Padding(
              padding: EdgeInsets.only(right: 15),
              child: Icon(Icons.more_vert, color: Colors.black),
            ),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'Edit',
                child: Text(
                  "Edit",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              PopupMenuItem(
                value: 'Delete',
                child: Text(
                  "Delete",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
            onSelected: (value) {
              if (value.contains('Edit')) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You pressed edit'),
                  ),
                );
              } else if (value.contains('Delete')) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You pressed delete'),
                  ),
                );
              }
            },
            offset: Offset(0, 50),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'My Folder My Folder My Folder My Folder ',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 2 / 2.3,
                  ),
                  itemCount: myNote.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/note');
                        },
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadowColor: Color(0xFF39A2DB),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // title
                                Container(
                                  height: 45,
                                  child: Text(
                                    'Reminder Reminder Reminder',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // desc
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 13),
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse aliquet id massa nec placerat. Etiam vitae dui vel sapien scelerisque dapibus sed ut quam. Sed elementum libero vel ex fringilla cursus. Nulla sagittis, ligula in ultrices tristique, neque enim semper purus, eu placerat mauris ante eu nisi. Pellentesque accumsan ex massa, id hendrerit justo sodales sit amet. Praesent porta a libero at tempus. Cras at pulvinar nibh. Aliquam ac congue felis. ',
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                // date and categories
                                Padding(
                                  padding: EdgeInsets.only(top: 1),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '21 Jan',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
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
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
