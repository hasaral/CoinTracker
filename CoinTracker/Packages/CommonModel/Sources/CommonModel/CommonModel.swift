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

