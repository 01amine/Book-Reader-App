import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meduim_challenge/provider/ref.dart';


final myNotifierProvider = StateNotifierProvider<MyRef, MyState>((ref) {
  return MyRef();
});
