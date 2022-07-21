//
//  JournalEntry.swift
//  Mountain Journal
//
//  Created by Tristan Meyer on 7/21/22.
//

import Foundation

struct JournalEntry: Codable, Hashable {
    var author: String // Temporary, will take name from user data
    var title: String
    var body: String
    var location: String //Temporary, Don't know what to put here
    
    init(author: String, title: String, body: String, location: String) {
        self.author = author
        self.title = title
        self.body = body
        self.location = location
    }
}

extension JournalEntry {
    static let sampleData: [JournalEntry] =
    [
        JournalEntry(author: "Tristan", title: "First Journal", body: "This is the first entry, testing out different distance and what type looks like maybe more than one line idk just figuring it out just need a couple more words ", location: "Temporary"),
        JournalEntry(author: "Otis", title: "Otis's dumb Journal", body: "This one is going to be one line", location: "Temporary"),
        JournalEntry(author: "Test", title: "Last Journal", body: "This is the third entry lets see what around two lines looks like hopefully", location: "Temporary")
    ]
}
