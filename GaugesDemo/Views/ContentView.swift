import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LinearGauges()
                .tabItem {
                    Label("Linear Gauges", systemImage: "1.circle.fill")
                }
            CircularGauges()
                .tabItem {
                    Label("Circular Gauges", systemImage: "2.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
