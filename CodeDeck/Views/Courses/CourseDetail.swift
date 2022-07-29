import SwiftUI

struct CourseDetail: View {
    @EnvironmentObject var userData: UserData
    @EnvironmentObject var modelData: ModelData
    
    var course: Course
    var courseIndex: Int{
        userData.courses.firstIndex(where: { $0.id == course.id })!
    }


    var body: some View {
        ScrollView {
            Image(course.imageName)
                .resizable()
                .frame(height: 230)
            
            VStack(alignment: .leading) {
                 HStack {
                     Text(verbatim: course.name)
                         .font(.title)
                     
                     Button(action: {
                         self.userData.courses[self.courseIndex].isFavorite.toggle()
                         userData.updateSavedFavourites()
                     }) {
                         if self.userData.courses[self.courseIndex].isFavorite{
                             Image(systemName: "star.fill")
                                 .foregroundColor(Color.yellow)
                         } else {
                             Image(systemName: "star")
                                 .foregroundColor(Color.gray)
                         }
                     }
                 }
                .font(.subheadline)
                .foregroundColor(.secondary)
                

                Divider()

                Text(course.description)
                
            }
            .padding()
            
            Link(destination: (URL(string: course.url)!), label: {
                Text("Visit Resource")
                    .bold()
                    .frame(width: 280, height: 50)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
            })
        }
        .navigationTitle(course.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static let userData = UserData()

    static var previews: some View {
        CourseDetail(course: userData.courses[0])
            .environmentObject(userData)
    }
}

