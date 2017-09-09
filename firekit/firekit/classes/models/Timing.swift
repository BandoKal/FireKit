//
//  Timing.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Timing) on 2017-09-09.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  A timing schedule that specifies an event that may occur multiple times.
 *
 *  Specifies an event that may occur multiple times. Timing schedules are used to record when things are expected or
 *  requested to occur. The most common usage is in dosage instructions for medications. They are also used when
 *  planning care of various kinds.
 */
open class Timing: Element {
	override open class var resourceType: String {
		get { return "Timing" }
	}

    @objc public dynamic var code: CodeableConcept?
    public func upsert(code: CodeableConcept?) {
        upsert(prop: &self.code, val: code)
    }
    public let event = RealmSwift.List<DateTime>()
    @objc public dynamic var repeat_fhir: TimingRepeat?
    public func upsert(repeat_fhir: TimingRepeat?) {
        upsert(prop: &self.repeat_fhir, val: repeat_fhir)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case event = "event"
        case repeat_fhir = "repeat"
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


        // CodeableConcept: FHIRJSON
        if let codeVal = try container.decodeIfPresent(CodeableConcept.self, forKey: .code) {
          self.code = codeVal
        }
        if let eventVals = try container.decodeIfPresent([DateTime].self, forKey: .event) {
          // DateTime: String
        }
        // TimingRepeat: FHIRJSON
        if let repeat_fhirVal = try container.decodeIfPresent(TimingRepeat.self, forKey: .repeat_fhir) {
          self.repeat_fhir = repeat_fhirVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encode(self.event.flatMap { $0 }, forKey: .event)
        try container.encodeIfPresent(self.repeat_fhir, forKey: .repeat_fhir)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["code"] {
				presentKeys.insert("code")
				if let val = exist as? FHIRJSON {
					upsert(code: CodeableConcept(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "code", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["event"] {
				presentKeys.insert("event")
				if let val = exist as? [String] {
					// is_native or 'FHIRElement'
					self.event.append(objectsIn: DateTime.instantiate(fromArray: val))
				}
				else {
					errors.append(FHIRJSONError(key: "event", wants: Array<String>.self, has: type(of: exist)))
				}
			}
			if let exist = js["repeat"] {
				presentKeys.insert("repeat")
				if let val = exist as? FHIRJSON {
					upsert(repeat_fhir: TimingRepeat(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "repeat", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let code = self.code {
			json["code"] = code.asJSON()
		}
		if event.count > 0 {
			json["event"] = Array(event.map() { $0.asJSON() })
		}
		if let repeat_fhir = self.repeat_fhir {
			json["repeat"] = repeat_fhir.asJSON()
		}
		
		return json
	}
*/
}


/**
 *  When the event is to occur.
 *
 *  A set of rules that describe when the event should occur.
 */
open class TimingRepeat: Element {
	override open class var resourceType: String {
		get { return "TimingRepeat" }
	}

    @objc public dynamic var boundsPeriod: Period?
    public func upsert(boundsPeriod: Period?) {
        upsert(prop: &self.boundsPeriod, val: boundsPeriod)
    }
    @objc public dynamic var boundsQuantity: Quantity?
    public func upsert(boundsQuantity: Quantity?) {
        upsert(prop: &self.boundsQuantity, val: boundsQuantity)
    }
    @objc public dynamic var boundsRange: Range?
    public func upsert(boundsRange: Range?) {
        upsert(prop: &self.boundsRange, val: boundsRange)
    }
    public let count = RealmOptional<Int>()
    @objc public dynamic var duration: RealmDecimal?
    @objc public dynamic var durationMax: RealmDecimal?
    @objc public dynamic var durationUnits: String?
    public let frequency = RealmOptional<Int>()
    public let frequencyMax = RealmOptional<Int>()
    @objc public dynamic var period: RealmDecimal?
    @objc public dynamic var periodMax: RealmDecimal?
    @objc public dynamic var periodUnits: String?
    @objc public dynamic var when: String?

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case boundsPeriod = "boundsPeriod"
        case boundsQuantity = "boundsQuantity"
        case boundsRange = "boundsRange"
        case count = "count"
        case duration = "duration"
        case durationMax = "durationMax"
        case durationUnits = "durationUnits"
        case frequency = "frequency"
        case frequencyMax = "frequencyMax"
        case period = "period"
        case periodMax = "periodMax"
        case periodUnits = "periodUnits"
        case when = "when"
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


        // Period: FHIRJSON
        if let boundsPeriodVal = try container.decodeIfPresent(Period.self, forKey: .boundsPeriod) {
          self.boundsPeriod = boundsPeriodVal
        }
        // Quantity: FHIRJSON
        if let boundsQuantityVal = try container.decodeIfPresent(Quantity.self, forKey: .boundsQuantity) {
          self.boundsQuantity = boundsQuantityVal
        }
        // Range: FHIRJSON
        if let boundsRangeVal = try container.decodeIfPresent(Range.self, forKey: .boundsRange) {
          self.boundsRange = boundsRangeVal
        }
        // Int: Int
        if let countVal = try container.decodeIfPresent(Int.self, forKey: .count) {
          self.count.value = countVal
        }
        // RealmDecimal: NSNumber
        if let durationVal = try container.decodeIfPresent(RealmDecimal.self, forKey: .duration) {
          self.duration = durationVal
        }
        // RealmDecimal: NSNumber
        if let durationMaxVal = try container.decodeIfPresent(RealmDecimal.self, forKey: .durationMax) {
          self.durationMax = durationMaxVal
        }
        // String: String
        if let durationUnitsVal = try container.decodeIfPresent(String.self, forKey: .durationUnits) {
          self.durationUnits = durationUnitsVal
        }
        // Int: Int
        if let frequencyVal = try container.decodeIfPresent(Int.self, forKey: .frequency) {
          self.frequency.value = frequencyVal
        }
        // Int: Int
        if let frequencyMaxVal = try container.decodeIfPresent(Int.self, forKey: .frequencyMax) {
          self.frequencyMax.value = frequencyMaxVal
        }
        // RealmDecimal: NSNumber
        if let periodVal = try container.decodeIfPresent(RealmDecimal.self, forKey: .period) {
          self.period = periodVal
        }
        // RealmDecimal: NSNumber
        if let periodMaxVal = try container.decodeIfPresent(RealmDecimal.self, forKey: .periodMax) {
          self.periodMax = periodMaxVal
        }
        // String: String
        if let periodUnitsVal = try container.decodeIfPresent(String.self, forKey: .periodUnits) {
          self.periodUnits = periodUnitsVal
        }
        // String: String
        if let whenVal = try container.decodeIfPresent(String.self, forKey: .when) {
          self.when = whenVal
        }
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.boundsPeriod, forKey: .boundsPeriod)
        try container.encodeIfPresent(self.boundsQuantity, forKey: .boundsQuantity)
        try container.encodeIfPresent(self.boundsRange, forKey: .boundsRange)
        try container.encodeIfPresent(self.count.value, forKey: .count)
        try container.encodeIfPresent(self.duration, forKey: .duration)
        try container.encodeIfPresent(self.durationMax, forKey: .durationMax)
        try container.encodeIfPresent(self.durationUnits, forKey: .durationUnits)
        try container.encodeIfPresent(self.frequency.value, forKey: .frequency)
        try container.encodeIfPresent(self.frequencyMax.value, forKey: .frequencyMax)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encodeIfPresent(self.periodMax, forKey: .periodMax)
        try container.encodeIfPresent(self.periodUnits, forKey: .periodUnits)
        try container.encodeIfPresent(self.when, forKey: .when)
    }
/*
	
	override open func populate(from json: FHIRJSON?, presentKeys: inout Set<String>) -> [FHIRJSONError]? {
		var errors = super.populate(from: json, presentKeys: &presentKeys) ?? [FHIRJSONError]()
		if let js = json {
			if let exist = js["boundsPeriod"] {
				presentKeys.insert("boundsPeriod")
				if let val = exist as? FHIRJSON {
					upsert(boundsPeriod: Period(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "boundsPeriod", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["boundsQuantity"] {
				presentKeys.insert("boundsQuantity")
				if let val = exist as? FHIRJSON {
					upsert(boundsQuantity: Quantity(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "boundsQuantity", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["boundsRange"] {
				presentKeys.insert("boundsRange")
				if let val = exist as? FHIRJSON {
					upsert(boundsRange: Range(json: val, owner: self))
				}
				else {
					errors.append(FHIRJSONError(key: "boundsRange", wants: FHIRJSON.self, has: type(of: exist)))
				}
			}
			if let exist = js["count"] {
				presentKeys.insert("count")
				if let val = exist as? Int {
					self.count.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "count", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["duration"] {
				presentKeys.insert("duration")
				if let val = exist as? NSNumber {
					self.duration = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "duration", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["durationMax"] {
				presentKeys.insert("durationMax")
				if let val = exist as? NSNumber {
					self.durationMax = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "durationMax", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["durationUnits"] {
				presentKeys.insert("durationUnits")
				if let val = exist as? String {
					self.durationUnits = val
				}
				else {
					errors.append(FHIRJSONError(key: "durationUnits", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["frequency"] {
				presentKeys.insert("frequency")
				if let val = exist as? Int {
					self.frequency.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "frequency", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["frequencyMax"] {
				presentKeys.insert("frequencyMax")
				if let val = exist as? Int {
					self.frequencyMax.value = val
				}
				else {
					errors.append(FHIRJSONError(key: "frequencyMax", wants: Int.self, has: type(of: exist)))
				}
			}
			if let exist = js["period"] {
				presentKeys.insert("period")
				if let val = exist as? NSNumber {
					self.period = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "period", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["periodMax"] {
				presentKeys.insert("periodMax")
				if let val = exist as? NSNumber {
					self.periodMax = RealmDecimal(json: val)
				}
				else {
					errors.append(FHIRJSONError(key: "periodMax", wants: NSNumber.self, has: type(of: exist)))
				}
			}
			if let exist = js["periodUnits"] {
				presentKeys.insert("periodUnits")
				if let val = exist as? String {
					self.periodUnits = val
				}
				else {
					errors.append(FHIRJSONError(key: "periodUnits", wants: String.self, has: type(of: exist)))
				}
			}
			if let exist = js["when"] {
				presentKeys.insert("when")
				if let val = exist as? String {
					self.when = val
				}
				else {
					errors.append(FHIRJSONError(key: "when", wants: String.self, has: type(of: exist)))
				}
			}
		}
		return errors.isEmpty ? nil : errors
	}
	
	override open func asJSON() -> FHIRJSON {
		var json = super.asJSON()
		
		if let boundsPeriod = self.boundsPeriod {
			json["boundsPeriod"] = boundsPeriod.asJSON()
		}
		if let boundsQuantity = self.boundsQuantity {
			json["boundsQuantity"] = boundsQuantity.asJSON()
		}
		if let boundsRange = self.boundsRange {
			json["boundsRange"] = boundsRange.asJSON()
		}
		if let count = self.count.value {
			json["count"] = count.asJSON()
		}
		if let duration = self.duration {
			json["duration"] = duration.asJSON()
		}
		if let durationMax = self.durationMax {
			json["durationMax"] = durationMax.asJSON()
		}
		if let durationUnits = self.durationUnits {
			json["durationUnits"] = durationUnits.asJSON()
		}
		if let frequency = self.frequency.value {
			json["frequency"] = frequency.asJSON()
		}
		if let frequencyMax = self.frequencyMax.value {
			json["frequencyMax"] = frequencyMax.asJSON()
		}
		if let period = self.period {
			json["period"] = period.asJSON()
		}
		if let periodMax = self.periodMax {
			json["periodMax"] = periodMax.asJSON()
		}
		if let periodUnits = self.periodUnits {
			json["periodUnits"] = periodUnits.asJSON()
		}
		if let when = self.when {
			json["when"] = when.asJSON()
		}
		
		return json
	}
*/
}

