<a href="../../README.md">
<img src="../../.readme/assets/codeacademy-white.svg" height="42">
</a>

## UserDefaults
[UserDefaults](https://developer.apple.com/documentation/foundation/userdefaults) can be used to store small data locally on the device. It is commonly used for app settings or user preferences, through the use of key-value pairs and user's database.<br><br>
The *key* can only be of type <code>String</code><br>
The *value* can be of type <code>Data</code>, <code>String</code>, <code>Number</code>, <code>Date</code>, <code>Array</code>, <code>Dictionary</code>.

#### To initialize:
```swift
let defaults = UserDefaults.standard
```

#### Writing data to UserDefaults

```swift
defaults.set(22, forKey: "someNumber")
```

#### Obtaining the data from UserDefaults

```swift
let number = defaults.integer(forKey: "someNumber")
let string = defaults.string(forKey: "someString")
let array = defaults.array(forKey: "someArray")
let dictionary = defaults.dictionary(forKey: "someDictionary")
```

### Storing custom objects in UserDefaults
In order to store custom objects like <code>struct</code> one must conform to the <code>Codable</code> protocol to allow convertation to other representations.
```swift
struct Pringles: Codable {
    let chips: Int
    let crusts: Int
}
```

#### Converting <code>struct</code> data to JSON String, using 
implementation from [StackOverflow](https://stackoverflow.com/a/66788590).
```swift
extension Encodable {
    
    func toJSONString() -> String {
        let jsonData = try! JSONEncoder().encode(self)
        return String(data: jsonData, encoding: .utf8)!
    }
    
}
func instantiate<T: Decodable>(jsonString: String) -> T? {
    return try? JSONDecoder()
    .decode(T.self, from: jsonString.data(using: .utf8)!)
}
```

#### Storing and reading in/from UserDefaults
```swift
let newBox: [Pringles] = [Pringles(chips: 20, crusts: 100)]
let jsonString = newBox.toJSONString()
defaults.set(jsonString, forKey: "jsonInput")

print(defaults.string(forKey: "jsonInput")!)

let jFromDefault = defaults.string(forKey: "jsonInput")!
let newBoxFromDefault: [Pringles]? = instantiate(
    jsonString: jFromDefault ?? ""
)
if let box = newBoxFromDefault {
    print(box[0].crusts)
}
``` 
