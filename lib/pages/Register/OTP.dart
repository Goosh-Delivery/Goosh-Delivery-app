// import 'package:flutter/material.dart';
//
// class OTPPage extends StatefulWidget {
//   OTPPage({Key key}) : super(key: key);
//
//   @override
//   _OTPPageState createState() => _OTPPageState();
// }
//
// class _OTPPageState extends State<OTPPage> {
//   TextEditingController textcontroller1;
//   TextEditingController textcontroller2;
//   TextEditingController textcontroller3;
//   TextEditingController textcontroller4;
//
//   @override
//   void initState() {
//     super.initState();
//     textcontroller1 = TextEditingController(text: '0');
//     textcontroller2 = TextEditingController(text: '0');
//     textcontroller3 = TextEditingController(text: '0');
//     textcontroller4 = TextEditingController(text: '0');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // key: scaffoldKey,
//       backgroundColor: Color(0xFFF6F7F9),
//       body: SafeArea(
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height * 1,
//           decoration: BoxDecoration(
//             color: Color(0xFFF6F7F9),
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.max,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 80,
//                   decoration: BoxDecoration(),
//                   alignment: Alignment(-0.85, 0),
//                   child: Icon(
//                     Icons.arrow_back_outlined,
//                     color: Color(0xFF69696A),
//                     size: 40,
//                   ),
//                 ),
//                 Container(
//                   width: MediaQuery.of(context).size.width * 10,
//                   height: MediaQuery.of(context).size.height * 1,
//                   decoration: BoxDecoration(),
//                   child: Padding(
//                     padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.max,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Verify Your Number',
//                           style: TextStyle(
//                             fontFamily: 'Tahoma',
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//
//                           Padding(
//                             padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//                             child: Text(
//                               " We have sent you a four digit verification code please enter them here.",
//                               style: TextStyle(
//                                fontFamily: 'Tahoma', color: Color(0xFF999999),
//                                 ), ), ),
//                                Padding(
//                                   padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
//                                   child: Container(
//                                     width: MediaQuery.of(context).size.width,
//                                     height: 100,
//                                     decoration: BoxDecoration(),
//                                     child: Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         Expanded(
//                                           child: Padding(
//                                             padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
//                                             child: TextFormField( controller: textcontroller1,
//                                             obscureText: false,
//                                             decoration: InputDecoration(
//                                               isDense: true,
//                                               enabledBorder: OutlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                   color: Colors.transparent,
//                                                   width: 1, ),
//                                                   borderRadius: BorderRadius.only(
//                                                     bottomLeft: Radius.circular(15),
//                                                     bottomRight: Radius.circular(15),
//                                                     topLeft: Radius.circular(15),
//                                                     topRight: Radius.circular(15),
//                                                     ),
//                                                      ),
//                                                      focusedBorder: OutlineInputBorder(
//                                                        borderSide: BorderSide(
//                                                          color: Colors.transparent,
//                                                          width: 1,
//                                                        ),
//                                                        borderRadius:  BorderRadius.only(
//                                                          bottomLeft: Radius.circular(15),
//                                                          bottomRight: Radius.circular(15),
//                                                          topLeft: Radius.circular(15),
//                                                          topRight: Radius.circular(15)
//                                                        ),
//                                                      ),
//                                                      filled: true,
//                                                      fillColor: Color(0xFFE6E6E6),
//                                                      contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 10),
//                                             ),
//                                             style: TextStyle(
//                                               fontFamily: "Tahoma",
//                                               fontSize: 50,
//                                             ),
//                                             textAlign:  TextAlign.center,
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           child: Padding(
//                                             padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
//                                             child: TextFormField(
//                                               controller: textcontroller4,
//                                               obscureText: false,
//                                               decoration: InputDecoration(
//                                                 isDense: true,
//                                                 enabledBorder: OutlinelnputBorder(
//                                                   borderSide: BorderSide(
//                                                   color: Colors.transparent,
//                                                   width: 1, ),
//                                                   borderRadius: BorderRadius.only(
//                                                       bottomLeft: Radius.circular(15),
//                                                       bottomRight: Radius.circular(15),
//                                                       topLeft: Radius.circular(15),
//                                                       topRight: Radius.circular(15),
//                                                        ),
//                                                        ),
//                                                       focusedBorder: OutlinelnputBorder(
//                                                         borderSide: BorderSide(
//                                                           color: Colors.transparent,
//                                                           width: 1, ),
//                                                           borderRadius: BorderRadius.only(
//                                                             bottomLeft: Radius.circular(15),
//                                                             bottomRight: Radius.circular(15),
//                                                             topLeft: Radius.circular(15),
//                                                             topRight: Radius.circular(15), ), ),
//                                                             filled: true,
//                                                             fillColor: Color(0xFFE6E6E6),
//                                                             contentPadding: EdgeInsets.fromLTRB(0, 10, 0, 10), ),
//                                                             style: TextStyle(
//                                                               fontFamily: 'Tahoma',
//                                                               fontSize: 50, ),
//                                                               textAlign: TextAlign.center,),),),
//                                                               Padding(
//                                                                 padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
//                                                                 child: FFButtonWidget(
//                                                                   onPressed: () { print('Button pressed ...'); }
//                                                                 ,text: 'Verify and continue',
//                                                                 options: FFButtonOptions(
//                                                                   width: 400,
//                                                                   height: 50,
//                                                                   color: Color(0xFFFF7900),
//                                                                   textStyle: FlutterFlowTheme.title3.override(
//                                                                     fontFamily: 'Tahoma',
//                                                                     color: Colors.white, ),
//                                                                     borderSide: BorderSide(
//                                                                       color: Colors.transparent,
//                                                                       width: 1, ),
//                                                                       borderRadius: 12, ), ), ),
//                                                                       Padding(
//                                                                         padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
//                                                                         child: Row(
//                                                                           mainAxisSize: MainAxisSize.max,
//                                                                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                                           children: [
//                                                                             FFButtonWidget(
//                                                                               onPressed: () { print('Button pressed ...'); },
//                                                                               text: '1',
//                                                                               options: FFButtonOptions(
//                                                                                 width: 80,
//                                                                                 height: 80,
//                                                                                 color: Color(0xFFC0C0C0),
//                                                                                 textStyle: FlutterFlowTheme.title1.override(
//                                                                                    fontFamily: 'Tahoma',
//                                                                                    color: Color(0xFF61657F),
//                                                                                    fontSize: 38, ),
//                                                                                    borderSide: BorderSide(
//                                                                                      color: Colors.transparent,
//                                                                                      width: 1, )
//                                                                                      , borderRadius: 12,
//                                                                                      ),
//                                                                                      ),
//                                                                                      FFButtonWidget(
//                                                                                        onPressed: () { print('Button pressed ...'); },
//                                                                                        text: '2',
//                                                                                        options: FFButtonOptions(
//                                                                                          width: 80,
//                                                                                          height: 80,
//                                                                                          color: Color(0xFFC0C0C0),
//                                                                                          textStyle: FlutterFlowTheme.title1.override(
//                                                                                            fontFamily: 'Tahoma',
//                                                                                            color: Color(0xFF61657F),
//                                                                                            fontSize: 38, ),
//                                                                                            borderSide: BorderSide(
//                                                                                              color: Colors.transparent,
//                                                                                              width: 1, ),
//                                                                                              borderRadius: 12,
//                                                                                              ), ),
//                                                                                              FFButtonWidget(
//                                                                                                onPressed: () { print('Button pressed ...');},
//                                                                                                text: '3',
//                                                                                                options: FFButtonOptions(
//                                                                                                  width: 80,
//                                                                                                  height: 80,
//                                                                                                  color: Color(0xFFC0C0C0),
//                                                                                                  textStyle: TextStyle(
//                                                                                                    fontFamily: 'Tahoma',
//                                                                                                    color: Color(0xFF61657F),
//                                                                                                    fontSize: 38, ),
//                                                                                                    borderSide: BorderSide(
//                                                                                                      color: Colors.transparent,
//                                                                                                      width: 1, ),
//                                                                                                      borderRadius: 12,
//                                                                                                 )
//                                                                                                ),
//                                                                                                     Padding(
//                                                                                                       padding:  EdgeInsets.fromLTRB(0, 30, 0, 0),
//                                                                                                       child: Row(
//                                                                                                         mainAxisSize: MainAxisSize.max,
//                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                                                                                          children: [
//                                                                                                            FFButtonWidget(
//                                                                                                              onPressed: () { print('Button pressed ...'); },
//                                                                                                              text: '5',
//                                                                                                              options: FFButtonOptions(
//                                                                                                                width: 80,
//                                                                                                                height: 80,
//                                                                                                                color: Color(0xFFC0C0C0),
//                                                                                                                textStyle: FlutterFlowTheme.title1.override(
//                                                                                                                  fontFamily: 'Tahoma',
//                                                                                                                  color: Color(0xFF61657F),
//                                                                                                                  fontSize: 38, ),
//                                                                                                                  borderSide: BorderSide(
//                                                                                                                    color: Colors.transparent,
//                                                                                                                    width: 1, ),
//                                                                                                                    borderRadius: 12, ), ),
//                                                                                                                    FFButtonWidget(
//                                                                                                                      onPressed: () { print("Button pressed ..."); },
//                                                                                                                      text: '6',
//                                                                                                                      options: FFButtonOptions(
//                                                                                                                        width: 80,
//                                                                                                                        height: 80,
//                                                                                                                        color: Color(0xFFC0C0C0),
//                                                                                                                        textStyle: FlutterFlowTheme.title1.override(
//                                                                                                                          fontFamily: 'Tahoma',
//                                                                                                                          color: Color(0xFF61657F),
//                                                                                                                          fontSize: 38, ),
//                                                                                                                          borderSide: BorderSide(
//                                                                                                                            color: Colors.transparent, width: 1,
//
// ),borderRadius: 12, ), ),
// FFButtonWidget(
//   onPressed: () {print("Button pressed ... 1");},
//    text: '7',
//    options: FFButtonOptions(
//      width: 80,
//      height: 80,
//      color: Color(0xFFC0C0C0),
//      textStyle: TextStyle(
//         fontFamily: 'Tahoma',
//         color: Color(0xFF61657F),
//         fontSize: 38, ),
//         borderSide: BorderSide(
//           color: Colors.transparent,
//           width: 1, ), borderRadius: 12,
// ), ), ], ), ),Padding(
//   padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
//   child: Row(
//     mainAxisSize: MainAxisSize.max,
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       FFButtonWidget(
//         onPressed:() { print('Button pressed ...');} ,
//         text: '7',
//      options: FFButtonOptions(
//        width: 80,
//        height: 80,
//        color: Color(0xFFC0C0C0),
//        textStyle: TextStyle(
//          fontFamily: 'Tahoma', color: Color(0xFF61657F),
//
// fontSize: 38, ), borderSide: BorderSide( color: Colors.transparent, width: 1, ), borderRadius: 12,
// ) ,
// ), FFButtonWidget( onPressed: () { print('Button pressed ...');}, text: '8', options: FFButtonOptions(
//   width: 80, height: 80, color: Color(0xFFC0C0C0), textStyle: TextStyle(
//     fontFamily: 'Tahoma', color: Color(0xFF61657F), fontSize: 38, ), borderSide: BorderSide(
//       color: Colors.transparent, width: 1, ), borderRadius: 12, ), ), FFButtonWidget( onPressed: () { print('Button pressed ...'); },text: '9',
//       options: FFButtonOptions(
//         width: 80,
//         height: 80,
//         color: Color(0xFFC0C0C0),
//         textStyle: TextStyle(
//           fontFamily: 'Tahoma',
//           color: Color(0xFF61657F),
//           fontSize: 38, ),
//           borderSide: BorderSide( color: Colors.transparent, width: 1, ),
//
// borderRadius: 12,
// ), ), ], ),), Padding(
//   padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
//   child: Row(
//     mainAxisSize: MainAxisSize.max,
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [ Padding(
//       padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
//       child: FFButtonWidget( onPressed: () {print('Button pressed ...'); },
//       text: '0',
//       options: FFButtonOptions(
//         width: 80,
//         height: 80,
//         color: Color(0xFFC0C0C0),
//         textStyle:TextStyle(
//           fontFamily: 'Tahoma',
//           color: Color(0xFF61657F),
//           fontSize: 38, ),
//           borderSide: BorderSide(
//             color: Colors.transparent, width: 1, ),
//             borderRadius: 12, ), ), ), FFButtonWidget(
//               onPressed: () { print('Button pressed ...'); }, text:"" ,
//               icon: Icon( Icons.backspace_outlined, size: 40, ), options: FFButtonOptions( onPressed: () {
//                 print("button pressed");
//               },
//               text : "",
//               icon : Icon(
//                 Icons.backspace_outlined,
//                 size: 40
//               ),
//               options: FFButtonOptions(
//                 width: 200,
//                 height: 80,
//                 color: Color(0xFFC0C0C0)
//               ),
//               textStyle: TextStyle(
//                 fontFamily: 'Tahoma',
//                 color: Color(0xFF61657F),
//                 fontSize: 38
//               ),
//
//               BorderSide: BorderSide(
//                 color: Colors.transparent
//                 ,width: 1
//               ),
//               borderRadius: 12),),],),),],),),),),),],),),),],),),),),);}}
//
