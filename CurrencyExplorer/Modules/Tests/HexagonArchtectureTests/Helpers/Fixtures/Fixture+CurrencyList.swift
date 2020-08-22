import Foundation

extension Fixture {
    struct CurrencyList {
        static let data = CurrencyList.json.data(using: .utf8) ?? Data(capacity: 0)
        static let json = #"""

            {
              "success":true,
              "terms":"https:\/\/currencylayer.com\/terms",
              "privacy":"https:\/\/currencylayer.com\/privacy",
              "currencies":{
                "BRL":"Brazilian Real",
                "BSD":"Bahamian Dollar",
                "JPY":"Japanese Yen",
                "USD":"United States Dollar",
              }
            }

        """#
    }
}
