import SwiftUI
import Foundation


//"Message": "Success",
//"Type": 100,
//"MetaData": {
//    "Count": 4239
//},
// MARK: - CoinCommonModel
public struct CoinCommonModel: Codable {
    
    public let message: String?
    public let type: Int?
    public let metaData: MetaData?
//  public   //let sponsoredData: []?
    public let data: [Datum]?
//    let rateLimit: RateLimit?
//    let hasWarning: Bool?

    public enum CodingKeys: String, CodingKey {
        case message = "Message"
        case type = "Type"
        case metaData = "MetaData"
//        //case sponsoredData = "SponsoredData"
        case data = "Data"
//        case rateLimit = "RateLimit"
//        case hasWarning = "HasWarning"
    }
    
    public init(message: String, type: Int, metaData: MetaData, data:[Datum]) {
        self.message = message
        self.type = type
        self.metaData = metaData
        self.data = data
    }
}

// MARK: - Datum
public struct Datum: Codable {
    public let coinInfo: CoinInfo?
    public let raw: Raw?
    public let display: Display?

    public enum CodingKeys: String, CodingKey {
        case coinInfo = "CoinInfo"
        case raw = "RAW"
        case display = "DISPLAY"
    }
}


//            "CoinInfo": {
//                "Id": "1182",
//                "Name": "BTC",
//                "FullName": "Bitcoin",
//                "Internal": "BTC",
//                "ImageUrl": "/media/37746251/btc.png",
//                "Url": "/coins/btc/overview",
//                "Algorithm": "SHA-256",
//                "ProofType": "PoW",
//                "Rating": {
//                    "Weiss": {
//                        "Rating": "B+",
//                        "TechnologyAdoptionRating": "A-",
//                        "MarketPerformanceRating": "D"
//                    }
//                },
//                "NetHashesPerSecond": 701959672354179900000,
//                "BlockNumber": 876157,
//                "BlockTime": 1245,
//                "BlockReward": 3.125,
//                "AssetLaunchDate": "2009-01-03",
//                "MaxSupply": 20999999.9769,
//                "Type": 1,
//                "DocumentType": "Webpagecoinp"
//            }
// MARK: - CoinInfo
public struct CoinInfo: Codable {
    public let id : String?
    public let name : String?
    public let fullName : String?
    public let coinInfoInternal: String?
    public let imageURL : String?
    public let url : String?
    public let algorithm : String?
    public let proofType: String?
    public let rating: Rating?
    public let netHashesPerSecond: Double?
    public let blockNumber : Int?
    public let blockTime: Double?
    public let blockReward: Double?
    public let assetLaunchDate: String?
    public let maxSupply: Double?
    public let type: Int?
    public let documentType: String?

    public enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case fullName = "FullName"
        case coinInfoInternal = "Internal"
        case imageURL = "ImageUrl"
        case url = "Url"
        case algorithm = "Algorithm"
        case proofType = "ProofType"
        case rating = "Rating"
        case netHashesPerSecond = "NetHashesPerSecond"
        case blockNumber = "BlockNumber"
        case blockTime = "BlockTime"
        case blockReward = "BlockReward"
        case assetLaunchDate = "AssetLaunchDate"
        case maxSupply = "MaxSupply"
        case type = "Type"
        case documentType = "DocumentType"
    }
}

// MARK: - Rating
public struct Rating: Codable {
    public let weiss: Weiss?

    public enum CodingKeys: String, CodingKey {
        case weiss = "Weiss"
    }
}

//"Weiss": {
//  "Rating": "B+",
//  "TechnologyAdoptionRating": "A-",
//  "MarketPerformanceRating": "D"
//                   }
// MARK: - Weiss
public struct Weiss: Codable {
    public let rating : String?
    public let technologyAdoptionRating : String?
    public let marketPerformanceRating: String?

    public enum CodingKeys: String, CodingKey {
        case rating = "Rating"
        case technologyAdoptionRating = "TechnologyAdoptionRating"
        case marketPerformanceRating = "MarketPerformanceRating"
    }
}

// MARK: - Display
public struct Display: Codable {
    public let usd: DisplayUsd?

