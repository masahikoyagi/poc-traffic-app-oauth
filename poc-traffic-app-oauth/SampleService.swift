//
//  SampleService.swift
//  poc-traffic-app-oauth
//
//  Created by 八木真彦 on 2019/07/14.
//  Copyright © 2019 八木真彦. All rights reserved.
//

import Foundation

class SampleService {
    
    func connectAPI(url: String,token: String , completion: @escaping (ResponseData?) -> ()) {
        
        var param = [String: Any]()
        param[""] = ""
        
        var urlRequest = URLRequest(url: URL(string: url)!)
        urlRequest.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("token " + token, forHTTPHeaderField: "Authorization")
        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: param)
        urlRequest.httpMethod = "POST"
        let res = httpRequest(request: urlRequest)
        let response = try? JSONDecoder().decode(ResponseData.self, from: res.data)
        if let response = response {
            DispatchQueue.main.async {
                completion(response)
            }
        }
    }
    
    /// http 通信を行う
    ///
    /// - Parameter request: 送信する設定等
    /// - Returns: レスポンスデータ
    func httpRequest(request:URLRequest) -> (data:Data, response:URLResponse){
        let semaphore = DispatchSemaphore(value: 0)
        var returnData = Data()
        var returnResponse = URLResponse()
        
        let task = URLSession.shared.dataTask(with: request) {data, response, err in
            if let data = data{
                returnData = data
                returnResponse = response!
                semaphore.signal()
            }
        }
        
        task.resume()
        
        // タイムアウト指定
        switch semaphore.wait(wallTimeout: .now() + 60) {
        case .timedOut:
            return (Data(), URLResponse())
        default:
            break
        }
        
        return (returnData, returnResponse)
    }
}
