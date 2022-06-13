//
//  Webservice.swift
//  TheMovie
//
//  Created by MAA on 6.06.2022.
//

import Foundation

class Webservice {
    
    func parse(comp : @escaping ([AResult]) -> ()) {
        let api = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=c3613354f2e9bc400da18e64cbfd29fc&language=en-US&page=1")
        
        URLSession.shared.dataTask(with: api!) { data, response, error in
            if error != nil {
                print(error?.localizedDescription ?? "n/a")
                return
            }
            do {
                let result = try JSONDecoder().decode(Movies.self, from: data!)
                comp(result.results)
            } catch {
                
            }
        }.resume()
    }
    
    func parseTvSeries(comp : @escaping ([Result]) -> ()) {
        let api = URL(string: "https://api.themoviedb.org/3/tv/top_rated?api_key=c3613354f2e9bc400da18e64cbfd29fc&language=en-US&page=1")
        
        URLSession.shared.dataTask(with: api!) { data, response, error in
            if error != nil {
                print(error?.localizedDescription ?? "n/a")
                return
            }
            do {
                let result = try JSONDecoder().decode(TvSeries.self, from: data!)
                comp(result.results)
            } catch {
                
            }
        }.resume()
    }
    
    func parseMovie(url: URL, comp : @escaping (MovieDetail) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error?.localizedDescription ?? "n/a")
                return
            }
     
            guard let _ = response else { return }
     
            guard let data = data else { return }
     
            do {
                let result = try JSONDecoder().decode(MovieDetail.self, from: data)
                comp(result)
            } catch {
                
            }
        }.resume()
    }
    
    func parseTvSeriesDet(url: URL, comp: @escaping (TvSeriesDetail) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error?.localizedDescription ?? "n/a")
                return
            }
            
            guard let _ = response else { return }
            
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(TvSeriesDetail.self, from: data)
                comp(result)
            } catch {
                
            }
        }.resume()
    }
    
    /*func parseTest(url: URL) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            
            guard let _ = response else { return }
            
            guard let data = data else { return }

            do {
                if let result = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    print(result)
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }*/
    
    
    /*func parseMovie(url: URL) {
        //let api = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=c3613354f2e9bc400da18e64cbfd29fc&language=en-US&page=1")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            do {
                let result = try JSONDecoder().decode(MovieDetail.self, from: data!)
                print(result)
            } catch {
                
            }
        }.resume()
    }*/
    
    /*func downloadMovies(url: URL, completion: @escaping ([Result]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                
                let movieList = try? JSONDecoder().decode([Result].self, from: data)
                
                print(movieList)
                
                if let movieList = movieList {
                    completion(movieList)
                }
            }
        }.resume()
    }*/
}