    public enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}

// MARK: - DisplayUsd
public struct DisplayUsd: Codable {
    public let fromsymbol: String?
    public let tosymbol: String?
    public let market : String?
    public let lastmarket: String?
    public let toptiervolume24Hour: String?
    public let toptiervolume24Hourto: String?
    public let lasttradeid: String?
    public let price: String?
    public let lastupdate : String?
    public let lastvolume: String?
    public let lastvolumeto: String?
    public let volumehour: String?
    public let volumehourto: String?
    public let openhour: String?
    public let highhour: String?
    public let lowhour: String?
    public let volumeday: String?
    public let volumedayto: String?
    public let openday: String?
    public let highday: String?
    public let lowday: String?
    public let volume24Hour: String?
    public let volume24Hourto: String?
    public let open24Hour: String?
    public let high24Hour: String?
    public let low24Hour: String?
    public let change24Hour: String?
    public let changepct24Hour: String?
    public let changeday: String?
    public let changepctday: String?
    public let changehour: String?
    public let changepcthour: String?
    public let conversiontype: String?
    public let conversionsymbol: String?
    public let conversionlastupdate: String?
    public let supply: String?
    public let mktcap: String?
    public let mktcappenalty: String?
    public let circulatingsupply: String?
    public let circulatingsupplymktcap: String?
    public let totalvolume24H: String?
    public let totalvolume24Hto: String?
    public let totaltoptiervolume24H: String?
    public let totaltoptiervolume24Hto: String?
    public let imageurl: String?

    public enum CodingKeys: String, CodingKey {
        case fromsymbol = "FROMSYMBOL"
        case tosymbol = "TOSYMBOL"
        case market = "MARKET"
        case lastmarket = "LASTMARKET"
        case toptiervolume24Hour = "TOPTIERVOLUME24HOUR"
        case toptiervolume24Hourto = "TOPTIERVOLUME24HOURTO"
        case lasttradeid = "LASTTRADEID"
        case price = "PRICE"
        case lastupdate = "LASTUPDATE"
        case lastvolume = "LASTVOLUME"
        case lastvolumeto = "LASTVOLUMETO"
        case volumehour = "VOLUMEHOUR"
        case volumehourto = "VOLUMEHOURTO"
        case openhour = "OPENHOUR"
        case highhour = "HIGHHOUR"
        case lowhour = "LOWHOUR"
        case volumeday = "VOLUMEDAY"
        case volumedayto = "VOLUMEDAYTO"
        case openday = "OPENDAY"
        case highday = "HIGHDAY"
        case lowday = "LOWDAY"
        case volume24Hour = "VOLUME24HOUR"
        case volume24Hourto = "VOLUME24HOURTO"
        case open24Hour = "OPEN24HOUR"
        case high24Hour = "HIGH24HOUR"
        case low24Hour = "LOW24HOUR"
        case change24Hour = "CHANGE24HOUR"
        case changepct24Hour = "CHANGEPCT24HOUR"
        case changeday = "CHANGEDAY"
        case changepctday = "CHANGEPCTDAY"
        case changehour = "CHANGEHOUR"
        case changepcthour = "CHANGEPCTHOUR"
        case conversiontype = "CONVERSIONTYPE"
        case conversionsymbol = "CONVERSIONSYMBOL"
        case conversionlastupdate = "CONVERSIONLASTUPDATE"
        case supply = "SUPPLY"
        case mktcap = "MKTCAP"
        case mktcappenalty = "MKTCAPPENALTY"
        case circulatingsupply = "CIRCULATINGSUPPLY"
        case circulatingsupplymktcap = "CIRCULATINGSUPPLYMKTCAP"
        case totalvolume24H = "TOTALVOLUME24H"
        case totalvolume24Hto = "TOTALVOLUME24HTO"
        case totaltoptiervolume24H = "TOTALTOPTIERVOLUME24H"
        case totaltoptiervolume24Hto = "TOTALTOPTIERVOLUME24HTO"
        case imageurl = "IMAGEURL"
    }
}
// MARK: - Raw
public struct Raw: Codable {
    public let usd: RawUsd?

