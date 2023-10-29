import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  void toastMessae(String message) {
    Fluttertoast.showToast(
      msg: message == "" ? "Successfully fetched data." : message,
      toastLength: Toast.LENGTH_LONG,
      fontSize: 18.0,
    );
  }
}
