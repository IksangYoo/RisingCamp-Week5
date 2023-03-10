// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct StoreResponse: Codable {
    
    let crtfcUpsoInfo: CrtfcUpsoInfo

    enum CodingKeys: String, CodingKey {
        case crtfcUpsoInfo = "CrtfcUpsoInfo"
    }
}

// MARK: - CrtfcUpsoInfo
struct CrtfcUpsoInfo: Codable {
    let listTotalCount: Int
    let result: Result
    let row: [Row]

    enum CodingKeys: String, CodingKey {
        case listTotalCount = "list_total_count"
        case result = "RESULT"
        case row = "row"
    }
}

// MARK: - Result
struct Result: Codable {
    let code, message: String

    enum CodingKeys: String, CodingKey {
        case code = "CODE"
        case message = "MESSAGE"
    }
}

// MARK: - Row
struct Row: Codable {
//    let crtfcUpsoMgtSno: Int
    let upsoNm : String
    let cggCodeNm: String
//    let cobCodeNm: CobCodeNm
//    let bizcndCodeNm: BizcndCodeNm
//    let ownerNm, crtfcGbn: String
//    let crtfcGbnNm: CrtfcGbnNm
//    let crtfcChrNm: CrtfcChrNm
//    let crtfcChrID: CRT
//    let crtfcYmd: String
//    let useYn, mapIndictYn: Yn
    let yDnts, xCnts: String
//    let rdnDetailAddr: String
//    let rdnAddrCode,
    let rdnCodeNm: String
//    let bizcndCode: String
//    let cobCode, crtfcSno: String
//    let crtTime: Time
//    let crtUSR: CRT
//    let updTime: Time
//    let foodMenu, gntNo: String
//    let crtfcYn: CrtfcYn
    let telNo : String
    
    enum CodingKeys: String, CodingKey {
//        case crtfcUpsoMgtSno = "CRTFC_UPSO_MGT_SNO"
//        case upsoSno = "UPSO_SNO"
        case upsoNm = "UPSO_NM"
//        case cggCode = "CGG_CODE"
        case cggCodeNm = "CGG_CODE_NM"
//        case cobCodeNm = "COB_CODE_NM"
//        case bizcndCodeNm = "BIZCND_CODE_NM"
//        case ownerNm = "OWNER_NM"
//        case crtfcGbn = "CRTFC_GBN"
//        case crtfcGbnNm = "CRTFC_GBN_NM"
//        case crtfcChrNm = "CRTFC_CHR_NM"
//        case crtfcChrID = "CRTFC_CHR_ID"
//        case crtfcYmd = "CRTFC_YMD"
//        case useYn = "USE_YN"
//        case mapIndictYn = "MAP_INDICT_YN"
//        case crtfcClass = "CRTFC_CLASS"
        case yDnts = "Y_DNTS"
        case xCnts = "X_CNTS"
        case telNo = "TEL_NO"
//        case rdnDetailAddr = "RDN_DETAIL_ADDR"
//        case rdnAddrCode = "RDN_ADDR_CODE"
        case rdnCodeNm = "RDN_CODE_NM"
//        case bizcndCode
//        case cobCode
//        case crtfcSno
//        case crtTime
//        case crtUSR
//        case updTime
//        case foodMenu
//        case gntNo
//        case crtfcYn
    }
}

enum BizcndCodeNm: String, Codable {
    case ?????? = "??????"
    case ?????? = "??????"
}

//enum CggCodeNm: String, Codable {
//    case ????????? = "?????????"
//    case ????????? = "?????????"
//    case ????????? = "?????????"
//}

enum CobCodeNm: String, Codable {
    case ??????????????? = "???????????????"
    case ??????????????? = "???????????????"
}

enum Time: String, Codable {
    case the202209010000000 = "2022-09-01 00:00:00.0"
}

enum CRT: String, Codable {
    case admin = "admin"
}

enum CrtfcChrNm: String, Codable {
    case ?????????????????? = "??????????????????"
}

enum CrtfcGbnNm: String, Codable {
    case ????????????????????? = "?????????????????????"
    case ??????????????? = "???????????????"
}

enum CrtfcYn: String, Codable {
    case n = "N"
}

enum Yn: String, Codable {
    case y = "Y"
}

