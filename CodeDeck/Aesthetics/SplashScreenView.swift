import SwiftUI

struct SplashScreenView: View {
    @StateObject private var modelData = ModelData()
    @StateObject private var userData = UserData()
    @State private var isActive = false
    @State private var size = 0.35
    @State private var opacity = 0.3
    var body: some View {
        if isActive {
            ContentView()
                .environmentObject(userData)
                .environmentObject(modelData)
        }else{
            VStack{
                VStack{
                    Image("SplashScreenIcon")
                        .font(.system(size: 80))
                        .foregroundColor(.red)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 2)){
                        self.size = 0
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.89){
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
            
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

