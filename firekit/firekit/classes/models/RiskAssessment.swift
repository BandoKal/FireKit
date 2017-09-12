//
//  RiskAssessment.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/RiskAssessment) on 2017-09-11.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Potential outcomes for a subject with likelihood.
 *
 *  An assessment of the likely outcome(s) for a patient or other subject as well as the likelihood of each outcome.
 */
open class RiskAssessment: DomainResource {
	override open class var resourceType: String {
		get { return "RiskAssessment" }
	}

    public let basis = RealmSwift.List<Reference>()
    @objc public dynamic var condition: Reference?
    public func upsert(condition: Reference?) {
        upsert(prop: &self.condition, val: condition)
    }
    @objc public dynamic var date: DateTime?
    @objc public dynamic var encounter: Reference?
    public func upsert(encounter: Reference?) {
        upsert(prop: &self.encounter, val: encounter)
    }
    @objc public dynamic var identifier: Identifier?
    public func upsert(identifier: Identifier?) {
        upsert(prop: &self.identifier, val: identifier)
    }
    @objc public dynamic var method: CodeableConcept?
    public func upsert(method: CodeableConcept?) {
        upsert(prop: &self.method, val: method)
    }
    @objc public dynamic var mitigation: String?
    @objc public dynamic var performer: Reference?
    public func upsert(performer: Reference?) {
        upsert(prop: &self.performer, val: performer)
    }
    public let prediction = RealmSwift.List<RiskAssessmentPrediction>()
    @objc public dynamic var subject: Reference?
    public func upsert(subject: Reference?) {
        upsert(prop: &self.subject, val: subject)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case basis = "basis"
        case condition = "condition"
        case date = "date"
        case encounter = "encounter"
        case identifier = "identifier"
        case method = "method"
        case mitigation = "mitigation"
        case performer = "performer"
        case prediction = "prediction"
        case subject = "subject"
    }
    
    public required init() {
      super.init()
    }

