import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class TrackController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  User? user;
  DocumentSnapshot? userDoc;

  RxBool isOrder = false.obs;

  RxString trackDate = ''.obs;

  @override
  void onInit() async {
    await initializeDateFormatting('id_ID', null);
    trackDate.value = formatDate(DateTime.now().add(const Duration(days: 2)));
    user = auth.currentUser;
    userDoc = await firestore.collection('users').doc(user?.uid).get();
    isOrder.value = userDoc?['order'];
    super.onInit();
  }

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('EEEE, d MMMM y', 'id_ID');
    return formatter.format(date);
  }
}