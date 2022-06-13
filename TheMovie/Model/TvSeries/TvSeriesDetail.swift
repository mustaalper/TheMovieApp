//
//  TvSeriesDetail.swift
//  TheMovie
//
//  Created by MAA on 11.06.2022.
//

import Foundation

// MARK: - TvSeriesDetail
struct TvSeriesDetail: Codable {
    let backdropPath: String
    let episodeRunTime: [Int]
    let firstAirDate: String
    let genres: [TvGenre]
    let id: Int
    let lastAirDate: String
    let name: String
    let voteAverage: Double
    let voteCount: Int
    
    var run: Int {
        if let runT = episodeRunTime.first {
            return runT
        }

        return 1
    }
    
    var genreText: String {
        
        var array: [String] = []
        for i in 0..<genres.count {
            array.append(genres[i].name)
        }
        
        let gen = array.joined(separator: ", ")
        
        return gen
        //return genres.first?.name ?? "n/a"
    }

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case episodeRunTime = "episode_run_time"
        case firstAirDate = "first_air_date"
        case genres, id
        case name
        case lastAirDate = "last_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

// MARK: - Genre
struct TvGenre: Codable {
    let id: Int
    let name: String
}
