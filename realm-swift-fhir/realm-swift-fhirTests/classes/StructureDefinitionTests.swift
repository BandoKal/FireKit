//
//  StructureDefinitionTests.swift
//  RealmSwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 on 2017-02-01.
//  2017, SMART Health IT.
//
// Tweaked for RealmSupport by Ryan Baldwin, University Health Network.

import XCTest
import RealmSwift
import RealmSwiftFHIR


class StructureDefinitionTests: XCTestCase, RealmPersistenceTesting {    
	var realm: Realm!

	override func setUp() {
		realm = makeRealm()
	}

	func instantiateFrom(filename: String) throws -> RealmSwiftFHIR.StructureDefinition {
		return instantiateFrom(json: try readJSONFile(filename))
	}
	
	func instantiateFrom(json: FHIRJSON) -> RealmSwiftFHIR.StructureDefinition {
		let instance = RealmSwiftFHIR.StructureDefinition(json: json)
		XCTAssertNotNil(instance, "Must have instantiated a test instance")
		return instance
	}
	
	func testStructureDefinition1() {		
		var instance: RealmSwiftFHIR.StructureDefinition?
		do {
			instance = try runStructureDefinition1()
			try runStructureDefinition1(instance!.asJSON()) 			
		}
		catch {
			XCTAssertTrue(false, "Must instantiate and test StructureDefinition successfully, but threw")
		}

		testStructureDefinitionRealm1(instance: instance!)
	}

	func testStructureDefinitionRealm1(instance: RealmSwiftFHIR.StructureDefinition) {
		try! realm.write {
                realm.add(instance)
            }
        try! runStructureDefinition1(realm.objects(RealmSwiftFHIR.StructureDefinition.self).first!.asJSON())
        
        try! realm.write {
        	instance.implicitRules = "Rule #1"
            realm.add(instance, update: true)
        }
        XCTAssertEqual(1, realm.objects(RealmSwiftFHIR.StructureDefinition.self).count)
        XCTAssertEqual("Rule #1", realm.objects(RealmSwiftFHIR.StructureDefinition.self).first!.implicitRules)
        
        try! realm.write {
            realm.delete(instance)
        }
        XCTAssertEqual(0, realm.objects(RealmSwiftFHIR.Account.self).count)
	}
	
