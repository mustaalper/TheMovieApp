//
//  Movies.swift
//  TheMovie
//
//  Created by MAA on 6.06.2022.
//

/*import Foundation

struct Movies: Decodable {
    var id: Int
    var original_title: String
    var vote_average: Double
    var release_date: String
    var backdrop_path: String
    var overview: String
    var runtime: Int

}*/

import Foundation

// MARK: - Welcome
struct Movies: Codable {
    let page: Int
    let results: [AResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct AResult: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage, originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    var date: String {

        var date1 = ""
        return date1.getDate(date: releaseDate)
        
        /*let rDate = releaseDate
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MM/dd/yyyy"
        
        if let date1 = dateFormatter.date(from: rDate) {
            //print(dateFormatterPrint.string(from: date1))
            return dateFormatterPrint.string(from: date1)
        } else {
           print("There was an error decoding the string")
        }
        
        //let formatter = DateFormatter()
        //formatter.dateFormat = "MM/dd/yyyy"
        //print(formatter.date(from: rDate) ?? "n/a")
        return "\nna"*/
    }
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
