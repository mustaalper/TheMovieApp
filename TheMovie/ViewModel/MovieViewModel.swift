//
//  MovieViewModel.swift
//  TheMovie
//
//  Created by MAA on 7.06.2022.
//

import Foundation
import UIKit

struct MovieListViewModel {
    let movieList: [AResult]
    
    func numberOfRowsInSection() -> Int {
        return self.movieList.count
    }
    
    func movieAtIndex(_ index: Int) -> MovieViewModel {
        let mov = self.movieList[index]
        return MovieViewModel(mov)
    }
    
    func movieSelectIndex(_ index: Int) -> MovieViewModel{
        let select = self.movieList[index]
        return MovieViewModel(select)
    }
}

struct MovieViewModel {
    let results: AResult 
    
    init(_ movie: AResult) {
        self.results = movie
    }
    
    var name: String {
        return results.originalTitle
    }
    
    var date: String {

        let date1 = ""
        return date1.getDate(date: results.releaseDate)
        
        /*let rDate = results.releaseDate
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
    
    var rating: Double {
        return results.voteAverage
    }
    
    var image: String {
        return results.posterPath
    }
    
    var genres: String {
        
        //let genre = results.genreIDS.first
        var genreN = ""
        var array: [String] = []
        
        for i in 0..<results.genreIDS.count {
            let x = results.genreIDS[i]
            switch x {
            case 28:
                genreN = "Action"
            case 878:
                genreN = "Science Fiction"
            case 10770:
                genreN = "TV Movie"
            case 53:
                genreN = "Thriller"
            case 37:
                genreN = "Western"
            case 10751:
                genreN = "Family"
            case 14:
                genreN = "Fantasy"
            case 36:
                genreN = "History"
            case 27:
                genreN = "Horror"
            case 10402:
                genreN = "Music"
            case 9648:
                genreN = "Mystery"
            case 10749:
                genreN = "Romance"
            case 16:
                genreN = "Animation"
            case 35:
                genreN = "Comedy"
            case 80:
                genreN = "Crime"
            case 99:
                genreN = "Documentary"
            case 12:
                genreN = "Adventure"
            case 18:
                genreN = "Drama"
            case 10752:
                genreN = "War"
            default:
                print("*n/a*")
            }
            array.append(genreN)
        }
        
        return array.joined(separator: ", ")
        
        /*switch genre {
        case 28:
            genreN = "Action"
        case 878:
            genreN = "Science Fiction"
        case 10770:
            genreN = "TV Movie"
        case 53:
            genreN = "Thriller"
        case 37:
            genreN = "Western"
        case 10751:
            genreN = "Family"
        case 14:
            genreN = "Fantasy"
        case 36:
            genreN = "History"
        case 27:
            genreN = "Horror"
        case 10402:
            genreN = "Music"
        case 9648:
            genreN = "Mystery"
        case 10749:
            genreN = "Romance"
        case 16:
            genreN = "Animation"
        case 35:
            genreN = "Comedy"
        case 80:
            genreN = "Crime"
        case 99:
            genreN = "Documentary"
        case 12:
            genreN = "Adventure"
        case 18:
            genreN = "Drama"
        case 10752:
            genreN = "War"
        default:
            print("*n/a*")
        }*/
        
        //return genreN
        
    }
}

struct MovieDetailViewModel {
    let movieDetail: MovieDetail
    
    var runTime: Int {
        return movieDetail.runtime
    }
}
