//
//  IPSearch.swift
//  projectDev
//
//  Created by iosdev on 3.12.2023.
//

import SwiftUI

struct IPSearchView: View {
    @ObservedObject var vm: ContentView.ViewModel
    @Binding var isSearching: Bool
    @State private var enteredIPAddress: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter IP Address", text: $enteredIPAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Search") {
                vm.searchIPAddress(ip: enteredIPAddress)
                isSearching.toggle()
            }
            .padding()
           
            
            Spacer()
        }
        .padding()
    }
}

struct IPSearchView_Previews: PreviewProvider {
    static var previews: some View {
        IPSearchView(vm: ContentView.ViewModel(), isSearching: .constant(true))
    }
}
