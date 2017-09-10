//
//  MedicationTests.swift
//  FireKit
//
//  Generated from FHIR 1.0.2.7202 on 2017-09-10.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import FireKit


class MedicationTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func inflateFrom(filename: String) throws -> FireKit.Medication {
		return try inflateFrom(data: try readJSONFile(filename))
	}
	
	func inflateFrom(data: Data) throws -> FireKit.Medication {
      let data = NSKeyedArchiver.archivedData(withRootObject: data)
		  let instance = try JSONDecoder().decode(FireKit.Medication.self, from: data)
		  XCTAssertNotNil(instance, "Must have instantiated a test instance")
		  return instance
	}
	
	func testMedication1() {		
		var instance: FireKit.Medication?
		do {
			instance = try runMedication1()
			try runMedication1(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.Medication
			XCTAssertNotNil(copy)
			try runMedication1(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedication1(JSONEncoder().encode(copy!))  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw")
		}

		testMedicationRealm1(instance!)
	}

    func testMedication1RealmPK() {        
        do {
            let instance: FireKit.Medication = try runMedication1()
            let copy = (instance.copy() as! FireKit.Medication)

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
            XCTAssertTrue(false, "Must instantiate and test Medication's PKs, but threw: \(error)")
        }
    }

	func testMedicationRealm1(_ instance: FireKit.Medication) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runMedication1(JSONEncoder().encode(realm.objects(FireKit.Medication.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Medication.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Medication()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedication1(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedication1(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Medication.self).count)
	}
	
	@discardableResult
	func runMedication1(_ data: Data? = nil) throws -> FireKit.Medication {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medication-example-f001-combivent.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "320442002")
		XCTAssertEqual(inst.code?.coding[0].display, "Salbutamol+ipratropium bromide 100micrograms/20micrograms inhaler")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f001")
		XCTAssertTrue(inst.isBrand.value ?? false)
		XCTAssertEqual(inst.product?.form?.coding[0].code, "420317006")
		XCTAssertEqual(inst.product?.form?.coding[0].display, "Inhaler (qualifier value)")
		XCTAssertEqual(inst.product?.form?.coding[0].system, "http://snomed.info/sct")
		XCTAssertTrue(inst.product?.ingredient[0].amount?.denominator?.value! == RealmDecimal(string: "1"))
		XCTAssertEqual(inst.product?.ingredient[0].amount?.numerator?.code, "ml")
		XCTAssertEqual(inst.product?.ingredient[0].amount?.numerator?.system, "http://unitsofmeasure.org")
		XCTAssertEqual(inst.product?.ingredient[0].amount?.numerator?.unit, "ml")
		XCTAssertTrue(inst.product?.ingredient[0].amount?.numerator?.value! == RealmDecimal(string: "100"))
		XCTAssertEqual(inst.product?.ingredient[0].item?.display, "Combivent")
		XCTAssertEqual(inst.product?.ingredient[0].item?.reference, "Medication/f001")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedication2() {		
		var instance: FireKit.Medication?
		do {
			instance = try runMedication2()
			try runMedication2(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.Medication
			XCTAssertNotNil(copy)
			try runMedication2(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedication2(JSONEncoder().encode(copy!))  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw")
		}

		testMedicationRealm2(instance!)
	}

    func testMedication2RealmPK() {        
        do {
            let instance: FireKit.Medication = try runMedication2()
            let copy = (instance.copy() as! FireKit.Medication)

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
            XCTAssertTrue(false, "Must instantiate and test Medication's PKs, but threw: \(error)")
        }
    }

	func testMedicationRealm2(_ instance: FireKit.Medication) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runMedication2(JSONEncoder().encode(realm.objects(FireKit.Medication.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Medication.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Medication()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedication2(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedication2(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Medication.self).count)
	}
	
	@discardableResult
	func runMedication2(_ data: Data? = nil) throws -> FireKit.Medication {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medication-example-f002-crestor.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "408036003")
		XCTAssertEqual(inst.code?.coding[0].display, "Rosuvastatin 10mg tablet")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f002")
		XCTAssertTrue(inst.isBrand.value ?? false)
		XCTAssertEqual(inst.package?.container?.coding[0].code, "398124009")
		XCTAssertEqual(inst.package?.container?.coding[0].display, "drug container")
		XCTAssertEqual(inst.package?.container?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedication3() {		
		var instance: FireKit.Medication?
		do {
			instance = try runMedication3()
			try runMedication3(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.Medication
			XCTAssertNotNil(copy)
			try runMedication3(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedication3(JSONEncoder().encode(copy!))  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw")
		}

		testMedicationRealm3(instance!)
	}

    func testMedication3RealmPK() {        
        do {
            let instance: FireKit.Medication = try runMedication3()
            let copy = (instance.copy() as! FireKit.Medication)

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
            XCTAssertTrue(false, "Must instantiate and test Medication's PKs, but threw: \(error)")
        }
    }

	func testMedicationRealm3(_ instance: FireKit.Medication) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runMedication3(JSONEncoder().encode(realm.objects(FireKit.Medication.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Medication.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Medication()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedication3(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedication3(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Medication.self).count)
	}
	
	@discardableResult
	func runMedication3(_ data: Data? = nil) throws -> FireKit.Medication {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medication-example-f003-tolbutamide.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "325267004")
		XCTAssertEqual(inst.code?.coding[0].display, "Tolbutamide 500mg tablet")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f003")
		XCTAssertTrue(inst.isBrand.value ?? false)
		XCTAssertEqual(inst.package?.container?.coding[0].code, "398124009")
		XCTAssertEqual(inst.package?.container?.coding[0].display, "drug container")
		XCTAssertEqual(inst.package?.container?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedication4() {		
		var instance: FireKit.Medication?
		do {
			instance = try runMedication4()
			try runMedication4(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.Medication
			XCTAssertNotNil(copy)
			try runMedication4(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedication4(JSONEncoder().encode(copy!))  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw")
		}

		testMedicationRealm4(instance!)
	}

    func testMedication4RealmPK() {        
        do {
            let instance: FireKit.Medication = try runMedication4()
            let copy = (instance.copy() as! FireKit.Medication)

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
            XCTAssertTrue(false, "Must instantiate and test Medication's PKs, but threw: \(error)")
        }
    }

	func testMedicationRealm4(_ instance: FireKit.Medication) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runMedication4(JSONEncoder().encode(realm.objects(FireKit.Medication.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Medication.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Medication()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedication4(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedication4(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Medication.self).count)
	}
	
	@discardableResult
	func runMedication4(_ data: Data? = nil) throws -> FireKit.Medication {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medication-example-f004-metoprolol.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "318475005")
		XCTAssertEqual(inst.code?.coding[0].display, "Metoprolol tartrate 50mg tablet")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f004")
		XCTAssertTrue(inst.isBrand.value ?? false)
		XCTAssertEqual(inst.package?.container?.coding[0].code, "398124009")
		XCTAssertEqual(inst.package?.container?.coding[0].display, "drug container")
		XCTAssertEqual(inst.package?.container?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedication5() {		
		var instance: FireKit.Medication?
		do {
			instance = try runMedication5()
			try runMedication5(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.Medication
			XCTAssertNotNil(copy)
			try runMedication5(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedication5(JSONEncoder().encode(copy!))  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw")
		}

		testMedicationRealm5(instance!)
	}

    func testMedication5RealmPK() {        
        do {
            let instance: FireKit.Medication = try runMedication5()
            let copy = (instance.copy() as! FireKit.Medication)

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
            XCTAssertTrue(false, "Must instantiate and test Medication's PKs, but threw: \(error)")
        }
    }

	func testMedicationRealm5(_ instance: FireKit.Medication) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runMedication5(JSONEncoder().encode(realm.objects(FireKit.Medication.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Medication.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Medication()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedication5(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedication5(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Medication.self).count)
	}
	
	@discardableResult
	func runMedication5(_ data: Data? = nil) throws -> FireKit.Medication {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medication-example-f005-enalapril.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "318851002")
		XCTAssertEqual(inst.code?.coding[0].display, "Enalapril maleate 5mg tablet")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f005")
		XCTAssertTrue(inst.isBrand.value ?? false)
		XCTAssertEqual(inst.package?.container?.coding[0].code, "398124009")
		XCTAssertEqual(inst.package?.container?.coding[0].display, "drug container")
		XCTAssertEqual(inst.package?.container?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedication6() {		
		var instance: FireKit.Medication?
		do {
			instance = try runMedication6()
			try runMedication6(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.Medication
			XCTAssertNotNil(copy)
			try runMedication6(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedication6(JSONEncoder().encode(copy!))  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw")
		}

		testMedicationRealm6(instance!)
	}

    func testMedication6RealmPK() {        
        do {
            let instance: FireKit.Medication = try runMedication6()
            let copy = (instance.copy() as! FireKit.Medication)

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
            XCTAssertTrue(false, "Must instantiate and test Medication's PKs, but threw: \(error)")
        }
    }

	func testMedicationRealm6(_ instance: FireKit.Medication) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runMedication6(JSONEncoder().encode(realm.objects(FireKit.Medication.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Medication.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Medication()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedication6(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedication6(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Medication.self).count)
	}
	
	@discardableResult
	func runMedication6(_ data: Data? = nil) throws -> FireKit.Medication {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medication-example-f201-salmeterol.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "411106009")
		XCTAssertEqual(inst.code?.coding[0].display, "25ug Flutacisone + 250ug Salmeterol")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f201")
		XCTAssertFalse(inst.isBrand.value ?? true)
		XCTAssertEqual(inst.product?.form?.coding[0].code, "421606006")
		XCTAssertEqual(inst.product?.form?.coding[0].display, "Aerosol spray")
		XCTAssertEqual(inst.product?.form?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.product?.ingredient[0].amount?.denominator?.code, "PUFF")
		XCTAssertEqual(inst.product?.ingredient[0].amount?.denominator?.system, "http://hl7.org/fhir/v3/orderableDrugForm")
		XCTAssertTrue(inst.product?.ingredient[0].amount?.denominator?.value! == RealmDecimal(string: "1"))
		XCTAssertEqual(inst.product?.ingredient[0].amount?.numerator?.code, "ug")
		XCTAssertEqual(inst.product?.ingredient[0].amount?.numerator?.system, "http://unitsofmeasure.org")
		XCTAssertTrue(inst.product?.ingredient[0].amount?.numerator?.value! == RealmDecimal(string: "25"))
		XCTAssertEqual(inst.product?.ingredient[0].item?.display, "flutacisone")
		XCTAssertEqual(inst.product?.ingredient[1].amount?.denominator?.code, "PUFF")
		XCTAssertEqual(inst.product?.ingredient[1].amount?.denominator?.system, "http://hl7.org/fhir/v3/orderableDrugForm")
		XCTAssertTrue(inst.product?.ingredient[1].amount?.denominator?.value! == RealmDecimal(string: "1"))
		XCTAssertEqual(inst.product?.ingredient[1].amount?.numerator?.code, "ug")
		XCTAssertEqual(inst.product?.ingredient[1].amount?.numerator?.system, "http://unitsofmeasure.org")
		XCTAssertTrue(inst.product?.ingredient[1].amount?.numerator?.value! == RealmDecimal(string: "250"))
		XCTAssertEqual(inst.product?.ingredient[1].item?.display, "salmeterol")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedication7() {		
		var instance: FireKit.Medication?
		do {
			instance = try runMedication7()
			try runMedication7(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.Medication
			XCTAssertNotNil(copy)
			try runMedication7(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedication7(JSONEncoder().encode(copy!))  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw")
		}

		testMedicationRealm7(instance!)
	}

    func testMedication7RealmPK() {        
        do {
            let instance: FireKit.Medication = try runMedication7()
            let copy = (instance.copy() as! FireKit.Medication)

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
            XCTAssertTrue(false, "Must instantiate and test Medication's PKs, but threw: \(error)")
        }
    }

	func testMedicationRealm7(_ instance: FireKit.Medication) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runMedication7(JSONEncoder().encode(realm.objects(FireKit.Medication.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Medication.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Medication()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedication7(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedication7(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Medication.self).count)
	}
	
	@discardableResult
	func runMedication7(_ data: Data? = nil) throws -> FireKit.Medication {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medication-example-f202-flucloxacilline.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "387544009")
		XCTAssertEqual(inst.code?.coding[0].display, "Flucloxacillin")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f202")
		XCTAssertFalse(inst.isBrand.value ?? true)
		XCTAssertEqual(inst.product?.form?.coding[0].code, "385218009")
		XCTAssertEqual(inst.product?.form?.coding[0].display, "Injection")
		XCTAssertEqual(inst.product?.form?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
	
	func testMedication8() {		
		var instance: FireKit.Medication?
		do {
			instance = try runMedication8()
			try runMedication8(try JSONEncoder().encode(instance!)) 		
			let copy = instance!.copy() as? FireKit.Medication
			XCTAssertNotNil(copy)
			try runMedication8(try JSONEncoder().encode(copy!))     

            try! realm.write { copy!.populate(from: instance!) }
            try runMedication8(JSONEncoder().encode(copy!))  
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test Medication successfully, but threw")
		}

		testMedicationRealm8(instance!)
	}

    func testMedication8RealmPK() {        
        do {
            let instance: FireKit.Medication = try runMedication8()
            let copy = (instance.copy() as! FireKit.Medication)

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
            XCTAssertTrue(false, "Must instantiate and test Medication's PKs, but threw: \(error)")
        }
    }

	func testMedicationRealm8(_ instance: FireKit.Medication) {
		  // ensure we can write the instance, then fetch it, serialize it to JSON, then deserialize that JSON 
      // and ensure it passes the all the same tests.
		  try! realm.write { realm.add(instance) }
        try! runMedication8(JSONEncoder().encode(realm.objects(FireKit.Medication.self).first!))
        
        // ensure we can update it.
        try! realm.write { instance.implicitRules = "Rule #1" }
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)
        XCTAssertEqual("Rule #1", realm.objects(FireKit.Medication.self).first!.implicitRules)
        
        // create a new instance with default key, save it, then populate it from instance JSON. 
        // PK should persist and not be overwritten.
        let newInst = FireKit.Medication()
        try! realm.write { realm.add(newInst) }
        
        // first time updating it should inflate children resources/elements which don't exist
        var existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        // TODO: populated stuff
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedication8(existing.asJSON())
        
        // second time updating it will overwrite values of child resources/elements, but maintain keys
        // TODO: Find a way to actually test this instead of breakpoints and eyeballing it.
        existing = realm.object(ofType: FireKit.Medication.self, forPrimaryKey: newInst.pk)!
        // try! realm.write{ _ = existing.populate(from: instance.asJSON()) }
        // try! runMedication8(existing.asJSON())

        try! realm.write { realm.delete(instance) }        
        XCTAssertEqual(1, realm.objects(FireKit.Medication.self).count)

        try! realm.write { realm.delete(existing) }
        XCTAssertEqual(0, realm.objects(FireKit.Medication.self).count)
	}
	
	@discardableResult
	func runMedication8(_ data: Data? = nil) throws -> FireKit.Medication {
      let inst = (data != nil) ? try inflateFrom(data: data!) : try inflateFrom(filename: "medication-example-f203-paracetamol.json")
		
		XCTAssertEqual(inst.code?.coding[0].code, "387517004")
		XCTAssertEqual(inst.code?.coding[0].display, "Paracetamol")
		XCTAssertEqual(inst.code?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.id, "f203")
		XCTAssertFalse(inst.isBrand.value ?? true)
		XCTAssertEqual(inst.product?.form?.coding[0].code, "385055001")
		XCTAssertEqual(inst.product?.form?.coding[0].display, "Tablet")
		XCTAssertEqual(inst.product?.form?.coding[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.text?.status, "generated")
		
		return inst
	}
}
