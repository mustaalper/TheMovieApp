//
//  DetailTvSeriesViewController.swift
//  TheMovie
//
//  Created by MAA on 11.06.2022.
//

import UIKit

class DetailTvSeriesViewController: UIViewController {
    
    var result: Result?
    var tvSeriesDetail: TvSeriesDetail?
    let parser = Webservice()
    
    private var tvSeriesListViewModel: TvSeriesListViewModel!
    private var tvSeriesViewModel: TvSeriesViewModel!
    private var tvSeriesDetailViewModel: TvSeriesDetailViewModel!

    
    @IBOutlet var tvImage: UIImageView!
    @IBOutlet var tvRating: UILabel!
    @IBOutlet var tvNames: UILabel!
    @IBOutlet var detailMin: UILabel!
    @IBOutlet var tvDate: UILabel!
    @IBOutlet var tvCategory: UILabel!
    @IBOutlet var tvOverwiev: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let id = result?.id {
            let url = URL(string: "https://api.themoviedb.org/3/tv/\(id)?api_key=c3613354f2e9bc400da18e64cbfd29fc&language=en-US")!
            parser.parseTvSeriesDet(url: url) { tvSeries in
                
                self.tvSeriesDetail = tvSeries
                self.tvSeriesDetailViewModel = TvSeriesDetailViewModel(tvSeriesDetail: tvSeries)
                DispatchQueue.main.async {
                    self.detailMin.text = "\(self.tvSeriesDetailViewModel?.runTime ?? 0) min"
                    self.tvCategory.text = self.tvSeriesDetail?.genreText
                    
                }
            }
        }
        
        
        /*getDetailTv()
        
        DispatchQueue.main.async {
            self.detailMin.text = "\(self.tvSeriesDetailViewModel?.runTime ?? 0) min"
            self.tvCategory.text = self.tvSeriesDetail?.genreText
            
        }*/
        
       
        
        if let name = result?.name {
            tvNames.text = name
        }
        
        if let rating = result?.voteAverage {
            tvRating.text = "\(rating)"
        }
        
        if let imageM = result?.backdropPath {
            tvImage.load(urlString: "https://image.tmdb.org/t/p/original/\(imageM)")
        }
        
        if let date = result?.firstAirDate {
            tvDate.text = date.getDate(date: date)
        }

        if let overwiev = result?.overview {
            tvOverwiev.text = overwiev
        }
        // Do any additional setup after loading the view.
    }
    
    /*func getDetailTv() {
        if let id = result?.id {
            let url = URL(string: "https://api.themoviedb.org/3/tv/\(id)?api_key=c3613354f2e9bc400da18e64cbfd29fc&language=en-US")!
            Webservice().parseTvSeriesDet(url: url) { tvSeries in
                
                self.tvSeriesDetail = tvSeries
                self.tvSeriesDetailViewModel = TvSeriesDetailViewModel(tvSeriesDetail: tvSeries)
                
            }
        }
    }*/
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
