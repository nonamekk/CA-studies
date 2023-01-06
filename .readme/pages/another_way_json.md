<a href="../../README.md">
<img 
src="../../.readme/assets/codeacademy-white.svg" 
height="42">
</a>

## JSON parsing with examples

> Define properties you need, parsing will ignore the rest

> Optionals can be either ignored or set

Following example from SwiftLee post:
```
let JSON = """
"title": "Optionals in Swift explained: 5 things you should know",
    "url": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/",
    "category": "swift",
    "views": 47093
"""
```

To decode this JSON, struct must have <code>Decodable</code> protocol. To encode - <code>Encodable</code>

```Swift
struct BlogPost: Decodable {
    enum Category: String, Decodable {
        case swift, combine, debugging, xcode
    }

    let title: String
    let url: URL
    let category: Category
    let views: Int
}
```

Example of decode:
```Swift
let jsonData = JSON.data(using: .utf8)!
let blogPost: BlogPost = try! JSONDecoder()
.decode(BlogPost.self, from: jsonData)

// Prints: "Optionals in Swift explained: 
// 5 things you should know"
print(blogPost.title) 

```

#### Decoding JSON arrays
```Swift
let JSONArray = """
[{
    "title": "Optionals in Swift explained: 5 things you should know",
    "url": "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/"
},
{
    "title": "EXC_BAD_ACCESS crash error: Understanding and solving it",
    "url": "https://www.avanderlee.com/swift/exc-bad-access-crash/"
},
{
    "title": "Thread Sanitizer explained: Data Races in Swift",
    "url": "https://www.avanderlee.com/swift/thread-sanitizer-data-races/"
}]
"""
```

We can parse this list of blog posts by defining the decodable type as <code>[BlogPost].self</code>:
```Swift
struct BlogPost: Decodable {
    let title: String
    let url: URL
}

let blogPosts: [BlogPost] = try! 
JSONDecoder()
.decode([BlogPost].self, from: jsonData)

print(blogPosts.count) // Prints: 3
```

#### Mapping JSON keys to custom property names
Taking the previous JSON example, it could be that we would like to name <code>url</code> as <code>htmlLink</code> in our JSON model. We can create this mapping by defining a custom <code>CodingKeys</code> enum: 
```Swift
struct BlogPost: Decodable {
    enum Category: String, Decodable {
        case swift, combine, debugging, xcode
    }

    enum CodingKeys: String, CodingKey {
        case title, category, views
        // Map the JSON key "url" to the Swift property name "htmlLink"
        case htmlLink = "url"
    }

    let title: String
    let htmlLink: URL
    let category: Category
    let views: Int
}


let blogPost: BlogPost = try! JSONDecoder().decode(BlogPost.self, from: jsonData)
print(blogPost.htmlLink) // Prints: "https://www.avanderlee.com/swift/optionals-in-swift-explained-5-things-you-should-know/"

```
Now we have defined JSON key <code>url</code> to the Swift property name <code>htmlLink</code>

#### Conversion between came case and snake case
A common reason to define custom mapping for keys is that backend you're using uses snake case for naming properties. In Swift, we're mostly using camel case which means wthat we start with a lowercase letter and then capitalize the first letter of subsequent words: <code>htmlLink</code> or <code>numberOfBlogPosts</code>.

Luckily enough, we don't have to define a custom mapping for each defined key. 

We can easily decode that JSON by setting the <code>keyEncodingStrategy</code> of our decoder to <code>.convertFromSnakeCase</code>:

```Swift
struct Blog: Decodable {
    let title: String
    let url: URL
    let totalVisitors: Int
    let numberOfPosts: Int
}

let decoder = JSONDecoder()
decoder.keyDecodingStrategy = .convertFromSnakeCase

let blog: Blog = try! decoder.decode(Blog.self, from: jsonData)
print(blog.numberOfPosts) // Prints: 47093

```

Previous mapping <code>url</code> to <code>htmlLink</code> would also work in this case. 

#### Decoding JSON dates with custom formats
Same as we did converting camel case to snake case, can be done here, converting date String from one type to another, using conversion strategy.

```Swift
struct BlogPost: Decodable {
    let title: String
    let date: Date
}

let decoder = JSONDecoder()
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
dateFormatter.locale = Locale(identifier: "en_US")
dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
decoder.dateDecodingStrategy = .formatted(dateFormatter)

let blogPost: BlogPost = try! decoder.decode(BlogPost.self, from: jsonData)
print(blogPost.date) // Prints: 2019-10-21 09:15:00 +0000

```

There are a few other strategies available to set:

- <code>deferredToDate</code>: Uses Apple’s own data format that tracks the number of seconds and milliseconds since January 1st of 2001. This is mainly useful to use directly with Apple’s platforms.
- <code>millisecondsSince1970</code>: This format tracks the number of seconds and milliseconds since January 1st of 1970 and is a lot more common to use.
- <code>secondsSince1970</code>: Tracks the numbers of seconds since January 1st of 1970.
- <code>iso8601</code>: Decodes the Date as an ISO-8601-formatted string (in RFC 3339 format).

Depending on how the API you’re using returns the dates you can choose between those strategies.


---
Source: [Avaderlee](https://www.avanderlee.com/swift/json-parsing-decoding/)
