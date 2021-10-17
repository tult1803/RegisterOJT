// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
// class ViewCV extends StatefulWidget {
//   final cv;
//
//   ViewCV({required this.cv});
//
//   @override
//   _ViewCVState createState() => _ViewCVState();
// }
//
// class _ViewCVState extends State<ViewCV> {
//   final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('View CV'),
//        centerTitle: true,
//       ),
//       body: SfPdfViewer.memory(
//         widget.cv,
//         key: _pdfViewerKey,
//       ),
//     );
//   }
// }
