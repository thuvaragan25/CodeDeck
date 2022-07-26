import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Course]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { course in
                        NavigationLink{
                            CourseDetail(course: course)
                        }label:{
                            CategoryItem(course: course)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var courses = ModelData().courses
    static var previews: some View {
        CategoryRow(categoryName: courses[0].category.rawValue, items: courses)
    }
}


