import Foundation

class Player: Person {
    private(set) var number: Int
    var numberString: String {
        get {
            if number < 10 {
                return "#\(number)"
            }
            else {
                return "#0\(number)"
            }
        }
    }
    
    init(name: String, surname: String, gender: Bool, number: Int) throws {
        
        guard 0...99 ~= number else {
            throw PlayerError.numberOutOfRange
        }
        
        self.number = number
        try super.init(name: name, surname: surname, gender: gender)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = try container.decode(Int.self, forKey: .number)
        try super.init(from: decoder)
        
    }
    
    override func encode(to encoder: Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(number, forKey: .number)
        try container.encode(name, forKey: .name)
        try container.encode(surname, forKey: .surname)
        try container.encode(gender, forKey: .gender)
     
    }
    
    private enum CodingKeys: String, CodingKey {
        case number
        case name
        case surname
        case gender
    }
    
    enum PlayerError: Error {
        case numberOutOfRange
    }
}
