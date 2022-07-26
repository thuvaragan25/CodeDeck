import SwiftUI

struct Course: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var isFavorite: Bool
    var isFeatured: Bool
    var url: String
  
    var category: Category
    enum Category: String, CaseIterable, Codable{
        case gettingStarted = "Beginner - Getting Started"
        case webDevelopment = "Web Development"
        case appDevelopment = "App Development"
        case gameDevelopment = "Game Development"
        case competitiveProgramming = "Competitive Programming"
        
    }
    
    
    var imageName: String
    var image: Image{
        Image(imageName)
    }
    
    var featureImage: Image? {
        isFeatured ? Image(imageName + "_feature") : nil
    }
    
}

