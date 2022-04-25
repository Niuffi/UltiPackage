import XCTest
@testable import UltiPackage

final class UltiPackageTests: XCTestCase {
    
    func JSONtest() throws {
        let newPlayer = try Player(name: "Name", surname: "Surname", gedner: true, number: 21)
        
        //encoding
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(newPlayer)
        print(String(data: data, encoding: .utf8)!)
        
        //decoding
        let decoder = JSONDecoder()
        let _ = try decoder.decode(Player.self, from: data)
    }
}
