import SwiftUI

struct CourseRow: View {
    var course: Course
    var body: some View {
        HStack{
            course.image
                .resizable()
                .frame(width: 75, height: 50)
            Text(course.name)
            
            Spacer()
            
            if course.isFavorite{
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct CourseRow_Previews: PreviewProvider {
    static var courses = ModelData().courses

    static var previews: some View {
        Group {
            CourseRow(course: courses[0])
            CourseRow(course: courses[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

