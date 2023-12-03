import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject var vm = ViewModel()
    @State private var manualIPAddress: String = ""
    @State private var isSearching: Bool = false

    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.location)
                .ignoresSafeArea()

            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isSearching.toggle()
                    }) {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.large)
                            .padding()
                            .foregroundColor(.white)
                    }
                    .sheet(isPresented: $isSearching) {
                        IPSearchView(vm: vm, isSearching: $isSearching)
                    }
                }

                Spacer()

                VStack(spacing: 20) {
                    Text("**IP**: \(vm.ipAddress)")
                    Text("\(vm.ipGeo.city), \(vm.ipGeo.country)")
                }
                .padding()
                .frame(width: 330)
                .background(.thickMaterial)
                .cornerRadius(10)
                .padding(.vertical, 50)

                HStack(spacing: 20) {
                    Button("Note 1") {
                        addNote()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)

                    Button("Note 2") {
                        addNote()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)

                    Button("Note 3") {
                        addNote()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                }
                .padding()

                HStack {
                    TextField("Enter IP Address", text: $manualIPAddress)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)

                    Button("Search IP") {
                        searchIPAddress()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
                }
            }
        }
    }

    private func addNote() {
        // Note functionality removed
    }

    private func searchIPAddress() {
        if !manualIPAddress.isEmpty {
            vm.searchIPAddress(ip: manualIPAddress)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
