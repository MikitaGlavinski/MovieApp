//
//  DetailMovieViewModel.swift
//  MovieApp
//
//  Created by Mikita Glavinski on 12/16/21.
//

import SwiftUI

class DetailMovieViewModel: ObservableObject {
    
    @Published var detailModel = DetailMovieModel(id: 0, title: "", releaseDate: "", runTime: 0, budget: 0, backdropPath: "", overview: "")
    @Published var movieImages = [MovieImageModel]()
    
    func getDetailMovie(id: Int) {
        NetworkService.shared.getDetailMovie(id: id) { result in
            switch result {
            case .success(let movie):
                DispatchQueue.main.async {
                    self.detailModel = movie
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getMovieImages(id: Int) {
        NetworkService.shared.getMovieImages(movieId: id) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.movieImages = response.backdrops
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
