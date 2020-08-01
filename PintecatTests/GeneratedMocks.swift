// MARK: - Mocks generated from file: Pintecat/Services/CatService.swift at 2020-08-01 22:40:40 +0000

//
//  CatService.swift
//  Pintecat
//
//  Created by John Lenon Souza dos Reis on 25/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import Cuckoo
@testable import Pintecat

import Foundation


 class MockCatServiceProtocol: CatServiceProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = CatServiceProtocol
    
     typealias Stubbing = __StubbingProxy_CatServiceProtocol
     typealias Verification = __VerificationProxy_CatServiceProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: CatServiceProtocol?

     func enableDefaultImplementation(_ stub: CatServiceProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func directLink() -> String {
        
    return cuckoo_manager.call("directLink() -> String",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.directLink())
        
    }
    
    
    
     func directExtension() -> String {
        
    return cuckoo_manager.call("directExtension() -> String",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.directExtension())
        
    }
    
    
    
     func directLink(to cover: String) -> String {
        
    return cuckoo_manager.call("directLink(to: String) -> String",
            parameters: (cover),
            escapingParameters: (cover),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.directLink(to: cover))
        
    }
    

	 struct __StubbingProxy_CatServiceProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func directLink() -> Cuckoo.ProtocolStubFunction<(), String> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCatServiceProtocol.self, method: "directLink() -> String", parameterMatchers: matchers))
	    }
	    
	    func directExtension() -> Cuckoo.ProtocolStubFunction<(), String> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCatServiceProtocol.self, method: "directExtension() -> String", parameterMatchers: matchers))
	    }
	    
	    func directLink<M1: Cuckoo.Matchable>(to cover: M1) -> Cuckoo.ProtocolStubFunction<(String), String> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: cover) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCatServiceProtocol.self, method: "directLink(to: String) -> String", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_CatServiceProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func directLink() -> Cuckoo.__DoNotUse<(), String> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("directLink() -> String", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func directExtension() -> Cuckoo.__DoNotUse<(), String> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("directExtension() -> String", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func directLink<M1: Cuckoo.Matchable>(to cover: M1) -> Cuckoo.__DoNotUse<(String), String> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: cover) { $0 }]
	        return cuckoo_manager.verify("directLink(to: String) -> String", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class CatServiceProtocolStub: CatServiceProtocol {
    

    

    
     func directLink() -> String  {
        return DefaultValueRegistry.defaultValue(for: (String).self)
    }
    
     func directExtension() -> String  {
        return DefaultValueRegistry.defaultValue(for: (String).self)
    }
    
     func directLink(to cover: String) -> String  {
        return DefaultValueRegistry.defaultValue(for: (String).self)
    }
    
}



 class MockCatService: CatService, Cuckoo.ClassMock {
    
     typealias MocksType = CatService
    
     typealias Stubbing = __StubbingProxy_CatService
     typealias Verification = __VerificationProxy_CatService

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: CatService?

     func enableDefaultImplementation(_ stub: CatService) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func directLink() -> String {
        
    return cuckoo_manager.call("directLink() -> String",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.directLink()
                ,
            defaultCall: __defaultImplStub!.directLink())
        
    }
    
    
    
     override func directExtension() -> String {
        
    return cuckoo_manager.call("directExtension() -> String",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.directExtension()
                ,
            defaultCall: __defaultImplStub!.directExtension())
        
    }
    
    
    
     override func directLink(to cover: String) -> String {
        
    return cuckoo_manager.call("directLink(to: String) -> String",
            parameters: (cover),
            escapingParameters: (cover),
            superclassCall:
                
                super.directLink(to: cover)
                ,
            defaultCall: __defaultImplStub!.directLink(to: cover))
        
    }
    

	 struct __StubbingProxy_CatService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func directLink() -> Cuckoo.ClassStubFunction<(), String> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCatService.self, method: "directLink() -> String", parameterMatchers: matchers))
	    }
	    
	    func directExtension() -> Cuckoo.ClassStubFunction<(), String> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockCatService.self, method: "directExtension() -> String", parameterMatchers: matchers))
	    }
	    
	    func directLink<M1: Cuckoo.Matchable>(to cover: M1) -> Cuckoo.ClassStubFunction<(String), String> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: cover) { $0 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockCatService.self, method: "directLink(to: String) -> String", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_CatService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func directLink() -> Cuckoo.__DoNotUse<(), String> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("directLink() -> String", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func directExtension() -> Cuckoo.__DoNotUse<(), String> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("directExtension() -> String", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	    @discardableResult
	    func directLink<M1: Cuckoo.Matchable>(to cover: M1) -> Cuckoo.__DoNotUse<(String), String> where M1.MatchedType == String {
	        let matchers: [Cuckoo.ParameterMatcher<(String)>] = [wrap(matchable: cover) { $0 }]
	        return cuckoo_manager.verify("directLink(to: String) -> String", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class CatServiceStub: CatService {
    

    

    
     override func directLink() -> String  {
        return DefaultValueRegistry.defaultValue(for: (String).self)
    }
    
     override func directExtension() -> String  {
        return DefaultValueRegistry.defaultValue(for: (String).self)
    }
    
     override func directLink(to cover: String) -> String  {
        return DefaultValueRegistry.defaultValue(for: (String).self)
    }
    
}


// MARK: - Mocks generated from file: Pintecat/Services/ImageService.swift at 2020-08-01 22:40:40 +0000

//
//  ImageService.swift
//  Pintecat
//
//  Created by John Lenon Souza dos Reis on 23/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import Cuckoo
@testable import Pintecat

import Alamofire
import AlamofireImage


 class MockImageServiceProtocol: ImageServiceProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = ImageServiceProtocol
    
     typealias Stubbing = __StubbingProxy_ImageServiceProtocol
     typealias Verification = __VerificationProxy_ImageServiceProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: ImageServiceProtocol?

     func enableDefaultImplementation(_ stub: ImageServiceProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func downloadImage(from url: String, completion: @escaping (AFDataResponse<Image>) -> Void)  {
        
    return cuckoo_manager.call("downloadImage(from: String, completion: @escaping (AFDataResponse<Image>) -> Void)",
            parameters: (url, completion),
            escapingParameters: (url, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.downloadImage(from: url, completion: completion))
        
    }
    

	 struct __StubbingProxy_ImageServiceProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func downloadImage<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(from url: M1, completion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(String, (AFDataResponse<Image>) -> Void)> where M1.MatchedType == String, M2.MatchedType == (AFDataResponse<Image>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (AFDataResponse<Image>) -> Void)>] = [wrap(matchable: url) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockImageServiceProtocol.self, method: "downloadImage(from: String, completion: @escaping (AFDataResponse<Image>) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ImageServiceProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func downloadImage<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(from url: M1, completion: M2) -> Cuckoo.__DoNotUse<(String, (AFDataResponse<Image>) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == (AFDataResponse<Image>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (AFDataResponse<Image>) -> Void)>] = [wrap(matchable: url) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return cuckoo_manager.verify("downloadImage(from: String, completion: @escaping (AFDataResponse<Image>) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ImageServiceProtocolStub: ImageServiceProtocol {
    

    

    
     func downloadImage(from url: String, completion: @escaping (AFDataResponse<Image>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockImageService: ImageService, Cuckoo.ClassMock {
    
     typealias MocksType = ImageService
    
     typealias Stubbing = __StubbingProxy_ImageService
     typealias Verification = __VerificationProxy_ImageService

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: ImageService?

     func enableDefaultImplementation(_ stub: ImageService) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func downloadImage(from url: String, completion: @escaping (AFDataResponse<Image>) -> Void)  {
        
    return cuckoo_manager.call("downloadImage(from: String, completion: @escaping (AFDataResponse<Image>) -> Void)",
            parameters: (url, completion),
            escapingParameters: (url, completion),
            superclassCall:
                
                super.downloadImage(from: url, completion: completion)
                ,
            defaultCall: __defaultImplStub!.downloadImage(from: url, completion: completion))
        
    }
    

	 struct __StubbingProxy_ImageService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func downloadImage<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(from url: M1, completion: M2) -> Cuckoo.ClassStubNoReturnFunction<(String, (AFDataResponse<Image>) -> Void)> where M1.MatchedType == String, M2.MatchedType == (AFDataResponse<Image>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (AFDataResponse<Image>) -> Void)>] = [wrap(matchable: url) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockImageService.self, method: "downloadImage(from: String, completion: @escaping (AFDataResponse<Image>) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_ImageService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func downloadImage<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(from url: M1, completion: M2) -> Cuckoo.__DoNotUse<(String, (AFDataResponse<Image>) -> Void), Void> where M1.MatchedType == String, M2.MatchedType == (AFDataResponse<Image>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(String, (AFDataResponse<Image>) -> Void)>] = [wrap(matchable: url) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return cuckoo_manager.verify("downloadImage(from: String, completion: @escaping (AFDataResponse<Image>) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class ImageServiceStub: ImageService {
    

    

    
     override func downloadImage(from url: String, completion: @escaping (AFDataResponse<Image>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}


// MARK: - Mocks generated from file: Pintecat/Services/NetworkAuthService.swift at 2020-08-01 22:40:40 +0000

//
//  NetworkAuthService.swift
//  Pintecat
//
//  Created by John Lenon Souza dos Reis on 25/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import Cuckoo
@testable import Pintecat

import Alamofire
import Foundation


 class MockNetworkAuthServiceProtocol: NetworkAuthServiceProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = NetworkAuthServiceProtocol
    
     typealias Stubbing = __StubbingProxy_NetworkAuthServiceProtocol
     typealias Verification = __VerificationProxy_NetworkAuthServiceProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NetworkAuthServiceProtocol?

     func enableDefaultImplementation(_ stub: NetworkAuthServiceProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func buildHeaders() -> HTTPHeaders {
        
    return cuckoo_manager.call("buildHeaders() -> HTTPHeaders",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.buildHeaders())
        
    }
    

	 struct __StubbingProxy_NetworkAuthServiceProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func buildHeaders() -> Cuckoo.ProtocolStubFunction<(), HTTPHeaders> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkAuthServiceProtocol.self, method: "buildHeaders() -> HTTPHeaders", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_NetworkAuthServiceProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func buildHeaders() -> Cuckoo.__DoNotUse<(), HTTPHeaders> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("buildHeaders() -> HTTPHeaders", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class NetworkAuthServiceProtocolStub: NetworkAuthServiceProtocol {
    

    

    
     func buildHeaders() -> HTTPHeaders  {
        return DefaultValueRegistry.defaultValue(for: (HTTPHeaders).self)
    }
    
}



 class MockNetworkAuthService: NetworkAuthService, Cuckoo.ClassMock {
    
     typealias MocksType = NetworkAuthService
    
     typealias Stubbing = __StubbingProxy_NetworkAuthService
     typealias Verification = __VerificationProxy_NetworkAuthService

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: NetworkAuthService?

     func enableDefaultImplementation(_ stub: NetworkAuthService) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     override func buildHeaders() -> HTTPHeaders {
        
    return cuckoo_manager.call("buildHeaders() -> HTTPHeaders",
            parameters: (),
            escapingParameters: (),
            superclassCall:
                
                super.buildHeaders()
                ,
            defaultCall: __defaultImplStub!.buildHeaders())
        
    }
    

	 struct __StubbingProxy_NetworkAuthService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func buildHeaders() -> Cuckoo.ClassStubFunction<(), HTTPHeaders> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkAuthService.self, method: "buildHeaders() -> HTTPHeaders", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_NetworkAuthService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func buildHeaders() -> Cuckoo.__DoNotUse<(), HTTPHeaders> {
	        let matchers: [Cuckoo.ParameterMatcher<Void>] = []
	        return cuckoo_manager.verify("buildHeaders() -> HTTPHeaders", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class NetworkAuthServiceStub: NetworkAuthService {
    

    

    
     override func buildHeaders() -> HTTPHeaders  {
        return DefaultValueRegistry.defaultValue(for: (HTTPHeaders).self)
    }
    
}


// MARK: - Mocks generated from file: Pintecat/Services/NetworkService.swift at 2020-08-01 22:40:40 +0000

//
//  NetworkService.swift
//  Pintecat
//
//  Created by John Lenon Souza dos Reis on 23/07/20.
//  Copyright © 2020 John Lenon Souza dos Reis. All rights reserved.
//

import Cuckoo
@testable import Pintecat

import Alamofire


 class MockNetworkServiceProtocol: NetworkServiceProtocol, Cuckoo.ProtocolMock {
    
     typealias MocksType = NetworkServiceProtocol
    
     typealias Stubbing = __StubbingProxy_NetworkServiceProtocol
     typealias Verification = __VerificationProxy_NetworkServiceProtocol

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: false)

    
    private var __defaultImplStub: NetworkServiceProtocol?

     func enableDefaultImplementation(_ stub: NetworkServiceProtocol) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    

    

    
    
    
     func fetchCats(page: Int, completion: @escaping (DataResponse<CatResult, AFError>) -> Void)  {
        
    return cuckoo_manager.call("fetchCats(page: Int, completion: @escaping (DataResponse<CatResult, AFError>) -> Void)",
            parameters: (page, completion),
            escapingParameters: (page, completion),
            superclassCall:
                
                Cuckoo.MockManager.crashOnProtocolSuperclassCall()
                ,
            defaultCall: __defaultImplStub!.fetchCats(page: page, completion: completion))
        
    }
    

	 struct __StubbingProxy_NetworkServiceProtocol: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    func fetchCats<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(page: M1, completion: M2) -> Cuckoo.ProtocolStubNoReturnFunction<(Int, (DataResponse<CatResult, AFError>) -> Void)> where M1.MatchedType == Int, M2.MatchedType == (DataResponse<CatResult, AFError>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, (DataResponse<CatResult, AFError>) -> Void)>] = [wrap(matchable: page) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkServiceProtocol.self, method: "fetchCats(page: Int, completion: @escaping (DataResponse<CatResult, AFError>) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_NetworkServiceProtocol: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	
	    
	    @discardableResult
	    func fetchCats<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(page: M1, completion: M2) -> Cuckoo.__DoNotUse<(Int, (DataResponse<CatResult, AFError>) -> Void), Void> where M1.MatchedType == Int, M2.MatchedType == (DataResponse<CatResult, AFError>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, (DataResponse<CatResult, AFError>) -> Void)>] = [wrap(matchable: page) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return cuckoo_manager.verify("fetchCats(page: Int, completion: @escaping (DataResponse<CatResult, AFError>) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class NetworkServiceProtocolStub: NetworkServiceProtocol {
    

    

    
     func fetchCats(page: Int, completion: @escaping (DataResponse<CatResult, AFError>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}



 class MockNetworkService: NetworkService, Cuckoo.ClassMock {
    
     typealias MocksType = NetworkService
    
     typealias Stubbing = __StubbingProxy_NetworkService
     typealias Verification = __VerificationProxy_NetworkService

     let cuckoo_manager = Cuckoo.MockManager.preconfiguredManager ?? Cuckoo.MockManager(hasParent: true)

    
    private var __defaultImplStub: NetworkService?

     func enableDefaultImplementation(_ stub: NetworkService) {
        __defaultImplStub = stub
        cuckoo_manager.enableDefaultStubImplementation()
    }
    

    
    
    
     override var networkAuthService: NetworkAuthServiceProtocol {
        get {
            return cuckoo_manager.getter("networkAuthService",
                superclassCall:
                    
                    super.networkAuthService
                    ,
                defaultCall: __defaultImplStub!.networkAuthService)
        }
        
        set {
            cuckoo_manager.setter("networkAuthService",
                value: newValue,
                superclassCall:
                    
                    super.networkAuthService = newValue
                    ,
                defaultCall: __defaultImplStub!.networkAuthService = newValue)
        }
        
    }
    

    

    
    
    
     override func fetchCats(page: Int, completion: @escaping (DataResponse<CatResult, AFError>) -> Void)  {
        
    return cuckoo_manager.call("fetchCats(page: Int, completion: @escaping (DataResponse<CatResult, AFError>) -> Void)",
            parameters: (page, completion),
            escapingParameters: (page, completion),
            superclassCall:
                
                super.fetchCats(page: page, completion: completion)
                ,
            defaultCall: __defaultImplStub!.fetchCats(page: page, completion: completion))
        
    }
    

	 struct __StubbingProxy_NetworkService: Cuckoo.StubbingProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	
	     init(manager: Cuckoo.MockManager) {
	        self.cuckoo_manager = manager
	    }
	    
	    
	    var networkAuthService: Cuckoo.ClassToBeStubbedProperty<MockNetworkService, NetworkAuthServiceProtocol> {
	        return .init(manager: cuckoo_manager, name: "networkAuthService")
	    }
	    
	    
	    func fetchCats<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(page: M1, completion: M2) -> Cuckoo.ClassStubNoReturnFunction<(Int, (DataResponse<CatResult, AFError>) -> Void)> where M1.MatchedType == Int, M2.MatchedType == (DataResponse<CatResult, AFError>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, (DataResponse<CatResult, AFError>) -> Void)>] = [wrap(matchable: page) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return .init(stub: cuckoo_manager.createStub(for: MockNetworkService.self, method: "fetchCats(page: Int, completion: @escaping (DataResponse<CatResult, AFError>) -> Void)", parameterMatchers: matchers))
	    }
	    
	}

	 struct __VerificationProxy_NetworkService: Cuckoo.VerificationProxy {
	    private let cuckoo_manager: Cuckoo.MockManager
	    private let callMatcher: Cuckoo.CallMatcher
	    private let sourceLocation: Cuckoo.SourceLocation
	
	     init(manager: Cuckoo.MockManager, callMatcher: Cuckoo.CallMatcher, sourceLocation: Cuckoo.SourceLocation) {
	        self.cuckoo_manager = manager
	        self.callMatcher = callMatcher
	        self.sourceLocation = sourceLocation
	    }
	
	    
	    
	    var networkAuthService: Cuckoo.VerifyProperty<NetworkAuthServiceProtocol> {
	        return .init(manager: cuckoo_manager, name: "networkAuthService", callMatcher: callMatcher, sourceLocation: sourceLocation)
	    }
	    
	
	    
	    @discardableResult
	    func fetchCats<M1: Cuckoo.Matchable, M2: Cuckoo.Matchable>(page: M1, completion: M2) -> Cuckoo.__DoNotUse<(Int, (DataResponse<CatResult, AFError>) -> Void), Void> where M1.MatchedType == Int, M2.MatchedType == (DataResponse<CatResult, AFError>) -> Void {
	        let matchers: [Cuckoo.ParameterMatcher<(Int, (DataResponse<CatResult, AFError>) -> Void)>] = [wrap(matchable: page) { $0.0 }, wrap(matchable: completion) { $0.1 }]
	        return cuckoo_manager.verify("fetchCats(page: Int, completion: @escaping (DataResponse<CatResult, AFError>) -> Void)", callMatcher: callMatcher, parameterMatchers: matchers, sourceLocation: sourceLocation)
	    }
	    
	}
}

 class NetworkServiceStub: NetworkService {
    
    
     override var networkAuthService: NetworkAuthServiceProtocol {
        get {
            return DefaultValueRegistry.defaultValue(for: (NetworkAuthServiceProtocol).self)
        }
        
        set { }
        
    }
    

    

    
     override func fetchCats(page: Int, completion: @escaping (DataResponse<CatResult, AFError>) -> Void)   {
        return DefaultValueRegistry.defaultValue(for: (Void).self)
    }
    
}

