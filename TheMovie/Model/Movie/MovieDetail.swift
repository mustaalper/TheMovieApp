//
//  MovieDetail.swift
//  TheMovie
//
//  Created by MAA on 7.06.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

/*import Foundation

// MARK: - Welcome
struct MovieDetail: Codable {
    let adult: Bool?
    let backdropPath: String?
    let belongsToCollection: JSONNull?
    let budget: Int?
    let genres: [Genre]
    let homepage: String?
    let id: Int?
    let imdbID, originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let releaseDate: String?
    let revenue, runtime: Int?
    let spokenLanguages: [SpokenLanguage]
    let status, tagline, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    var genreText: String {
        
        var array: [String] = []
        array.append(genres.first?.name ?? "n/a")
        array.append(genres.last?.name ?? "n/a")
        let gen = array.joined(separator: ", ")
        
        return gen
        //return genres.first?.name ?? "n/a"
    }

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case belongsToCollection = "belongs_to_collection"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue, runtime
        case spokenLanguages = "spoken_languages"
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name: String?
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    let id: Int?
    let logoPath: String?
    let name, originCountry: String?

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    let iso3166_1, name: String?

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let englishName, iso639_1, name: String?

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}*/

import Foundation

// MARK: - Welcome
struct MovieDetail: Codable {
    //let adult: Bool
    let backdropPath: String
    //let belongsToCollection: JSONNull?
    //let budget: Int
    let genres: [Genre]
    //let homepage: String
    let id: Int
    let /*imdbID, originalLanguage,*/ originalTitle, overview: String
    //let popularity: Double
    let posterPath: String
    //let productionCompanies: [ProductionCompany]
    //let productionCountries: [ProductionCountry]
    let releaseDate: String
    let /*revenue,*/ runtime: Int
    //let spokenLanguages: [SpokenLanguage]
    //let status, tagline, title: String
    //let video: Bool
    let voteAverage: Double
    //let voteCount: Int
    
    var genreText: String {
        
        var array: [String] = []
        //array.append(genres.first?.name ?? "n/a")
        //array.append(genres.last?.name ?? "n/a")
        
        for i in 0..<genres.count {
            array.append(genres[i].name)
        }
        
        let gen = array.joined(separator: ", ")
        
        return gen
        //return genres.first?.name ?? "n/a"
    }

    enum CodingKeys: String, CodingKey {
        //case adult
        case backdropPath = "backdrop_path"
        //case belongsToCollection = "belongs_to_collection"
        case /*budget,*/ genres, /*homepage,*/ id
        //case imdbID = "imdb_id"
        //case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview/*, popularity*/
        case posterPath = "poster_path"
        //case productionCompanies = "production_companies"
        //case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case /*revenue,*/ runtime
        //case spokenLanguages = "spoken_languages"
        //case status, tagline, title, video
        case voteAverage = "vote_average"
        //case voteCount = "vote_count"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int
    let name: String
}

// MARK: - ProductionCompany
/*struct ProductionCompany: Codable {
    let id: Int
    let logoPath: String?
    let name, originCountry: String

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
}*/

// MARK: - ProductionCountry
/*struct ProductionCountry: Codable {
    let iso3166_1, name: String

    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
}*/

// MARK: - SpokenLanguage
/*struct SpokenLanguage: Codable {
    let englishName, iso639_1, name: String

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
}*/

// MARK: - Encode/decode helpers

/*class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}*/

