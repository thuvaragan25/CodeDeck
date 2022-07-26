import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        NavigationView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(course: $0) })
                    .aspectRatio(3.8 / 2, contentMode: .fit)

                    .listRowInsets(EdgeInsets())

                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .padding(.top)
                .listRowInsets(EdgeInsets())
            }
            
            .navigationTitle("Featured")
        }
        .environmentObject(ModelData())
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}

