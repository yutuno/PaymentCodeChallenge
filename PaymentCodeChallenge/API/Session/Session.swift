//
//  Session.swift
//  PaymentCodeChallenge
//
//  Created by yuto on 2019/05/20.
//  Copyright © 2019 yuto. All rights reserved.
//

import Foundation

final class Session {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    @discardableResult
    func send<T: Request>(
        _ request: T,
        completion: @escaping (Result<T.Response, Error>) -> Void
        ) -> URLSessionTask? {
        
        let url = request.baseURL.appendingPathComponent(request.path)
        
        guard var components = URLComponents(
            url: url,
            resolvingAgainstBaseURL: true
            ) else {
                completion(.failure(SessionError.failedToCreateComponents(url)))
                return nil
        }
        
        components.queryItems = request.parameters.compactMap(URLQueryItem.init)
        
        guard let urlRequest = components.url.map({ URLRequest(url: $0) }) else {
            completion(.failure(SessionError.failedToCreateURL(components)))
            return nil
        }
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(SessionError.noResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(SessionError.noData(response)))
                return
            }
            
            guard 200..<300 ~= response.statusCode else {
                let message = try? JSONDecoder().decode(
                    SessionError.Message.self,
                    from: data
                )
                completion(
                    .failure(
                        SessionError.unacceptableStatusCode(
                            response.statusCode,
                            message
                        )
                    )
                )
                
                return
            }
            
            do {
                let object = try JSONDecoder().decode(T.Response.self, from: data)
                completion(.success(object))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
        
        return task
    }
}
