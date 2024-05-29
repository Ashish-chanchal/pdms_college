import 'package:pdms/consts/consts.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';


class PDFScreen extends StatefulWidget {
  final String url;

  const PDFScreen({super.key,required this.url});

  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  bool _isLoading = true;
  PDFDocument? _document;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  Future<void> loadDocument() async {
    try {
     
      final document = await PDFDocument.fromURL(widget.url);
      setState(() {
        _document = document;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading PDF: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: AppStyles.normal(
              title: "View Prescription",
              size: AppSize.size22,
              color: AppColors.whiteColor),
        ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _document == null
              ? const Center(child: Text('Error loading PDF'))
              : PDFViewer(document: _document!),
    );
  }
}