	@discardableResult
	func runStructureDefinition1(_ json: FHIRJSON? = nil) throws -> RealmSwiftFHIR.StructureDefinition {
		let inst = (nil != json) ? instantiateFrom(json: json!) : try instantiateFrom(filename: "structuredefinition-example.json")
		
		XCTAssertFalse(inst.abstract.value ?? true)
		XCTAssertEqual(inst.base, "http://hl7.org/fhir/StructureDefinition/DiagnosticReport")
		XCTAssertEqual(inst.code[0].code, "314079002")
		XCTAssertEqual(inst.code[0].display, "314079002")
		XCTAssertEqual(inst.code[0].system, "http://snomed.info/sct")
		XCTAssertEqual(inst.constrainedType, "DiagnosticReport")
		XCTAssertEqual(inst.contact[0].name, "Grahame Grieve")
		XCTAssertEqual(inst.contact[0].telecom[0].system, "email")
		XCTAssertEqual(inst.contact[0].telecom[0].value, "grahame@healthintersections.com.au")
		XCTAssertEqual(inst.copyright, "Createive Commons 0, per FHIR specification")
		XCTAssertEqual(inst.date?.description, "2012-05-12")
		XCTAssertEqual(inst.description_fhir, "Describes how the lab report is used for a standard Lipid Profile - Cholesterol, Triglyceride and Cholesterol fractions. Uses LOINC codes")
		XCTAssertEqual(inst.display, "Example Lipid Profile")
		XCTAssertTrue(inst.experimental.value ?? false)
		XCTAssertEqual(inst.fhirVersion, "1.0.0")
		XCTAssertEqual(inst.id, "example")
		XCTAssertEqual(inst.identifier[0].system, "urn:ietf:rfc:3986")
		XCTAssertEqual(inst.identifier[0].value, "1.2.36.90146595217.4.2")
		XCTAssertEqual(inst.kind, "resource")
		XCTAssertEqual(inst.mapping[0].comments, "Actual mappings haven't yet been filled out")
		XCTAssertEqual(inst.mapping[0].identity, "m1")
		XCTAssertEqual(inst.mapping[0].name, "RCPA Lipid Report recommendations")
		XCTAssertEqual(inst.mapping[0].uri, "https://www.rcpa.edu.au/getattachment/0961c6d1-ec80-4500-8dc0-de516500e05b/Lipid-and-lipoprotein-testing.aspx")
		XCTAssertEqual(inst.name, "Example Lipid Profile")
		XCTAssertEqual(inst.publisher, "Health Intersections Pty Ltd")
		XCTAssertEqual(inst.requirements, "Provide an example to demonstrate how to use StructureDefinition")
		XCTAssertEqual(inst.snapshot?.element[0].base?.max, "1")
		XCTAssertEqual(inst.snapshot?.element[0].base?.min.value, 1)
		XCTAssertEqual(inst.snapshot?.element[0].base?.path, "DiagnosticReport")
		XCTAssertEqual(inst.snapshot?.element[0].definition, "The findings and interpretation of a general lipd lab profile.")
		XCTAssertFalse(inst.snapshot?.element[0].isModifier.value ?? true)
		XCTAssertEqual(inst.snapshot?.element[0].max, "1")
		XCTAssertEqual(inst.snapshot?.element[0].min.value, 1)
		XCTAssertEqual(inst.snapshot?.element[0].name, "LipidProfile")
		XCTAssertEqual(inst.snapshot?.element[0].path, "DiagnosticReport")
		XCTAssertEqual(inst.snapshot?.element[0].short, "Lipid Lab Report")
		XCTAssertEqual(inst.snapshot?.element[0].type[0].code, "Resource")
		XCTAssertEqual(inst.snapshot?.element[1].base?.max, "*")
		XCTAssertEqual(inst.snapshot?.element[1].base?.min.value, 0)
		XCTAssertEqual(inst.snapshot?.element[1].base?.path, "DiagnosticReport.extension")
		XCTAssertFalse(inst.snapshot?.element[1].isModifier.value ?? true)
		XCTAssertEqual(inst.snapshot?.element[1].max, "*")
		XCTAssertEqual(inst.snapshot?.element[1].min.value, 0)
		XCTAssertEqual(inst.snapshot?.element[1].path, "DiagnosticReport.extension")
		XCTAssertEqual(inst.snapshot?.element[1].short, "Additional Content defined by implementations")
		XCTAssertEqual(inst.snapshot?.element[1].slicing?.discriminator[0].value, "url")
		XCTAssertFalse(inst.snapshot?.element[1].slicing?.ordered.value ?? true)
		XCTAssertEqual(inst.snapshot?.element[1].slicing?.rules, "open")
		XCTAssertEqual(inst.snapshot?.element[1].type[0].code, "Extension")
		XCTAssertEqual(inst.snapshot?.element[2].alias[0].value, "narrative")
		XCTAssertEqual(inst.snapshot?.element[2].alias[1].value, "html")
		XCTAssertEqual(inst.snapshot?.element[2].alias[2].value, "xhtml")
		XCTAssertEqual(inst.snapshot?.element[2].alias[3].value, "display")
		XCTAssertEqual(inst.snapshot?.element[2].base?.max, "1")
		XCTAssertEqual(inst.snapshot?.element[2].base?.min.value, 0)
		XCTAssertEqual(inst.snapshot?.element[2].base?.path, "DiagnosticReport.text")
		XCTAssertEqual(inst.snapshot?.element[2].comments, "Contained resources do not have narrative. Resources that are not contained SHOULD have a narrative.")
		XCTAssertFalse(inst.snapshot?.element[2].isModifier.value ?? true)
		XCTAssertEqual(inst.snapshot?.element[2].max, "1")
		XCTAssertEqual(inst.snapshot?.element[2].min.value, 0)
		XCTAssertEqual(inst.snapshot?.element[2].path, "DiagnosticReport.text")
		XCTAssertEqual(inst.snapshot?.element[2].short, "Text summary of the resource, for human interpretation")
		XCTAssertEqual(inst.snapshot?.element[2].type[0].code, "Narrative")
		XCTAssertEqual(inst.snapshot?.element[3].alias[0].value, "inline resources")
		XCTAssertEqual(inst.snapshot?.element[3].alias[1].value, "anonymous resources")
		XCTAssertEqual(inst.snapshot?.element[3].alias[2].value, "contained resources")
		XCTAssertEqual(inst.snapshot?.element[3].base?.max, "*")
		XCTAssertEqual(inst.snapshot?.element[3].base?.min.value, 0)
		XCTAssertEqual(inst.snapshot?.element[3].base?.path, "DiagnosticReport.contained")
		XCTAssertEqual(inst.snapshot?.element[3].comments, "This should never be done when the content can be identified properly, as once identification is lost, it is extremely difficult (and context dependent) to restore it again.")
		XCTAssertFalse(inst.snapshot?.element[3].isModifier.value ?? true)
		XCTAssertEqual(inst.snapshot?.element[3].max, "*")
		XCTAssertEqual(inst.snapshot?.element[3].min.value, 0)
		XCTAssertEqual(inst.snapshot?.element[3].path, "DiagnosticReport.contained")
		XCTAssertEqual(inst.snapshot?.element[3].short, "Contained, inline Resources")
		XCTAssertEqual(inst.snapshot?.element[3].type[0].code, "Resource")
		XCTAssertEqual(inst.snapshot?.element[4].base?.max, "1")
		XCTAssertEqual(inst.snapshot?.element[4].base?.min.value, 1)
		XCTAssertEqual(inst.snapshot?.element[4].base?.path, "DiagnosticReport.status")
		XCTAssertEqual(inst.snapshot?.element[4].binding?.strength, "required")
		XCTAssertEqual(inst.snapshot?.element[4].binding?.valueSetReference?.reference, "http://hl7.org/fhir/ValueSet/observation-status")
		XCTAssertEqual(inst.snapshot?.element[4].comments, "This is labeled as \"Is Modifier\" because applications need to take appropriate action if a report is withdrawn.")
		XCTAssertEqual(inst.snapshot?.element[4].definition, "The status of the diagnostic report as a whole.")
		XCTAssertFalse(inst.snapshot?.element[4].isModifier.value ?? true)
		XCTAssertEqual(inst.snapshot?.element[4].max, "1")
		XCTAssertEqual(inst.snapshot?.element[4].min.value, 1)
		XCTAssertEqual(inst.snapshot?.element[4].path, "DiagnosticReport.status")
		XCTAssertEqual(inst.snapshot?.element[4].short, "registered|interim|final|amended|cancelled|withdrawn")
		XCTAssertEqual(inst.snapshot?.element[4].type[0].code, "code")
		XCTAssertEqual(inst.snapshot?.element[5].base?.max, "1")
		XCTAssertEqual(inst.snapshot?.element[5].base?.min.value, 1)
		XCTAssertEqual(inst.snapshot?.element[5].base?.path, "DiagnosticReport.issued")
		XCTAssertEqual(inst.snapshot?.element[5].comments, "May be different from the update time of the resource itself, because that is the status of the record (potentially a secondary copy), not the actual release time of the report.")
		XCTAssertEqual(inst.snapshot?.element[5].definition, "The date and/or time that this version of the report was released from the source diagnostic service.")
		XCTAssertFalse(inst.snapshot?.element[5].isModifier.value ?? true)
		XCTAssertEqual(inst.snapshot?.element[5].max, "1")
		XCTAssertEqual(inst.snapshot?.element[5].min.value, 1)
		XCTAssertEqual(inst.snapshot?.element[5].path, "DiagnosticReport.issued")
		XCTAssertEqual(inst.snapshot?.element[5].short, "Date this version was released")
		XCTAssertEqual(inst.snapshot?.element[5].type[0].code, "dateTime")
		XCTAssertEqual(inst.snapshot?.element[6].base?.max, "1")
		XCTAssertEqual(inst.snapshot?.element[6].base?.min.value, 1)
		XCTAssertEqual(inst.snapshot?.element[6].base?.path, "DiagnosticReport.subject")
		XCTAssertEqual(inst.snapshot?.element[6].definition, "The subject of the report. Usually, but not always, this is a patient. However diagnostic services also perform analyses on specimens collected from a variety of other sources.")
		XCTAssertFalse(inst.snapshot?.element[6].isModifier.value ?? true)
		XCTAssertEqual(inst.snapshot?.element[6].max, "1")
		XCTAssertEqual(inst.snapshot?.element[6].min.value, 1)
		XCTAssertEqual(inst.snapshot?.element[6].path, "DiagnosticReport.subject")
		XCTAssertEqual(inst.snapshot?.element[6].short, "The subject of the report")
		XCTAssertEqual(inst.snapshot?.element[6].type[0].code, "Reference")
		XCTAssertEqual(inst.snapshot?.element[6].type[0].profile[0].value, "http://hl7.org/fhir/StructureDefinition/Patient")
		XCTAssertEqual(inst.snapshot?.element[6].type[1].code, "Reference")
		XCTAssertEqual(inst.snapshot?.element[6].type[1].profile[0].value, "http://hl7.org/fhir/StructureDefinition/Group")
		XCTAssertEqual(inst.snapshot?.element[6].type[2].code, "Reference")
		XCTAssertEqual(inst.snapshot?.element[6].type[2].profile[0].value, "http://hl7.org/fhir/StructureDefinition/Device")
		XCTAssertEqual(inst.snapshot?.element[7].base?.max, "1")
		XCTAssertEqual(inst.snapshot?.element[7].base?.min.value, 1)
		XCTAssertEqual(inst.snapshot?.element[7].base?.path, "DiagnosticReport.performer")
		XCTAssertEqual(inst.snapshot?.element[7].comments, "This is not necessarily the source of the atomic data items - it's the entity that takes responsibility for the clinical report.")
		XCTAssertEqual(inst.snapshot?.element[7].definition, "The diagnostic service that is responsible for issuing the report.")
		XCTAssertFalse(inst.snapshot?.element[7].isModifier.value ?? true)
		XCTAssertEqual(inst.snapshot?.element[7].max, "1")
		XCTAssertEqual(inst.snapshot?.element[7].min.value, 1)
		XCTAssertEqual(inst.snapshot?.element[7].path, "DiagnosticReport.performer")
		XCTAssertEqual(inst.snapshot?.element[7].short, "Responsible Diagnostic Service")
		XCTAssertEqual(inst.snapshot?.element[7].type[0].code, "Reference")
		XCTAssertEqual(inst.snapshot?.element[7].type[0].profile[0].value, "http://hl7.org/fhir/StructureDefinition/Observation")
		XCTAssertEqual(inst.snapshot?.element[8].base?.max, "*")
		XCTAssertEqual(inst.snapshot?.element[8].base?.min.value, 0)
		XCTAssertEqual(inst.snapshot?.element[8].base?.path, "DiagnosticReport.identifier")
		XCTAssertEqual(inst.snapshot?.element[8].definition, "The local ID assigned to the report by the order filler, usually by the Information System of the diagnostic service provider.")
		XCTAssertFalse(inst.snapshot?.element[8].isModifier.value ?? true)
		XCTAssertEqual(inst.snapshot?.element[8].max, "1")
		XCTAssertEqual(inst.snapshot?.element[8].min.value, 0)
		XCTAssertEqual(inst.snapshot?.element[8].path, "DiagnosticReport.identifier")
		XCTAssertEqual(inst.snapshot?.element[8].short, "Id for external references to this report")
		XCTAssertEqual(inst.snapshot?.element[8].type[0].code, "Identifier")
		XCTAssertEqual(inst.snapshot?.element[9].base?.max, "*")
		XCTAssertEqual(inst.snapshot?.element[9].base?.min.value, 0)
		XCTAssertEqual(inst.snapshot?.element[9].base?.path, "DiagnosticReport.request")
		XCTAssertEqual(inst.snapshot?.element[9].definition, "Details concerning a single pathology test requested.")
		XCTAssertFalse(inst.snapshot?.element[9].isModifier.value ?? true)
		XCTAssertEqual(inst.snapshot?.element[9].max, "*")
		XCTAssertEqual(inst.snapshot?.element[9].min.value, 0)
		XCTAssertEqual(inst.snapshot?.element[9].path, "DiagnosticReport.request")
		XCTAssertEqual(inst.snapshot?.element[9].short, "What was requested")
		XCTAssertEqual(inst.snapshot?.element[9].type[0].code, "Reference")
		XCTAssertEqual(inst.snapshot?.element[9].type[0].profile[0].value, "http://hl7.org/fhir/StructureDefinition/DiagnosticOrder")
		XCTAssertEqual(inst.status, "draft")
		XCTAssertEqual(inst.text?.status, "generated")
		XCTAssertEqual(inst.url, "http://hl7.org/fhir/StructureDefinition/example")
		XCTAssertEqual(inst.useContext[0].coding[0].code, "AU")
		XCTAssertEqual(inst.useContext[0].coding[0].system, "urn:iso:std:iso:3166")
		XCTAssertEqual(inst.version, "2")
		
		return inst
	}
}
