//
//  ContentView.swift
//  Soma
//
//  Created by James on 2/26/20.
//  Copyright © 2020 James. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    var body: some View {
        VStack{
            List{
                ForEach(students, id: \.id){ student in
                    Text(student.name ?? "unkown")
                }
            }
            Button("Add"){
                let firstName = ["James", "Jay", "jimmy"]
                let lastName = ["Kavia", "Burner", "Carager"]
                
                let pickedFname = firstName.randomElement()!
                let pickedLname = lastName.randomElement()!
                
                let student = Student(context: self.moc)
                student.id = UUID()
                student.name = "\(pickedFname) \(pickedLname)"
                
                try? self.moc.save()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
