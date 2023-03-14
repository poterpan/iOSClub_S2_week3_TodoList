//
//  AddView.swift
//  week3
//
//  Created by Poter Pan on 2023/3/13.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var addingItemText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("輸入代辦事項", text: $addingItemText)
                    .padding(.horizontal)
                    .frame(height: 55)
    //                .background(Color(UIColor.secondarySystemBackground))
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                
                Button {
                    saveButtonPressed()
                } label: {
                    Text("SAVE")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                }

            }
            .padding()
        }
        .navigationTitle("Add an Item")
    }
    
    func saveButtonPressed() {
        listViewModel.addItem(title: addingItemText)
        // Back to Main Page
        presentationMode.wrappedValue.dismiss()

    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
                .environmentObject(ListViewModel())
        }
    }
}
