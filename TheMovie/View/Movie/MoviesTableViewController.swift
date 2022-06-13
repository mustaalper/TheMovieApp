//
//  MoviesTableViewController.swift
//  TheMovie
//
//  Created by MAA on 6.06.2022.
//

import UIKit

class MoviesTableViewController: UITableViewController {

    
    private var movieListViewModel: MovieListViewModel!
    let parser = Webservice()
    var results = [AResult]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        parser.parse {
            data in
            self.results = data
            self.movieListViewModel = MovieListViewModel(movieList: data)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
            tableView.dataSource = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as! Int
        
        let destVC = segue.destination as! DetailMovieViewController
        let destC = movieListViewModel.movieSelectIndex(indeks)
        
        destVC.result = destC.results
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.movieListViewModel == nil ? 0 : self.movieListViewModel.numberOfRowsInSection()
        //return results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MoviesTableViewCell
        
        let movieViewModel = self.movieListViewModel.movieAtIndex(indexPath.row)
        
        cell.moviesName.text = movieViewModel.name
        cell.moviesDate.text = movieViewModel.date
        cell.moviesRating.text = "\(movieViewModel.rating)"
        cell.moviesImage.load(urlString: "https://image.tmdb.org/t/p/original/\(movieViewModel.image)")
        cell.moviesCategory.text = movieViewModel.genres
        
        /*cell.layer.cornerRadius = 25
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowRadius = 6.0*/
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toMovieDetail", sender: indexPath.row)
    }

    
}
