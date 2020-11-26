//  Created by XinW on 2020/11/25.
//
//  Copyright © 2020 XinW. All rights reserved.
//

import Foundation

struct Claim : Codable {
    var id : UUID?
    var title : String
    var date : String
    var isSolved : Bool?
}

struct ClaimService {
    func addClaim(_ pObj: Claim, onSuccess: @escaping () -> Void, onFailure: @escaping ()-> Void) {
        let requestUrl = "http://localhost:8020/ClaimService/add"
        var request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let jsonData : Data! = try! JSONEncoder().encode(pObj)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let task = URLSession.shared.uploadTask(with: request, from: jsonData) {
            (data, response, error) in
            if let resp = data {
                let respStr = String(bytes: resp, encoding: .utf8)
                print("The response data sent from the server is \(respStr!)")
                DispatchQueue.main.async {
                    onSuccess()
                }
            } else if let respError = error {
                print("Server Error : \(respError)")
                DispatchQueue.main.async {
                    onFailure()
                }
            }
        }
        task.resume()
    }
}
