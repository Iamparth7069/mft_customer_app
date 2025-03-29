class Wallet {
  String? productId;
  String? drCash;
  String? crCash;
  String? runningBalance;
  String? transaction;
  String? dateAdded;

  Wallet({
    this.productId,
    this.drCash,
    this.crCash,
    this.runningBalance,
    this.transaction,
    this.dateAdded,
  });

  Wallet.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    drCash = json['dr_cash'];
    crCash = json['cr_cash'];
    runningBalance = json['running_balance'];
    transaction = json['transaction'];
    dateAdded = json['date_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['dr_cash'] = drCash;
    data['cr_cash'] = crCash;
    data['running_balance'] = runningBalance;
    data['transaction'] = transaction;
    data['date_added'] = dateAdded;
    return data;
  }
}
