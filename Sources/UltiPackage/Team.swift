import Foundation

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public class Team: Codable, ObservableObject {
    let name: String
    @Published private(set) var players = [Player]()
    
    public init(name: String) throws {
        guard name != "" else {
            throw TeamError.nameIsEmpty
        }
        self.name = name
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        players = try container.decode([Player].self, forKey: .players)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(players, forKey: .players)
    }
    
    public func addPlayer(name: String, surname: String, gedner: Bool, number: Int) throws {
        guard !players.contains(where: {$0.number == number}) else {
            throw TeamError.numberIsInUse
        }
    }
    
    public func removePlayer(number: Int) {
        players.removeAll(where: {$0.number == number})
    }
    
    enum TeamError: Error {
        case nameIsEmpty
        case numberIsInUse
    }
    
    enum CodingKeys: CodingKey {
        case name
        case players
    }
}
