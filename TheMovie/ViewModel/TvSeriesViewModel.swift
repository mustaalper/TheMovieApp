//
//  TvSeriesViewModel.swift
//  TheMovie
//
//  Created by MAA on 9.06.2022.
//

import Foundation

struct TvSeriesListViewModel {
    let tvSeriesList: [Result]
    
    func numberOfItemsInSection() -> Int {
        return self.tvSeriesList.count
    }
    
    func tvSeriesAtIndex(_ index: Int) -> TvSeriesViewModel {
        let tSer = self.tvSeriesList[index]
        return TvSeriesViewModel(tSer)
    }
    
    func tvSeriesSelectIndex(_ index: Int) -> TvSeriesViewModel{
        let select = self.tvSeriesList[index]
        return TvSeriesViewModel(select)
    }
    
}

struct TvSeriesViewModel {
    let tvResult: Result
    
    init(_ tvSeries: Result) {
        self.tvResult = tvSeries
    }
    
    var name: String {
        return tvResult.name
    }
    
    var date: String {
        return tvResult.firstAirDate
    }
    
    var rating: Double {
        return tvResult.voteAverage
    }
    
    var image: String {
        return tvResult.posterPath 
    }
}

struct TvSeriesDetailViewModel {
    let tvSeriesDetail: TvSeriesDetail
    
    var runTime: Int {
        
        if let time = tvSeriesDetail.episodeRunTime.first {
            return time
        } else {
            return tvSeriesDetail.episodeRunTime.last!
        }
        
    }
}
