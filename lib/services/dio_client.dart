import 'package:dio/dio.dart';
import 'crypto_api.dart';

class DioClient {
  final Dio _dio = Dio();

  final _newsUrl = "https://api2.binance.com/api/v3/ticker/24hr";

  Future<List<String>> getBitCoinValue() async {
    try {
      Response response = await _dio.get(_newsUrl);

      var returned = <String>[];
      for (int i = 0; i <= 200; i++) {
        BitcoinTracker bitcoinFact = BitcoinTracker.fromJson(response.data[i]);

        String symbol = bitcoinFact.symbol;
        String askPrice = bitcoinFact.askPrice;

        returned.add("${bitcoinFact.symbol} : ${bitcoinFact.askPrice}");
      }
      ;
      return returned;
    } on DioError catch (e) {
      print(e);
      return [];
    }
  }
}