    public enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}
// MARK: - RawUsd
public struct RawUsd: Codable {
    public let type: String?
    public let market: String?
    public let fromsymbol: String?
    public let tosymbol: String?
    public let flags: String?
    public let lastmarket: String?
    public let median: Double?
    public let toptiervolume24Hour: Double?
    public let toptiervolume24Hourto: Double?
    public let lasttradeid: String?
    public let price: Double?
    public let lastupdate: Double?
    public let lastvolume: Double?
    public let lastvolumeto: Double?
    public let volumehour: Double?
    public let volumehourto: Double?
    public let openhour: Double?
    public let highhour: Double?
    public let lowhour: Double?
    public let volumeday: Double?
    public let volumedayto: Double?
    public let openday: Double?
    public let highday: Double?
    public let lowday: Double?
    public let volume24Hour : Double?
    public let volume24Hourto: Double?
    public let open24Hour: Double?
    public let high24Hour: Double?
    public let low24Hour: Double?
    public let change24Hour: Double?
    public let changepct24Hour: Double?
    public let changeday: Double?
    public let changepctday: Double?
    public let changehour: Double?
    public let changepcthour: Double?
    public let conversiontype: String?
    public let conversionsymbol: String?
    public let conversionlastupdate: Double?
    public let supply: Double?
    public let mktcap: Double?
    public let mktcappenalty: Double?
    public let circulatingsupply: Double?
    public let circulatingsupplymktcap: Double?
    public let totalvolume24H: Double?
    public let totalvolume24Hto: Double?
    public let totaltoptiervolume24H: Double?
    public let totaltoptiervolume24Hto: Double?
    public let imageurl: String?

    enum CodingKeys: String, CodingKey {
        case type = "TYPE"
        case market = "MARKET"
        case fromsymbol = "FROMSYMBOL"
        case tosymbol = "TOSYMBOL"
        case flags = "FLAGS"
        case lastmarket = "LASTMARKET"
        case median = "MEDIAN"
        case toptiervolume24Hour = "TOPTIERVOLUME24HOUR"
        case toptiervolume24Hourto = "TOPTIERVOLUME24HOURTO"
        case lasttradeid = "LASTTRADEID"
        case price = "PRICE"
        case lastupdate = "LASTUPDATE"
        case lastvolume = "LASTVOLUME"
        case lastvolumeto = "LASTVOLUMETO"
        case volumehour = "VOLUMEHOUR"
        case volumehourto = "VOLUMEHOURTO"
        case openhour = "OPENHOUR"
        case highhour = "HIGHHOUR"
        case lowhour = "LOWHOUR"
        case volumeday = "VOLUMEDAY"
        case volumedayto = "VOLUMEDAYTO"
        case openday = "OPENDAY"
        case highday = "HIGHDAY"
        case lowday = "LOWDAY"
        case volume24Hour = "VOLUME24HOUR"
        case volume24Hourto = "VOLUME24HOURTO"
        case open24Hour = "OPEN24HOUR"
        case high24Hour = "HIGH24HOUR"
        case low24Hour = "LOW24HOUR"
        case change24Hour = "CHANGE24HOUR"
        case changepct24Hour = "CHANGEPCT24HOUR"
        case changeday = "CHANGEDAY"
        case changepctday = "CHANGEPCTDAY"
        case changehour = "CHANGEHOUR"
        case changepcthour = "CHANGEPCTHOUR"
        case conversiontype = "CONVERSIONTYPE"
        case conversionsymbol = "CONVERSIONSYMBOL"
        case conversionlastupdate = "CONVERSIONLASTUPDATE"
        case supply = "SUPPLY"
        case mktcap = "MKTCAP"
        case mktcappenalty = "MKTCAPPENALTY"
        case circulatingsupply = "CIRCULATINGSUPPLY"
        case circulatingsupplymktcap = "CIRCULATINGSUPPLYMKTCAP"
        case totalvolume24H = "TOTALVOLUME24H"
        case totalvolume24Hto = "TOTALVOLUME24HTO"
        case totaltoptiervolume24H = "TOTALTOPTIERVOLUME24H"
        case totaltoptiervolume24Hto = "TOTALTOPTIERVOLUME24HTO"
        case imageurl = "IMAGEURL"
    }
}
// MARK: - MetaData
public struct MetaData: Codable, Equatable {
    public let count: Int?

