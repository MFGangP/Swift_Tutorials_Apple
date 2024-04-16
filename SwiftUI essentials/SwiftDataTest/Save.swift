//
//  Save.swift
//  SwiftDataTest
//
//  Created by lovehyun95 on 4/16/24.
//
// Codable = key 와 value를 구분 할 수 있게 해주는 값, 인코딩 디코딩 다 가능해짐
// Identifiable =

import SwiftUI

struct Save: View {
    @State private var people = [Person]()
    @State private var newName: String = ""
    
    var body: some View {
        VStack {
            List(people, id: \.id) { person in
                Text(person.name)
            }
            TextField("Enter new name", text: $newName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Add Name") {
                let newPerson = Person(name: newName)
                people.append(newPerson)
                newName = ""  // Clear the text field
            }
            Button("Save Names") {
                saveNames()
            }
            Button("Load Names") {
                loadNames()
            }
        }
       //.onAppear(perform: loadNames)
    }
    
    func saveNames() {
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("names.json")
        if let data = try? JSONEncoder().encode(people) {
            try? data.write(to: fileURL)
        }
    }
    
    func loadNames() {
        let fileURL = getDocumentsDirectory().appendingPathComponent("names.json")
        if let data = try? Data(contentsOf: fileURL) {
            if let decoded = try? JSONDecoder().decode([Person].self, from: data) {
                self.people = decoded
            }
        }
    }

    func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}

struct Person: Codable, Identifiable {
    var id = UUID()
    let name: String
}


#Preview {
    Save()
}
