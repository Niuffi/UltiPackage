import Foundation

@available(iOS 13.0, *)
@available(macOS 10.15, *)

public class Game: Codable, ObservableObject {
    var opponent: String
    var date: Date
    var score = Score()
    var rules = Rules()
    var ended: Bool
    
    init(opponent: String, date: Date, ended: Bool) {
        self.opponent = opponent
        self.date = date
        self.ended = ended
    }
}

struct Score: Codable {
    private(set) var home = 0
    private(set) var away = 0
    
    init() {}
    
    init(home: Int, away: Int) {
        self.home = home
        self.away = away
    }
    
    mutating func homeScore() {
        home = home + 1
    }
    
    mutating func awayScore() {
        away = away + 1
    }
}

struct Rules: Codable {
    var gameTo = 15
    var softTimeCap = 100
    var cupPoint = true
    var timeOutsPerHalf = 2
}
