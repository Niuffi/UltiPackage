import Foundation

class Person: Codable {
    let name: String
    let surname: String
    let gender: Bool
    
    init(name: String, surname: String, gedner: Bool) throws {
        
        guard name != "" else {
            throw PersonError.nameIsEmpty
        }
        
        guard surname != "" else {
            throw PersonError.nameIsEmpty
        }
        
        self.name = name
        self.surname = surname
        self.gender = gedner
    }
    
    private enum CodingKeys: String, CodingKey {
            case name
            case surname
            case gender
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        surname = try container.decode(String.self, forKey: .surname)
        gender = try container.decode(Bool.self, forKey: .gender)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.surname, forKey: .surname)
        try container.encode(self.gender, forKey: .gender)
    }
    
    enum PersonError: Error {
        case nameIsEmpty
        case surnameIsEmpty
    }
    
}



