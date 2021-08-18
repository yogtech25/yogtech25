
//  Created by rails on 17/08/21.
//

import Foundation

private typealias APIResponseHandler = (_ data: SearchResponse?, _ error : Error?)  -> Void

class ITuneService {
    
    func fetchWebList(_ completionHandler: @escaping (_ brands: SearchResponse?, _ error: NSError?) -> Void) {
        var request = URLRequest(url: URL(string: SDConstant().searchUrl)!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let picture = try JSONDecoder().decode(SearchResponse.self, from: data!)
                completionHandler(picture, nil)
            } catch {
                completionHandler(nil, error as NSError)
            }
        }).resume()
        completionHandler(nil, nil)
    }
}
