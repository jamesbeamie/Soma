//
//  AddBookView.swift
//  Tusome
//
//  Created by James on 3/12/20.
//  Copyright © 2020 James. All rights reserved.
//

import SwiftUI

struct AddBookView: View{
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var review = ""
    @State private var genre = ""
    
    
    let genres = ["Comic", "Fantasy","Comedy", "Romance", "Crime", "Politics", "Kids"]
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                    
                    Picker("Genre", selection: $genre){
                        ForEach(genres, id: \.self){
                            Text($0)
                        }
                    }
                }
                Section{
                    Picker("Rating", selection: $rating){
                        ForEach(0..<11){
                            Text("\($0)")
                        }
                    }
                    TextField("Leave a Review", text:$review)
                }
                Section{
                    Button("Save"){
                        let newBook = Book(context: self.moc)
                        newBook.title = self.title
                        newBook.author = self.author
                        newBook.rating = Int16(self.rating)
                        newBook.review = self.review
                        newBook.genre = self.genre
                        
                        try? self.moc.save()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        .navigationBarTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
