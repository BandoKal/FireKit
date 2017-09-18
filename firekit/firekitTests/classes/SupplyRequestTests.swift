//
//  SupplyRequestTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-18.
//  2017, SMART Health IT.
//
// Updated for Realm support by Ryan Baldwin on 2017-09-18
// Copyright @ 2017 Bunnyhug. All rights fall under Apache 2
// 

import XCTest
import RealmSwift
import FireKit


class SupplyRequestTests: XCTestCase, RealmPersistenceTesting {    
  var realm: Realm!

  override func setUp() {
    realm = makeRealm()
  }

  func inflateFrom(filename: String) throws -> FireKit.SupplyRequest {
    return try inflateFrom(data: try readJSONFile(filename))
  }
  
  func inflateFrom(data: Data) throws -> FireKit.SupplyRequest {
      print("Inflating FireKit.SupplyRequest from data: \(data)")
      let instance = try JSONDecoder().decode(FireKit.SupplyRequest.self, from: data)
      XCTAssertNotNil(instance, "Must have instantiated a test instance")
      return instance
  }
  
  func testSupplyRequest1() {   
    var instance: FireKit.SupplyRequest?
    do {
      instance = try runSupplyRequest1()
      try runSupplyRequest1(try JSONEncoder().encode(instance!))    
      let copy = instance!.copy() as? FireKit.SupplyRequest
      XCTAssertNotNil(copy)
      try runSupplyRequest1(try JSONEncoder().encode(copy!))     

      // try! realm.write { copy!.populate(from: instance!) }
      // try runSupplyRequest1(JSONEncoder().encode(copy!))  
    }
    catch let error {
      XCTAssertTrue(false, "Must instantiate and test SupplyRequest successfully, but threw: \(error)")
    }

    testSupplyRequestRealm1(instance!)
  }

  func testSupplyRequest1RealmPK() {    
    do {
        let instance: FireKit.SupplyRequest = try runSupplyRequest1()
        let copy = (instance.copy() as! FireKit.SupplyRequest)

        XCTAssertNotEqual(instance.pk, copy.pk)
        try! realm.write { realm.add(instance) }
            // TODO: this whole upsert business is bizzarro
            // try! realm.write{ _ = instance.populate(from: copy.asJSON()) }
            // XCTAssertNotEqual(instance.pk, copy.pk)
            
            // let prePopulatedCopyPK = copy.pk
            // _ = copy.populate(from: instance.asJSON())
            // XCTAssertEqual(prePopulatedCopyPK, copy.pk)
            // XCTAssertNotEqual(copy.pk, instance.pk)
        } catch let error {
            XCTAssertTrue(false, "Must instantiate and test SupplyRequest's PKs, but threw: \(error)")
        }
    }

  func testSupplyRequestRealm1(_ instance: FireKit.SupplyRequest) {
        // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
        // and ensure it passes the all the same tests.
        try! realm.write { realm.add(instance) }
        try! runSupplyRequest1(JSONEncoder().encode(realm.objects(FireKit.SupplyRequest.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.SupplyRequest.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.SupplyRequest.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.SupplyRequest()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.SupplyRequest.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSupplyRequest1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.SupplyRequest.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runSupplyRequest1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.SupplyRequest.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.SupplyRequest.self).count)
  }
  
  @discardableResult
  func runSupplyRequest1(_ data: Data? = nil) throws -> FireKit.SupplyRequest {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "supplyrequest-example.json")
    
    XCTAssertEqual(inst.id, "example")
    XCTAssertEqual(inst.text?.div, "<div>[Put rendering here]</div>")
    XCTAssertEqual(inst.text?.status, "generated")
    
    return inst
  }
}
