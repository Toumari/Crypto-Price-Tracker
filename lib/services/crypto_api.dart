// To parse this JSON data, do
//
//     final bitcoinTracker = bitcoinTrackerFromJson(jsonString);

import 'dart:convert';

List<BitcoinTracker> bitcoinTrackerFromJson(String str) =>
    List<BitcoinTracker>.from(
        json.decode(str).map((x) => BitcoinTracker.fromJson(x)));

String bitcoinTrackerToJson(List<BitcoinTracker> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BitcoinTracker {
  BitcoinTracker({
    required this.symbol,
    required this.priceChange,
    required this.priceChangePercent,
    required this.weightedAvgPrice,
    required this.prevClosePrice,
    required this.lastPrice,
    required this.lastQty,
    required this.bidPrice,
    required this.bidQty,
    required this.askPrice,
    required this.askQty,
    required this.openPrice,
    required this.highPrice,
    required this.lowPrice,
    required this.volume,
    required this.quoteVolume,
    required this.openTime,
    required this.closeTime,
    required this.firstId,
    required this.lastId,
    required this.count,
  });

  String symbol;
  String priceChange;
  String priceChangePercent;
  String weightedAvgPrice;
  String prevClosePrice;
  String lastPrice;
  String lastQty;
  String bidPrice;
  String bidQty;
  String askPrice;
  String askQty;
  String openPrice;
  String highPrice;
  String lowPrice;
  String volume;
  String quoteVolume;
  int openTime;
  int closeTime;
  int firstId;
  int lastId;
  int count;

  factory BitcoinTracker.fromJson(Map<String, dynamic> json) => BitcoinTracker(
        symbol: json["symbol"],
        priceChange: json["priceChange"],
        priceChangePercent: json["priceChangePercent"],
        weightedAvgPrice: json["weightedAvgPrice"],
        prevClosePrice: json["prevClosePrice"],
        lastPrice: json["lastPrice"],
        lastQty: json["lastQty"],
        bidPrice: json["bidPrice"],
        bidQty: json["bidQty"],
        askPrice: json["askPrice"],
        askQty: json["askQty"],
        openPrice: json["openPrice"],
        highPrice: json["highPrice"],
        lowPrice: json["lowPrice"],
        volume: json["volume"],
        quoteVolume: json["quoteVolume"],
        openTime: json["openTime"],
        closeTime: json["closeTime"],
        firstId: json["firstId"],
        lastId: json["lastId"],
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "symbol": symbol,
        "priceChange": priceChange,
        "priceChangePercent": priceChangePercent,
        "weightedAvgPrice": weightedAvgPrice,
        "prevClosePrice": prevClosePrice,
        "lastPrice": lastPrice,
        "lastQty": lastQty,
        "bidPrice": bidPrice,
        "bidQty": bidQty,
        "askPrice": askPrice,
        "askQty": askQty,
        "openPrice": openPrice,
        "highPrice": highPrice,
        "lowPrice": lowPrice,
        "volume": volume,
        "quoteVolume": quoteVolume,
        "openTime": openTime,
        "closeTime": closeTime,
        "firstId": firstId,
        "lastId": lastId,
        "count": count,
      };
}
