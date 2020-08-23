import Foundation

extension Fixture {

    struct Quotes {
        static let data = Quotes.json.data(using: .utf8) ?? Data(capacity: 0)
        static let json = #"""

            {
              "success":true,
              "terms":"https:\/\/currencylayer.com\/terms",
              "privacy":"https:\/\/currencylayer.com\/privacy",
              "timestamp":1598114285,
              "source":"USD",
              "quotes":{
                "USDAED":3.67294,
                "USDBRL":5.620075,
                "USDBSD":1.000504,
              }
            }

        """#
    }
}





