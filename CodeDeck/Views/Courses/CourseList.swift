import SwiftUI

struct CourseList: View {
    @EnvironmentObject private var userData: UserData
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = true

    var filteredCourses: [Course] {
        userData.courses.filter { course in
            (!userData.showFavoritesOnly || course.isFavorite)
        }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly){
                    Text("Favourites Only")
                }
                
                ForEach(filteredCourses) { course in
                    if !self.userData.showFavoritesOnly || course.isFavorite {
                    NavigationLink(
                    destination: CourseDetail(course: course)
                            .environmentObject(self.userData)
                        ){
                        CourseRow(course: course)
                        }
                    }
                }
            }
            .navigationTitle("Courses")
        }
        .onAppear{
            userData.updateSavedFavourites()
        }
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
            .environmentObject(UserData())
    }
}

