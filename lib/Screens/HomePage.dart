import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _success = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _success ? Color(0xff81cffc) : Colors.red,
        title: Text('popup message'),
      ),
      body: Center(
          child: Container(
        height: 50,
        width: 235,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(30),
          color: _success ? Color(0xff81cffc) : Colors.red,
          child: MaterialButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                  _success ? 'Success!' : 'Fail!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ))
              ],
            ),
            onPressed: () {
              showGeneralDialog(
                  barrierLabel: 'label',
                  barrierDismissible: true,
                  barrierColor: Colors.black.withOpacity(0.5),
                  transitionDuration: Duration(milliseconds: 300),
                  context: context,
                  transitionBuilder: (context, anim1, anim2, child) {
                    return SlideTransition(
                      position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                          .animate(anim1),
                      child: child,
                    );
                  },
                  pageBuilder: (context, anim1, anim2) {
                    return Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 500,
                        width: 350,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Material(
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox.shrink(),
                                    IconButton(
                                        icon: Icon(Icons.cancel),
                                        onPressed: () {
                                          Navigator.pop(context);
                                          setState(() {
                                            _success = !_success;
                                          });
                                        })
                                  ],
                                ),
                                Image.asset(
                                  _success
                                      ? 'assets/success.JPG'
                                      : 'assets/fail.JPG',
                                  height: 200,
                                ),
                                Text(
                                  _success ? 'Success' : 'Oh-ooh',
                                  style: TextStyle(
                                    color: _success
                                        ? Color(0xff81cffc)
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                Text(
                                  _success
                                      ? 'Your guitar is tuned and now you are ready to hit the stage and rock!'
                                      : 'It seems that you are out of tune...\ntry again or you will be thrown tomatoes!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 235,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(30),
                                    color: _success
                                        ? Color(0xff81cffc)
                                        : Colors.red,
                                    child: MaterialButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: Text(
                                            _success
                                                ? 'Let\'s Rock!'
                                                : 'Tune Guitar',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            },
          ),
        ),
      )),
    );
  }
}
