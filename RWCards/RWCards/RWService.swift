/*
* Copyright (c) 2016 Razeware LLC
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/

import Foundation
import Alamofire

class RWService {
	static let shared = RWService()
  let url = "http://127.0.0.1:5000"
	private init() { }
  
  func getCurrentUser(_ completion: @escaping (Contact?) -> ()) {
    let path = "/currentUser"
    Alamofire.request("\(url)\(path)").responseData { (response) in
      if let data = response.result.value {
        let contact = try! Contact(serializedData: data)
        return completion(contact)
      }
      completion(.none)
    }
  }
  
  func getSpeakers(_ completion: @escaping (Speakers?) -> ()) {
    let path = "/speakers"
    Alamofire.request("\(url)\(path)").responseData { (response) in
      if let data = response.result.value {
        let speakers = try? Speakers(serializedData: data)
        return completion(speakers)
      }
      completion(.none)
    }
  }
}
