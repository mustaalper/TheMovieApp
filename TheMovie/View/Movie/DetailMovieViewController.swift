//
//  DetailMovieViewController.swift
//  TheMovie
//
//  Created by MAA on 7.06.2022.
//

import UIKit

class DetailMovieViewController: UIViewController {
    
    var result: AResult?
    var movieDetail: MovieDetail?
    let parser = Webservice()
    
    private var movieListViewModel: MovieListViewModel!
    private var movieViewModel: MovieViewModel!
    private var movieDetailViewMeodel: MovieDetailViewModel!
    
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieRating: UILabel!
    @IBOutlet var movieName: UILabel!
    @IBOutlet var movieMin: UILabel!
    @IBOutlet var movieDate: UILabel!
    @IBOutlet var movieCategory: UILabel!
    @IBOutlet var movieOverwiev: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        //getDetail()
        
        if let id = result?.id {
            let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=c3613354f2e9bc400da18e64cbfd29fc")!
            parser.parseMovie(url: url) { movie in
                self.movieDetail = movie
                self.movieDetailViewMeodel = MovieDetailViewModel(movieDetail: movie)
                DispatchQueue.main.async {
                    //self.view.layoutIfNeeded()
                    self.movieMin.text = "\(self.movieDetailViewMeodel?.runTime ?? 0) min"
                    self.movieCategory.text = self.movieDetail?.genreText
                }
                
            }
        }
        
        /*DispatchQueue.main.async {
            self.movieMin.text = "\(self.movieDetailViewMeodel?.runTime ?? 0) min"
            self.movieCategory.text = self.movieDetail?.genreText
        }*/
        
        
        if let name = result?.originalTitle {
            movieName.text = name
        }
        if let overview = result?.overview {
            movieOverwiev.text = overview
        }
        if let date = result?.date {
            movieDate.text = date
        }
        if let imageM = result?.backdropPath {
            movieImage.load(urlString: "https://image.tmdb.org/t/p/original/\(imageM)")
        }
        if let rating = result?.voteAverage {
            movieRating.text = "\(rating)"
        }
        //movieMin.text = "\(self.movieDetailViewMeodel?.runTime ?? 0) min"

        // Do any additional setup after loading the view.
    }
        
    /*func getDetail() {
        if let id = result?.id {
            let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=c3613354f2e9bc400da18e64cbfd29fc")!
            Webservice().parseMovie(url: url) { movie in
                
                self.movieDetail = movie
                self.movieDetailViewMeodel = MovieDetailViewModel(movieDetail: movie)
                
            }
        }
    }*/
}
