//
//  NamingSystemTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class NamingSystemTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.NamingSystem {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.NamingSystem {
		let instance = RealmSwiftFHIR.NamingSystem(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testNamingSystem1() {		
		var instance: RealmSwiftFHIR.NamingSystem?
		do {
			instance = try runNamingSystem1()
			try runNamingSystem1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test NamingSystem successfully, but threw")
		}

		testNamingSystemRealm1(instance: instance!)
	}

	func testNamingSystemRealm1(instance: RealmSwiftFHIR.NamingSystem) {
		try! realm.write {
                realm.add(instance)
            }
        try! runNamingSystem1(realm.objects(RealmSwiftFHIR.NamingSystem.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.NamingSystem.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.NamingSystem.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runNamingSystem1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.NamingSystem {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "namingsystem-example-id.json")
		
		XCTAssertEqual(inst.contact[0].name, "HL7 Australia FHIR Team")
		XCTAssertEqual(inst.contact[0].telecom[0].system, "other")
		XCTAssertEqual(inst.contact[0].telecom[0].value, "http://hl7-australia.wikispaces.com/FHIR+Australia")
		XCTAssertEqual(inst.date?.description, "2015-08-31")
		XCTAssertEqual(inst.description_fhir, "Australian HI Identifier as established by relevant regulations etc")
		XCTAssertEqual(inst.id, "example-id")
		XCTAssertEqual(inst.kind, "identifier")
		XCTAssertEqual(inst.name, "Austalian Healthcare Identifier - Individual")
		XCTAssertEqual(inst.publisher, "HL7 Australia on behalf of NEHTA")
		XCTAssertEqual(inst.responsible, "HI Service Operator / NEHTA")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.text?.div, "<div>\n      <p>\n        <b>Australian IHI Number</b>\n      </p>\n      \n      <p> oid: 1.2.36.1.2001.1003.0</p>\n      \n      <p> uri: http://ns.electronichealth.net.au/id/hi/ihi/1.0</p>\n    \n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.type?.coding[0].code, "NI")
		XCTAssertEqual(inst.type?.coding[0].display, "National unique individual identifier")
		XCTAssertEqual(inst.type?.coding[0].system, "http://hl7.org/fhir/v2/0203")
		XCTAssertEqual(inst.type?.text, "IHI")
		XCTAssertEqual(inst.uniqueId[0].type, "oid")
		XCTAssertEqual(inst.uniqueId[0].value, "1.2.36.1.2001.1003.0")
		XCTAssertEqual(inst.uniqueId[1].period?.start?.description, "2015-08-21")
		XCTAssertTrue(inst.uniqueId[1].preferred.value ?? false)
		XCTAssertEqual(inst.uniqueId[1].type, "uri")
		XCTAssertEqual(inst.uniqueId[1].value, "http://ns.electronichealth.net.au/id/hi/ihi/1.0")
		XCTAssertEqual(inst.usage, "Used in Australia for identifying patients")
		XCTAssertEqual(inst.useContext[0].coding[0].code, "AU")
		XCTAssertEqual(inst.useContext[0].coding[0].system, "urn:iso:std:iso:3166")
		
		return inst
	}
	
	func testNamingSystem2() {		
		var instance: RealmSwiftFHIR.NamingSystem?
		do {
			instance = try runNamingSystem2()
			try runNamingSystem2(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test NamingSystem successfully, but threw")
		}

		testNamingSystemRealm2(instance: instance!)
	}

	func testNamingSystemRealm2(instance: RealmSwiftFHIR.NamingSystem) {
		try! realm.write {
                realm.add(instance)
            }
        try! runNamingSystem2(realm.objects(RealmSwiftFHIR.NamingSystem.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.NamingSystem.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.NamingSystem.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runNamingSystem2(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.NamingSystem {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "namingsystem-example-replaced.json")
		
		XCTAssertEqual(inst.date?.description, "2005-01-25")
		XCTAssertEqual(inst.description_fhir, "This was a wrong registration for the spanish editions of SNOMED CT. Do not use")
		XCTAssertEqual(inst.id, "example-replaced")
		XCTAssertEqual(inst.kind, "codesystem")
		XCTAssertEqual(inst.name, "SNOMED CT Spanish")
		XCTAssertEqual(inst.publisher, "Not HL7!")
		XCTAssertEqual(inst.replacedBy?.reference, "NamingSystem/example")
		XCTAssertEqual(inst.status, "retired")
		XCTAssertEqual(inst.text?.div, "<div>\n      \n      <p>\n        <b>Deprecated SNOMED CT Spanish Registration</b>\n      </p>\n      \n      <p> oid: 2.16.840.1.113883.6.96.1 - deprecated <b>Do Not Use</b></p>\n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.uniqueId[0].type, "oid")
		XCTAssertEqual(inst.uniqueId[0].value, "2.16.840.1.113883.6.96.1")
		
		return inst
	}
	
	func testNamingSystem3() {		
		var instance: RealmSwiftFHIR.NamingSystem?
		do {
			instance = try runNamingSystem3()
			try runNamingSystem3(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test NamingSystem successfully, but threw")
		}

		testNamingSystemRealm3(instance: instance!)
	}

	func testNamingSystemRealm3(instance: RealmSwiftFHIR.NamingSystem) {
		try! realm.write {
                realm.add(instance)
            }
        try! runNamingSystem3(realm.objects(RealmSwiftFHIR.NamingSystem.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.NamingSystem.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.NamingSystem.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runNamingSystem3(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.NamingSystem {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "namingsystem-example.json")
		
		XCTAssertEqual(inst.contact[0].name, "FHIR project team")
		XCTAssertEqual(inst.contact[0].telecom[0].system, "other")
		XCTAssertEqual(inst.contact[0].telecom[0].value, "http://hl7.org/fhir")
		XCTAssertEqual(inst.date?.description, "2014-12-13")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.kind, "codesystem")
		XCTAssertEqual(inst.name, "SNOMED CT")
		XCTAssertEqual(inst.publisher, "HL7 International on behalf of IHTSDO")
		XCTAssertEqual(inst.responsible, "IHTSDO & affiliates")
		XCTAssertEqual(inst.status, "active")
		XCTAssertEqual(inst.text?.div, "<div>\n      \n      <p>\n        <b>SNOMED CT</b>\n      </p>\n      \n      <p> oid: 2.16.840.1.113883.6.96</p>\n      \n      <p> uri: http://snomed.info/sct</p>\n    \n    </div>")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.uniqueId[0].type, "oid")
		XCTAssertEqual(inst.uniqueId[0].value, "2.16.840.1.113883.6.96")
		XCTAssertTrue(inst.uniqueId[1].preferred.value ?? false)
		XCTAssertEqual(inst.uniqueId[1].type, "uri")
		XCTAssertEqual(inst.uniqueId[1].value, "http://snomed.info/sct")
		
		return inst
	}
}
