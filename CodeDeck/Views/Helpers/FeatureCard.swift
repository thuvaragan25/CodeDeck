import SwiftUI

struct FeatureCard: View {
    var course: Course

    var body: some View {
        course.featureImage?
            .resizable()
            .aspectRatio(3.8 / 2, contentMode: .fit)
    }
}

struct TextOverlay: View {
    var course: Course

    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(course.name)
                    .font(.title)
                    .bold()
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(course: ModelData().features[0])
    }
}

