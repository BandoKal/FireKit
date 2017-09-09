//
//  RealmTypes.swift
//  SwiftFHIR
//
//  Created by Ryan Baldwin on 01/21/17
//  2017, Ryan Baldwin
//

import Foundation
import Realm
import RealmSwift

final public class RealmString: Object, Codable {
    public dynamic var value: String = ""

    public convenience init(val: String) {
        self.init()
        self.value = val
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.init(val: try container.decode(String.self))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.value)
    }
}

final public class RealmInt: Object {
    public dynamic var value: Int = 0

    public convenience init(val: Int) {
        self.init()
        self.value = val
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.init(val: try container.decode(Int.self))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.value)
    }
}

final public class RealmDecimal: Object, Codable {
    private dynamic var _value = "0"

    public var value: Decimal {
        get { return Decimal(string: _value)! }
        set { _value = String(describing: newValue) }
    }

    public convenience init(string val: String) {
        self.init()
        self._value = val
    }
    
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.init(string: try container.decode(String.self))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.value)
    }
    
    public override class func ignoredProperties() -> [String] {
        return ["value"]
    }

    public static func ==(lhs: RealmDecimal, rhs: RealmDecimal) -> Bool {
        return lhs.value.isEqual(to: rhs.value)
    }
    
    public static func ==(lhs: RealmDecimal?, rhs: RealmDecimal) -> Bool {
        if let lhs = lhs {
            return lhs == rhs
        }
        
        return false
    }
    
    public static func ==(lhs: RealmDecimal, rhs: RealmDecimal?) -> Bool {
        if let rhs = rhs {
            return lhs == rhs
        }
        
        return false
    }    
}

final public class RealmURL: Object, Codable {
    private dynamic var _value: String?
    
    private var _url: URL? = nil
    public var value: URL? {
        get {
            if _url == nil {
                _url = URL(string: _value ?? "")
            }
            
            return _url
        }
        set {
            _url = newValue
            _value = newValue?.absoluteString ?? ""
        }
    }
    
    public convenience init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.singleValueContainer()
        value = try container.decode(URL.self)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.value)
    }
    
    public override class func ignoredProperties() -> [String] {
        return ["value", "_url"]
    }
}

/// Realm is limited in its polymorphism and can't contain a List of different
/// classes. As a result, for example, deserializing from JSON into a DomainResource
/// will fail if that resource has any contained resources.
///
/// In normal SwiftFHIR the `DomainResource.contained` works fine, but because of 
/// Realm's polymorphic limitations it fails. `DomainResource.contained: RealmSwift<Resource>` 
/// will blow up at runtime. The workaround is to create a `ContainedResource: Resource`
/// Which will store the same information as `Resource`, but will also provide functionality
/// to store the original JSON and inflate it on demand into the proper type.
final public class ContainedResource: Resource {
    private enum CodingKeys: String, CodingKey {
        case resourceType
    }
    
    public dynamic var resourceType: String?
    private dynamic var json: Data?
    
    lazy public var resource: FHIRAbstractBase? = {
        guard let resourceType = self.resourceType, let json = self.json else {
            return nil
        }
        
        let t = FHIRAbstractBase.resourceType(from: resourceType)
        do {
            return try JSONDecoder().decode(t, from: json)
        } catch let error {
            print("Failed to decode contained resource. Returning nil: \(error)")
        }
        
        return nil
    }()
    
    public override class func ignoredProperties() -> [String] {
        return ["resource"]
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        resourceType = try container.decodeIfPresent(String.self, forKey: .resourceType)
    }
    
    public required init() {
        super.init()
    }
    
    public required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
    
    public required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    public override func encode(to encoder: Encoder) throws {
        guard let resource = resource else {
            return
        }
        
        try resource.encode(to: encoder)
    }
    
    // public override func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
    //     var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()        
    //     if let js = json {
    //         if let exist = js["resourceType"] {
    //             presentKeys.insert("resourceType")
    //             if let val = exist as? String {
    //                 self.resourceType = val
    //             }
    //             else {
    //                 errors.append(FHIRJSONError(key: "resourceType", wants: String.self, has: type(of: exist)))
    //             }
    //         }
            
    //         self.json = NSKeyedArchiver.archivedData(withRootObject: js)
    //     }
        
    //     return errors.isEmpty ? nil : errors
    // }
    
    // public override func asJSON() -> FHIRJSON {
    //     guard let resource = resource else {
    //         return ["fhir_comments": "Failed to serialize ContainedResource (\(String(describing: self.resourceType))) because the resource was not set."]
    //     }
        
    //     return resource.asJSON()
    // }
}
