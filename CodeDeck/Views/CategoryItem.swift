import SwiftUI

struct CategoryItem: View {
    var course: Course

    var body: some View {
        VStack(alignment: .leading) {
            course.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 230, height: 140)
                .cornerRadius(5)
            Text(course.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(course: ModelData().courses[0])
    }
}


