import 'package:exam_e_com_app/utils/Global.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDF extends StatefulWidget {
  const PDF({super.key});

  @override
  State<PDF> createState() => _PDFState();
}

class _PDFState extends State<PDF> {
  final pdf = pw.Document();
  void initState() {
    // TODO: implement initState
    super.initState();
    PDF();
  }

  PDF() async {
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            children: [
              pw.Container(
                alignment: pw.Alignment.center,
                //  padding: const pw.EdgeInsets.only(top: 20, left: 30),
                color: PdfColors.white,
                height: 70,
                width: 500,
                child: pw.Text(
                  "INVOICE",
                  style: pw.TextStyle(
                    fontSize: 30,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.black,
                  ),
                ),
              ),
              pw.Container(
                height: 500,
                width: 500,
                margin: const pw.EdgeInsets.only(),
                decoration: pw.BoxDecoration(),
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Divider(),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          "Invoice to: ",
                          style: pw.TextStyle(
                            wordSpacing: 1,
                            fontWeight: pw.FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        pw.Text(
                          "TOTAL Due:",
                          style: pw.TextStyle(
                            wordSpacing: 1,
                            fontWeight: pw.FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 30),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          "Archi Radadiya",
                          style: pw.TextStyle(
                            wordSpacing: 1,
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        pw.Text(
                          "\$ 0.0",
                          style: pw.TextStyle(
                            wordSpacing: 1,
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 17),
                    pw.Row(
                      children: [
                        pw.Expanded(
                          flex: 3,
                          child: pw.Container(
                            padding: pw.EdgeInsets.only(
                                top: 20, left: 10, bottom: 10),
                            color: PdfColors.black,
                            child: pw.Text(
                              "Products ",
                              style: pw.TextStyle(
                                wordSpacing: 1,
                                color: PdfColors.white,
                                fontWeight: pw.FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Container(
                            color: PdfColors.black,
                            padding: pw.EdgeInsets.only(
                                top: 20, left: 10, bottom: 10),
                            child: pw.Text(
                              "Qty ",
                              style: pw.TextStyle(
                                wordSpacing: 1,
                                color: PdfColors.white,
                                fontWeight: pw.FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Container(
                            color: PdfColors.black,
                            padding: pw.EdgeInsets.only(
                                top: 20, left: 10, bottom: 10),
                            child: pw.Text(
                              "Price ",
                              style: pw.TextStyle(
                                wordSpacing: 1,
                                color: PdfColors.white,
                                fontWeight: pw.FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        pw.Expanded(
                          flex: 1,
                          child: pw.Container(
                            alignment: pw.Alignment.bottomRight,
                            color: PdfColors.black,
                            padding: pw.EdgeInsets.only(
                                top: 20, left: 10, bottom: 10),
                            child: pw.Text(
                              "Total ",
                              style: pw.TextStyle(
                                wordSpacing: 1,
                                color: PdfColors.white,
                                fontWeight: pw.FontWeight.normal,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 11),
                    pw.Divider(),
                    ...global.cartProducts.map((e) {
                      return pw.Row(
                        children: [
                          pw.Expanded(
                            flex: 3,
                            child: pw.Container(
                              color: PdfColors.white,
                              child: pw.Text(
                                "${e['title']}",
                                style: pw.TextStyle(
                                  wordSpacing: 1,
                                  color: PdfColors.black,
                                  fontWeight: pw.FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Container(
                              color: PdfColors.white,
                              child: pw.Text(
                                "1",
                                style: pw.TextStyle(
                                  wordSpacing: 1,
                                  color: PdfColors.black,
                                  fontWeight: pw.FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Container(
                              color: PdfColors.white,
                              child: pw.Text(
                                "\$ ${e['price']}",
                                style: pw.TextStyle(
                                  wordSpacing: 1,
                                  color: PdfColors.black,
                                  fontWeight: pw.FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          pw.Expanded(
                            flex: 1,
                            child: pw.Container(
                              alignment: pw.Alignment.bottomRight,
                              color: PdfColors.white,
                              child: pw.Text(
                                "${e['price'] * e['qty']} ",
                                style: pw.TextStyle(
                                  wordSpacing: 1,
                                  color: PdfColors.black,
                                  fontWeight: pw.FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                    pw.Divider(),
                    pw.SizedBox(height: 100),
                    pw.Divider(),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      children: [
                        pw.Container(
                          child: pw.Text("Total:${global.totalPrice}"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (context) => pdf.save(),
      ),
    );
  }
}
