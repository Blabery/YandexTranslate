import UIKit

let Url = URL(string: "https://translate.api.cloud.yandex.net/translate/v2/translate")

guard let requestURL = Url else { fatalError() }

var request = URLRequest(url: requestURL)
request.httpMethod = "POST"

if let path = Bundle.main.path(forResource: "body", ofType: "json") {
    let message: NSString = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
    
    guard let requestData = message.data(using: String.Encoding.utf8.rawValue) else {
        fatalError()
    }
    
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("Bearer t1.9euelZqVmpqZkJibiZ2Sk5KUnJfJmu3rnpWazMzPlpeRysuJz8zOnIvPk8vl8_d1dRV_-e8nSXAK_t3z9zUkE3_57ydJcAr-.2COgTF7zlJnjQocMoK-06swCTE5I5BSW4vktim9qIZvRagp9nnci8m8A1oMtbz4AT656jsdoFgVHhfYIYXDNAg", forHTTPHeaderField: "Authorization")
    request.httpBody = requestData
    
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in        
        if let data = data, let response = String(data: data, encoding: .utf8) {
            print(response)
        }
    }
    task.resume()
}

//Comment





 
