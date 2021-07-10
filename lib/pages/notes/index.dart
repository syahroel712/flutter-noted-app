import 'package:flutter/material.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
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
              child: Center(
                child: Icon(Icons.more_vert, color: Colors.black),
              ),
            ),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: 'Done',
                child: Text(
                  "Done",
                  style: TextStyle(color: Colors.black),
                ),
              ),
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
              ),
            ],
            onSelected: (value) {
              if (value.contains('Done')) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You pressed done'),
                  ),
                );
              } else if (value == 'Edit') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('You pressed edit'),
                  ),
                );
              } else {
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
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Reminder Me Babe ',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '21 Januari 2021, 18:35:04',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    'My Targets',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vitae quam est. Donec hendrerit porttitor vestibulum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris nec ante mauris. Vestibulum quis pharetra tellus, sit amet egestas dui. Cras porta ullamcorper feugiat. Nam vel mi at lectus efficitur sodales at sed sem. Sed gravida facilisis mi ut aliquam. Sed tempor imperdiet faucibus. ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vitae quam est. Donec hendrerit porttitor vestibulum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris nec ante mauris. Vestibulum quis pharetra tellus, sit amet egestas dui. Cras porta ullamcorper feugiat. Nam vel mi at lectus efficitur sodales at sed sem. Sed gravida facilisis mi ut aliquam. Sed tempor imperdiet faucibus. ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vitae quam est. Donec hendrerit porttitor vestibulum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris nec ante mauris. Vestibulum quis pharetra tellus, sit amet egestas dui. Cras porta ullamcorper feugiat. Nam vel mi at lectus efficitur sodales at sed sem. Sed gravida facilisis mi ut aliquam. Sed tempor imperdiet faucibus. ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vitae quam est. Donec hendrerit porttitor vestibulum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris nec ante mauris. Vestibulum quis pharetra tellus, sit amet egestas dui. Cras porta ullamcorper feugiat. Nam vel mi at lectus efficitur sodales at sed sem. Sed gravida facilisis mi ut aliquam. Sed tempor imperdiet faucibus. ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
                        child: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque vitae quam est. Donec hendrerit porttitor vestibulum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris nec ante mauris. Vestibulum quis pharetra tellus, sit amet egestas dui. Cras porta ullamcorper feugiat. Nam vel mi at lectus efficitur sodales at sed sem. Sed gravida facilisis mi ut aliquam. Sed tempor imperdiet faucibus. ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
