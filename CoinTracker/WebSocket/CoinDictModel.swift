//
//  CoinDictModel.swift
//  CoinTracker
//
//  Created by Hasan Saral on 27.12.2024.
//



struct CoinDictModel: Codable,Equatable {
    let type, market, fromsymbol, tosymbol: String?
    let flags: Int?
    let lasttradeid: String?
    let price: Double?
    let lastupdate, lastvolume: Double?
    let lastvolumeto, volumehour, volumehourto, volumeday: Double?
    let volumedayto, volume24Hour, volume24Hourto: Double?

    enum CodingKeys: String, CodingKey {
        case type = "TYPE"
        case market = "MARKET"
        case fromsymbol = "FROMSYMBOL"
        case tosymbol = "TOSYMBOL"
        case flags = "FLAGS"
        case lasttradeid = "LASTTRADEID"
        case price = "PRICE"
        case lastupdate = "LASTUPDATE"
        case lastvolume = "LASTVOLUME"
        case lastvolumeto = "LASTVOLUMETO"
        case volumehour = "VOLUMEHOUR"
        case volumehourto = "VOLUMEHOURTO"
        case volumeday = "VOLUMEDAY"
        case volumedayto = "VOLUMEDAYTO"
        case volume24Hour = "VOLUME24HOUR"
        case volume24Hourto = "VOLUME24HOURTO"
    }
}
