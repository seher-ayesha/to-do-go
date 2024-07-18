//
//  AddView.swift
//  ToDoGo
//
//  Created by Seher Ayesha on 14/02/2024.
//

import SwiftUI
import UIKit

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var textFieldText: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("What's Next?", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    
                Button(action: saveButtonPressed, label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth:.infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add a Task")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed(){
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate () -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new To Do task must be at least 3 characters long."
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            NavigationView{
                AddView()
            }
            .preferredColorScheme(.light)
            .environmentObject(ListViewModel())
            
            NavigationView{
                AddView()
            }
            .preferredColorScheme(.dark)
            .environmentObject(ListViewModel())
        }
    }
}
