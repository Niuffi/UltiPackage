import XCTest
@testable import UltiPackage

@available(iOS 13.0, *)
@available(macOS 10.15, *)

final class UltiPackageTests: XCTestCase {
    
    func JSONtest() throws {
        let newPlayer = try Player(name: "Name", surname: "Surname", gender: true, number: 21)
        
        //encoding
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(newPlayer)
        debugPrint(String(data: data, encoding: .utf8)!)
        
        //decoding
        let decoder = JSONDecoder()
        let newPlayer2 = try decoder.decode(Player.self, from: data)
        
        print(newPlayer2)
    }
    
    func JsonPlayerTest() throws {
        let newPlayer = try Player(name: "Jake", surname: "Smith", gender: true, number: 21)
        
        //encoding
        let encoder = JSONEncoder()
        let data = try encoder.encode(newPlayer)
        debugPrint(String(data: data, encoding: .utf8)!)
        
        //decoding
        let decoder = JSONDecoder()
        let newPlayer2 = try decoder.decode(Player.self, from: data)
        
        print(newPlayer2)
    }
    
    func JsonTeamTest() throws {
        let surnames: [String] = ["Smith", "Jones", "Brown", "Williams", "Johnson", "Brown"]
        let names: [String] = ["James", "John", "Robert", "Michael", "Anna", "Jake", "Charlotte", "Sophia", "Amelia"]
        
        let newTeam = try Team(name: "Testers Team")
        
        for _ in 1...28 {
            try newTeam.addPlayer(name: names.randomElement()!, surname: surnames.randomElement()!, gedner: Bool.random(), number: Int.random(in: 0...99))
        }
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(newTeam)
        print(String(data: data, encoding: .utf8)!)
    }
}