    public required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    public required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.basis.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .basis) ?? [])
        self.condition = try container.decodeIfPresent(Reference.self, forKey: .condition)
        self.date = try container.decodeIfPresent(DateTime.self, forKey: .date)
        self.encounter = try container.decodeIfPresent(Reference.self, forKey: .encounter)
        self.identifier = try container.decodeIfPresent(Identifier.self, forKey: .identifier)
        self.method = try container.decodeIfPresent(CodeableConcept.self, forKey: .method)
        self.mitigation = try container.decodeIfPresent(String.self, forKey: .mitigation)
        self.performer = try container.decodeIfPresent(Reference.self, forKey: .performer)
        self.prediction.append(objectsIn: try container.decodeIfPresent([RiskAssessmentPrediction].self, forKey: .prediction) ?? [])
        self.subject = try container.decodeIfPresent(Reference.self, forKey: .subject)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Array(self.basis), forKey: .basis)
        try container.encodeIfPresent(self.condition, forKey: .condition)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.encounter, forKey: .encounter)
        try container.encodeIfPresent(self.identifier, forKey: .identifier)
        try container.encodeIfPresent(self.method, forKey: .method)
        try container.encodeIfPresent(self.mitigation, forKey: .mitigation)
        try container.encodeIfPresent(self.performer, forKey: .performer)
        try container.encode(Array(self.prediction), forKey: .prediction)
        try container.encodeIfPresent(self.subject, forKey: .subject)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["basis"] {
				presentKeys.insert("basis")
				if let val = exist as? [FHIRJSON] {
					if let vals = Reference.instantiate(fromArray: val, owner: self) as? [Reference] {
						if let realm = self.realm { realm.delete(self.basis) }
						self.basis.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "basis", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["condition"] {
				presentKeys.insert("condition")
				if let val = exist as? FHIRJSON {
					upsert(condition: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "condition", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["date"] {
				presentKeys.insert("date")
				if let val = exist as? String {
					self.date = DateTime(string: val)
				}
				else {
					errors.append(FHIRJSONError(key: "date", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["encounter"] {
				presentKeys.insert("encounter")
				if let val = exist as? FHIRJSON {
					upsert(encounter: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "encounter", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["identifier"] {
				presentKeys.insert("identifier")
				if let val = exist as? FHIRJSON {
					upsert(identifier: Identifier(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "identifier", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["method"] {
				presentKeys.insert("method")
				if let val = exist as? FHIRJSON {
					upsert(method: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "method", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["mitigation"] {
				presentKeys.insert("mitigation")
				if let val = exist as? String {
					self.mitigation = val
				}
				else {
					errors.append(FHIRJSONError(key: "mitigation", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["performer"] {
				presentKeys.insert("performer")
				if let val = exist as? FHIRJSON {
					upsert(performer: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "performer", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["prediction"] {
				presentKeys.insert("prediction")
				if let val = exist as? [FHIRJSON] {
					if let vals = RiskAssessmentPrediction.instantiate(fromArray: val, owner: self) as? [RiskAssessmentPrediction] {
						if let realm = self.realm { realm.delete(self.prediction) }
						self.prediction.append(objectsIn: vals)
					}
				}
				else {
					errors.append(FHIRJSONError(key: "prediction", wants: Array<FHIRJSON>.self, has: type(of: exist)))
				}
			}
			if let exist = js["subject"] {
				presentKeys.insert("subject")
				if let val = exist as? FHIRJSON {
					upsert(subject: Reference(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "subject", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if basis.count > 0 {
			json["basis"] = Array(basis.map() { $0.asJSON() })
		}
		if let condition = self.condition {
			json["condition"] = condition.asJSON()
		}
		if let date = self.date {
			json["date"] = date.asJSON()
		}
		if let encounter = self.encounter {
			json["encounter"] = encounter.asJSON()
		}
		if let identifier = self.identifier {
			json["identifier"] = identifier.asJSON()
		}
		if let method = self.method {
			json["method"] = method.asJSON()
		}
		if let mitigation = self.mitigation {
			json["mitigation"] = mitigation.asJSON()
		}
		if let performer = self.performer {
			json["performer"] = performer.asJSON()
		}
		if prediction.count > 0 {
			json["prediction"] = Array(prediction.map() { $0.asJSON() })
		}
		if let subject = self.subject {
			json["subject"] = subject.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(RiskAssessment.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy RiskAssessment. Will return empty instance: \(error))")
		}
		return RiskAssessment.init()
	}
}


/**
 *  Outcome predicted.
 *
 *  Describes the expected outcome for the subject.
 */
open class RiskAssessmentPrediction: BackboneElement {
	override open class var resourceType: String {
		get { return "RiskAssessmentPrediction" }
	}

    @objc public dynamic var outcome: CodeableConcept?
    public func upsert(outcome: CodeableConcept?) {
        upsert(prop: &self.outcome, val: outcome)
    }
    @objc public dynamic var probabilityCodeableConcept: CodeableConcept?
    public func upsert(probabilityCodeableConcept: CodeableConcept?) {
        upsert(prop: &self.probabilityCodeableConcept, val: probabilityCodeableConcept)
    }
    @objc public dynamic var probabilityDecimal: RealmDecimal?
    @objc public dynamic var probabilityRange: Range?
    public func upsert(probabilityRange: Range?) {
        upsert(prop: &self.probabilityRange, val: probabilityRange)
    }
    @objc public dynamic var rationale: String?
    @objc public dynamic var relativeRisk: RealmDecimal?
    @objc public dynamic var whenPeriod: Period?
    public func upsert(whenPeriod: Period?) {
        upsert(prop: &self.whenPeriod, val: whenPeriod)
    }
    @objc public dynamic var whenRange: Range?
    public func upsert(whenRange: Range?) {
        upsert(prop: &self.whenRange, val: whenRange)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(outcome: CodeableConcept) {
        self.init()
        self.outcome = outcome
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case outcome = "outcome"
        case probabilityCodeableConcept = "probabilityCodeableConcept"
        case probabilityDecimal = "probabilityDecimal"
        case probabilityRange = "probabilityRange"
        case rationale = "rationale"
        case relativeRisk = "relativeRisk"
        case whenPeriod = "whenPeriod"
        case whenRange = "whenRange"
    }
    
    public required init() {
      super.init()
    }

    public required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    public required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.outcome = try container.decodeIfPresent(CodeableConcept.self, forKey: .outcome)
        self.probabilityCodeableConcept = try container.decodeIfPresent(CodeableConcept.self, forKey: .probabilityCodeableConcept)
        self.probabilityDecimal = try container.decodeIfPresent(RealmDecimal.self, forKey: .probabilityDecimal)
        self.probabilityRange = try container.decodeIfPresent(Range.self, forKey: .probabilityRange)
        self.rationale = try container.decodeIfPresent(String.self, forKey: .rationale)
        self.relativeRisk = try container.decodeIfPresent(RealmDecimal.self, forKey: .relativeRisk)
        self.whenPeriod = try container.decodeIfPresent(Period.self, forKey: .whenPeriod)
        self.whenRange = try container.decodeIfPresent(Range.self, forKey: .whenRange)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.outcome, forKey: .outcome)
        try container.encodeIfPresent(self.probabilityCodeableConcept, forKey: .probabilityCodeableConcept)
        try container.encodeIfPresent(self.probabilityDecimal, forKey: .probabilityDecimal)
        try container.encodeIfPresent(self.probabilityRange, forKey: .probabilityRange)
        try container.encodeIfPresent(self.rationale, forKey: .rationale)
        try container.encodeIfPresent(self.relativeRisk, forKey: .relativeRisk)
        try container.encodeIfPresent(self.whenPeriod, forKey: .whenPeriod)
        try container.encodeIfPresent(self.whenRange, forKey: .whenRange)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["outcome"] {
				presentKeys.insert("outcome")
				if let val = exist as? FHIRJSON {
					upsert(outcome: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "outcome", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			else {
				errors.append(FHIRJSONError(key: "outcome"))
			}
			if let exist = js["probabilityCodeableConcept"] {
				presentKeys.insert("probabilityCodeableConcept")
				if let val = exist as? FHIRJSON {
					upsert(probabilityCodeableConcept: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "probabilityCodeableConcept", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["probabilityDecimal"] {
				presentKeys.insert("probabilityDecimal")
				if let val = exist as? NSNumber {
					self.probabilityDecimal = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "probabilityDecimal", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["probabilityRange"] {
				presentKeys.insert("probabilityRange")
				if let val = exist as? FHIRJSON {
					upsert(probabilityRange: Range(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "probabilityRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["rationale"] {
				presentKeys.insert("rationale")
				if let val = exist as? String {
					self.rationale = val
				}
				else {
					errors.append(FHIRJSONError(key: "rationale", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["relativeRisk"] {
				presentKeys.insert("relativeRisk")
				if let val = exist as? NSNumber {
					self.relativeRisk = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "relativeRisk", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["whenPeriod"] {
				presentKeys.insert("whenPeriod")
				if let val = exist as? FHIRJSON {
					upsert(whenPeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "whenPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["whenRange"] {
				presentKeys.insert("whenRange")
				if let val = exist as? FHIRJSON {
					upsert(whenRange: Range(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "whenRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let outcome = self.outcome {
			json["outcome"] = outcome.asJSON()
		}
		if let probabilityCodeableConcept = self.probabilityCodeableConcept {
			json["probabilityCodeableConcept"] = probabilityCodeableConcept.asJSON()
		}
		if let probabilityDecimal = self.probabilityDecimal {
			json["probabilityDecimal"] = probabilityDecimal.asJSON()
		}
		if let probabilityRange = self.probabilityRange {
			json["probabilityRange"] = probabilityRange.asJSON()
		}
		if let rationale = self.rationale {
			json["rationale"] = rationale.asJSON()
		}
		if let relativeRisk = self.relativeRisk {
			json["relativeRisk"] = relativeRisk.asJSON()
		}
		if let whenPeriod = self.whenPeriod {
			json["whenPeriod"] = whenPeriod.asJSON()
		}
		if let whenRange = self.whenRange {
			json["whenRange"] = whenRange.asJSON()
		}
		
		return json
	}
*/
	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(RiskAssessmentPrediction.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy RiskAssessmentPrediction. Will return empty instance: \(error))")
		}
		return RiskAssessmentPrediction.init()
	}
}

