import SwiftUI
import MessageUI

struct SuggestView: View {
    @State private var courseName = ""
    @State private var courseCategory = ""
    @State private var courseLink = ""
    @State private var reason = ""
    @State private var rating = 0
    
    let courseCategories = ["Beginner - Getting Started", "App Development", "Web Development", "Game Development"]
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Course Information")){
                    TextField("Course Name", text: $courseName)
                    TextField("Course Link", text: $courseLink)
                    Picker("Category", selection: $courseCategory) {
                        ForEach(courseCategories, id: \.self) {
                            Text($0)
                        }
                    }
                
                }
                Section(header: Text("Review")){
                    TextField("Reason For Suggestion", text: $reason)
                    Rating(rating: $rating)
                    
                }
                Button("Submit Suggestion"){
                    //Implement the results of form to send to email
                    print("Click")
                    
                }
            }
            .navigationTitle("Suggest A Resource")
        }

    }

}

struct SuggestView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestView()
    }
}

