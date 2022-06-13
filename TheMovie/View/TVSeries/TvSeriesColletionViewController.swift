//
//  TvSeriesColletionViewController.swift
//  TheMovie
//
//  Created by MAA on 9.06.2022.
//

import UIKit

class TvSeriesColletionViewController: UIViewController {
    
    @IBOutlet var tvSeriesCollectionView: UICollectionView!
    private var tvSeriesListViewModel: TvSeriesListViewModel!
    let parser = Webservice()
    var tvResults = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let desing: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = self.tvSeriesCollectionView.frame.size.width
        desing.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        desing.minimumInteritemSpacing = 10
        desing.minimumLineSpacing = 10
        let cellWidth = (width - 30) / 2
        desing.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.5)
        
        tvSeriesCollectionView!.collectionViewLayout = desing
        
        parser.parseTvSeries {
            data in
            self.tvResults = data
            self.tvSeriesListViewModel = TvSeriesListViewModel(tvSeriesList: data)
            DispatchQueue.main.async {
                self.tvSeriesCollectionView.reloadData()
            }
        }

        tvSeriesCollectionView.delegate = self
        tvSeriesCollectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as! Int
        
        let destVC = segue.destination as! DetailTvSeriesViewController
        let destC = tvSeriesListViewModel.tvSeriesSelectIndex(indeks)
        
        destVC.result = destC.tvResult
    }
}

extension TvSeriesColletionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return self.tvSeriesListViewModel.numberOfItemsInSection()
        return tvResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tvSeriesCell", for: indexPath) as! TvSeriesCollectionViewCell
        
        let tvSeriesViewModel = self.tvSeriesListViewModel.tvSeriesAtIndex(indexPath.row)
        
        cell.seriesImage.load(urlString: "https://image.tmdb.org/t/p/original/\(tvSeriesViewModel.image)")
        cell.seriesName.text = tvSeriesViewModel.name
        cell.seriesRating.text = "\(tvSeriesViewModel.rating)"
        
        /*cell.layer.cornerRadius = 15.0
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowRadius = 6.0*/
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toTvSeriesDetail", sender: indexPath.item)
    }

}
