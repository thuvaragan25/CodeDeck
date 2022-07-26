import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var courses: [Course] = load("courseData.json")

    var savedFavourites: [Int] = []

    init() {
        retrieveSavedFavourites()
    }

    func updateSavedFavourites() {
        for course in courses {
            if course.isFavorite && !savedFavourites.contains(course.id) {
                savedFavourites.append(course.id)
            } else if !course.isFavorite && savedFavourites.contains(course.id) {
                let idx = savedFavourites.firstIndex { $0 == course.id }
                guard idx != nil else { return }
                savedFavourites.remove(at: idx!)
            }
        }
        UserDefaults.standard.set(savedFavourites, forKey: "favourites")
    }

    func retrieveSavedFavourites() {
        if let retrievedFavourites = UserDefaults.standard.object(forKey: "favourites") as? [Int] {
            savedFavourites = retrievedFavourites
        }
        for idx in 0..<courses.count {
            if savedFavourites.contains(courses[idx].id) {
                courses[idx].isFavorite = true
            }
        }
    }
}

