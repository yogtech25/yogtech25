
//  Created by rails on 17/08/21.
//

import Foundation

private typealias APIResponseHandler = (_ data: WebResponse?, _ error : Error?)  -> Void

class ITuneService {
    
    func fetchWebList(_ completionHandler: @escaping (_ brands: WebResponse?, _ error: NSError?) -> Void) {
        var request = URLRequest(url: URL(string: SDConstant().searchUrl)!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error -> Void in
            do {
                let picture = try JSONDecoder().decode(WebResponse.self, from: data!)
                completionHandler(picture, nil)
            } catch {
                completionHandler(nil, error as NSError)
            }
        }).resume()
        completionHandler(nil, nil)
    }
}
