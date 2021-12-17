//
//  NetworkApi.swift
//  MovieApp
//
//  Created by Mikita Glavinski on 12/15/21.
//

import Foundation
import Alamofire

protocol NetworkApi {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var bodyParameters: [String: Any]? { get }
    var urlParameters: [String: Any]? { get }
    var headers: HTTPHeaders? { get }
}

enum NetworkMovieApi: NetworkApi {
    
    case popularMovies(language: String, page: Int)
    case movieGenres
    case newMoviews(page: Int)
    case getPopularActors(page: Int)
    case getDetailMovie(id: Int)
    case getMoviewImages(movieId: Int)
    
    var path: String {
        switch self {
        case .popularMovies:
            return "/movie/popular"
        case .movieGenres:
            return "/genre/movie/list"
        case .newMoviews:
            return "/movie/now_playing"
        case .getPopularActors:
            return "/person/popular"
        case .getDetailMovie(id: let id):
            return "/movie/\(id)"
        case .getMoviewImages(movieId: let id):
            return "/movie/\(id)/images"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .popularMovies:
            return .get
        case .movieGenres:
            return .get
        case .newMoviews:
            return .get
        case .getPopularActors:
            return .get
        case .getDetailMovie:
            return .get
        case .getMoviewImages:
            return .get
        }
    }
    
    var bodyParameters: [String : Any]? {
        switch self {
        case .popularMovies:
            return nil
        case .movieGenres:
            return nil
        case .newMoviews:
            return nil
        case .getPopularActors:
            return nil
        case .getDetailMovie:
            return nil
        case .getMoviewImages:
            return nil
        }
    }
    
    var urlParameters: [String : Any]? {
        switch self {
        case let .popularMovies(language: language, page: page):
            return [
                "api_key": "de8c410ebd589773b4714db8f59baba3",
                "language": language,
                "page": page
            ]
        case .movieGenres:
            return ["api_key": "de8c410ebd589773b4714db8f59baba3"]
        case .newMoviews(page: let page):
            return [
                "api_key": "de8c410ebd589773b4714db8f59baba3",
                "page": page
            ]
        case .getPopularActors(page: let page):
            return [
                "api_key": "de8c410ebd589773b4714db8f59baba3",
                "page": page
            ]
        case .getDetailMovie:
            return ["api_key": "de8c410ebd589773b4714db8f59baba3"]
        case .getMoviewImages:
            return ["api_key": "de8c410ebd589773b4714db8f59baba3"]
        }
    }
    
    var headers: HTTPHeaders? {
        switch self {
        case .popularMovies:
            return nil
        case .movieGenres:
            return nil
        case .newMoviews:
            return nil
        case .getPopularActors:
            return nil
        case .getDetailMovie:
            return nil
        case .getMoviewImages:
            return nil
        }
        
    }
}
