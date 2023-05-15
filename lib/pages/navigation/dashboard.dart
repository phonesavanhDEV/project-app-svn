import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 120.0,
                  height: 80.0,
                  child: MaterialButton(
                    color: Colors.orangeAccent,
                    child: Text(
                      "ແຜນປະເມີນການຕົ້ນທຶນ&ກຳໄລ",
                      style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'NotoSansLao',
                      ),
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, '/costprofit'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    splashColor: Colors.redAccent,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 120.0,
                  height: 80.0,
                  child: MaterialButton(
                    color: Colors.orangeAccent,
                    child: Text(
                      "Coming soon",
                      style: TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'NotoSansLao',
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("coming soon...!!!"),
                        // action: SnackBarAction(
                        //   onPressed: () {
                        //     //if action button is pressed
                        //   },
                        //   label: "OPEN WEBSITE",
                        // ),
                        backgroundColor: Colors.red,
                      ));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    splashColor: Colors.redAccent,
                  ),
                ),
              ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Padding(
          //       padding: EdgeInsets.all(20.0),
          //       child: SizedBox(
          //         width: 150.0,
          //         height: 100.0,
          //         child: MaterialButton(
          //           color: Colors.orangeAccent,
          //           child: Text(
          //             "xxxxxxxxxx",
          //             style: TextStyle(
          //               fontSize: 12.0,
          //               fontWeight: FontWeight.bold,
          //               color: Colors.white,
          //               fontFamily: 'NotoSansLao',
          //             ),
          //           ),
          //           onPressed: () {},
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(15.0),
          //           ),
          //           splashColor: Colors.redAccent,
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.all(20.0),
          //       child: SizedBox(
          //         width: 150.0,
          //         height: 100.0,
          //         child: MaterialButton(
          //           color: Colors.orangeAccent,
          //           child: Text(
          //             "XXXXXXXXXX",
          //             style: TextStyle(
          //               fontSize: 10.0,
          //               fontWeight: FontWeight.bold,
          //               color: Colors.white,
          //               fontFamily: 'NotoSansLao',
          //             ),
          //           ),
          //           onPressed: () {
          //             // Do something when the button is pressed.
          //           },
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(15.0),
          //           ),
          //           splashColor: Colors.redAccent,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      )),
    );
  }
}