    public enum CodingKeys: String, CodingKey {
        case count = "Count"
    }
}

// MARK: - RateLimit
public struct RateLimit: Codable, Equatable {
    
}


public struct CoinListModel: Codable {
    public let response, message: String?
    public let hasWarning: Bool?
    public let type: Int?
    //let rateLimit: RateLimit?
    public let data: [String: ListDetail]?

    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case message = "Message"
        case hasWarning = "HasWarning"
        case type = "Type"
        //case rateLimit = "RateLimit"
        case data = "Data"
    }
}

// MARK: - Datum
public struct ListDetail: Codable, Equatable {
    public let id: Int?
    public let symbol, partnerSymbol: String?
    public let dataAvailableFrom: Int?

    enum CodingKeys: String, CodingKey {
        case id, symbol
        case partnerSymbol = "partner_symbol"
        case dataAvailableFrom = "data_available_from"
    }
}

//{
//
//    "Data": [
//        {
//            "CoinInfo": {
//                "Id": "1182",
//                "Name": "BTC",
//                "FullName": "Bitcoin",
//                "Internal": "BTC",
//                "ImageUrl": "/media/37746251/btc.png",
//                "Url": "/coins/btc/overview",
//                "Algorithm": "SHA-256",
//                "ProofType": "PoW",
//                "Rating": {
//                    "Weiss": {
//                        "Rating": "B+",
//                        "TechnologyAdoptionRating": "A-",
//                        "MarketPerformanceRating": "D"
//                    }
//                },
//                "NetHashesPerSecond": 701959672354179900000,
//                "BlockNumber": 876157,
//                "BlockTime": 1245,
//                "BlockReward": 3.125,
//                "AssetLaunchDate": "2009-01-03",
//                "MaxSupply": 20999999.9769,
//                "Type": 1,
//                "DocumentType": "Webpagecoinp"
//            },
//            "RAW": {
//                "USD": {
//                    "TYPE": "5",
//                    "MARKET": "CCCAGG",
//                    "FROMSYMBOL": "BTC",
//                    "TOSYMBOL": "USD",
//                    "FLAGS": "1",
//                    "LASTMARKET": "CCCAGG",
//                    "MEDIAN": 94160.0267251152,
//                    "TOPTIERVOLUME24HOUR": 50913.05319547,
//                    "TOPTIERVOLUME24HOURTO": 4776638577.1317,
//                    "LASTTRADEID": "569252191",
//                    "PRICE": 94160.0267251152,
//                    "LASTUPDATE": 1735041091,
//                    "LASTVOLUME": 0.00023571,
//                    "LASTVOLUMETO": 22.1958466461,
//                    "VOLUMEHOUR": 344.13494135,
//                    "VOLUMEHOURTO": 32356990.215678,
//                    "OPENHOUR": 93832.0756938231,
//                    "HIGHHOUR": 94235.7240272446,
//                    "LOWHOUR": 93788.2871404222,
//                    "VOLUMEDAY": 9200.92228357,
//                    "VOLUMEDAYTO": 865852488.601993,
//                    "OPENDAY": 94771.6430776351,
//                    "HIGHDAY": 94772.9984286737,
//                    "LOWDAY": 93437.90208693,
//                    "VOLUME24HOUR": 50913.05319547,
//                    "VOLUME24HOURTO": 4776638577.1317,
//                    "OPEN24HOUR": 95825.074863517,
//                    "HIGH24HOUR": 96307.7781181672,
//                    "LOW24HOUR": 92378.5257556643,
//                    "CHANGE24HOUR": -1665.0481384018058,
//                    "CHANGEPCT24HOUR": -1.7375912732375345,
//                    "CHANGEDAY": -611.6163525199081,
//                    "CHANGEPCTDAY": -0.6453579706525545,
//                    "CHANGEHOUR": 327.9510312920902,
//                    "CHANGEPCTHOUR": 0.34950844779583085,
//                    "CONVERSIONTYPE": "direct",
//                    "CONVERSIONSYMBOL": "",
//                    "CONVERSIONLASTUPDATE": 1735041091,
//                    "SUPPLY": 19800475,
//                    "MKTCAP": 1864413255169.9753,
//                    "MKTCAPPENALTY": 0,
//                    "CIRCULATINGSUPPLY": 19800475,
//                    "CIRCULATINGSUPPLYMKTCAP": 1864413255169.9753,
//                    "TOTALVOLUME24H": 367564.579407163,
//                    "TOTALVOLUME24HTO": 34592554747.77323,
//                    "TOTALTOPTIERVOLUME24H": 208833.804798161,
//                    "TOTALTOPTIERVOLUME24HTO": 19646460768.491364,
//                    "IMAGEURL": "/media/37746251/btc.png"
//                }
//            },
//            "DISPLAY": {
//                "USD": {
//                    "FROMSYMBOL": "Ƀ",
//                    "TOSYMBOL": "$",
//                    "MARKET": "CryptoCompare Index",
//                    "LASTMARKET": "CCCAGG",
//                    "TOPTIERVOLUME24HOUR": "Ƀ 50,913.1",
//                    "TOPTIERVOLUME24HOURTO": "$ 4,776,638,577.1",
//                    "LASTTRADEID": "569252191",
//                    "PRICE": "$ 94,160.0",
//                    "LASTUPDATE": "Just now",
//                    "LASTVOLUME": "Ƀ 0.0002357",
//                    "LASTVOLUMETO": "$ 22.20",
//                    "VOLUMEHOUR": "Ƀ 344.13",
//                    "VOLUMEHOURTO": "$ 32,356,990.2",
//                    "OPENHOUR": "$ 93,832.1",
//                    "HIGHHOUR": "$ 94,235.7",
//                    "LOWHOUR": "$ 93,788.3",
//                    "VOLUMEDAY": "Ƀ 9,200.92",
//                    "VOLUMEDAYTO": "$ 865,852,488.6",
//                    "OPENDAY": "$ 94,771.6",
//                    "HIGHDAY": "$ 94,773.0",
//                    "LOWDAY": "$ 93,437.9",
//                    "VOLUME24HOUR": "Ƀ 50,913.1",
//                    "VOLUME24HOURTO": "$ 4,776,638,577.1",
//                    "OPEN24HOUR": "$ 95,825.1",
//                    "HIGH24HOUR": "$ 96,307.8",
//                    "LOW24HOUR": "$ 92,378.5",
//                    "CHANGE24HOUR": "$ -1,665.05",
//                    "CHANGEPCT24HOUR": "-1.74",
//                    "CHANGEDAY": "$ -611.62",
//                    "CHANGEPCTDAY": "-0.65",
//                    "CHANGEHOUR": "$ 327.95",
//                    "CHANGEPCTHOUR": "0.35",
//                    "CONVERSIONTYPE": "direct",
//                    "CONVERSIONSYMBOL": "",
//                    "CONVERSIONLASTUPDATE": "Just now",
//                    "SUPPLY": "Ƀ 19,800,475.0",
//                    "MKTCAP": "$ 1,864.41 B",
//                    "MKTCAPPENALTY": "0 %",
//                    "CIRCULATINGSUPPLY": "Ƀ 19,800,475.0",
//                    "CIRCULATINGSUPPLYMKTCAP": "$ 1,864.41 B",
//                    "TOTALVOLUME24H": "Ƀ 367.56 K",
//                    "TOTALVOLUME24HTO": "$ 34.59 B",
//                    "TOTALTOPTIERVOLUME24H": "Ƀ 208.83 K",
//                    "TOTALTOPTIERVOLUME24HTO": "$ 19.65 B",
//                    "IMAGEURL": "/media/37746251/btc.png"
//                }
//            }
//        }
//    ],
//    "RateLimit": {},
//    "HasWarning": false
//}
