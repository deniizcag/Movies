//
//  MovTabBarController.swift
//  Movies
//
//  Created by DenizCagilligecit on 6.08.2020.
//  Copyright © 2020 garage. All rights reserved.
//

import UIKit

class MovTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().tintColor = .systemBlue
        viewControllers = [createSearchNC(),createFavoritesNC()]

    }
    
    func createSearchNC() -> UINavigationController {
     //   let overView = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam porttitor scelerisque erat quis molestie. Fusce euismod libero bibendum tellus pretium, sed iaculis risus mattis. Sed sagittis elit in neque facilisis, quis pharetra lorem convallis. Etiam quis elementum dui. Praesent scelerisque tortor tincidunt iaculis interdum. "
            
       // let movie1 = Movie(title: "sdsdsada sadasd sda asdad asdad ad", id: 123, voteAverage: 7.1, overview: overView, releaseDate: "2020-08-07", posterPath: "sdsad", genreIds: [123],backdropPath:  "asdasd")
        
        let searchVC = MoviesVC()
        
        
        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.search, tag: 0)
        
        return UINavigationController(rootViewController: searchVC)
        
        
    }
    
    func createFavoritesNC() -> UINavigationController {
        
        let favoritesVC = FavoritesVC()
        
        favoritesVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "heart.fill"), tag: 1)

       
        return UINavigationController(rootViewController: favoritesVC)
    }
   

}
