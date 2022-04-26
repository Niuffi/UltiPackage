import Foundation

public class Team: Codable {
    private(set) var players = [Player]()
    
    func addPlayer(name: String, surname: String, gedner: Bool, number: Int) throws {
        guard !players.contains(where: {$0.number == number}) else {
            throw TeamError.numberIsInUse
        }
    }
    
    func removePlayer(number: Int) {
        players.removeAll(where: {$0.number == number})
    }
    
    enum TeamError: Error {
        case numberIsInUse
    }
}
