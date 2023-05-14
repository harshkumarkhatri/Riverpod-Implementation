import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo_app/model/coin.dart';
import 'package:riverpod_demo_app/request/network_request.dart';

final coinStateFuture = FutureProvider.family<Map<String, Coin>, String>(
  (ref, params) async {
    final data = await getCoinData(params);
    return data;
  },
);
