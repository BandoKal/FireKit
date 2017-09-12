//
//  Provenance.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Provenance) on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Who, What, When for a set of resources.
 *
 *  Provenance of a resource is a record that describes entities and processes involved in producing and delivering or
 *  otherwise influencing that resource. Provenance provides a critical foundation for assessing authenticity, enabling
 *  trust, and allowing reproducibility. Provenance assertions are a form of contextual metadata and can themselves
 *  become important records with their own provenance. Provenance statement indicates clinical significance in terms of
 *  confidence in authenticity, reliability, and trustworthiness, integrity, and stage in lifecycle (e.g. Document
 *  Completion - has the artifact been legally authenticated), all of which may impact security, privacy, and trust
 *  policies.
 */
open class Provenance: DomainResource {
	override open class var resourceType: String {
		get { return "Provenance" }
	}

    @objc public dynamic var activity: CodeableConcept?
    public func upsert(activity: CodeableConcept?) {
        upsert(prop: &self.activity, val: activity)
    }
    public let agent = RealmSwift.List<ProvenanceAgent>()
    public let entity = RealmSwift.List<ProvenanceEntity>()
    @objc public dynamic var location: Reference?
    public func upsert(location: Reference?) {
        upsert(prop: &self.location, val: location)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    public let policy = RealmSwift.List<RealmString>()
    public let reason = RealmSwift.List<CodeableConcept>()
    @objc public dynamic var recorded: Instant?
    public let signature = RealmSwift.List<Signature>()
    public let target = RealmSwift.List<Reference>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(recorded: Instant, target: [Reference]) {
        self.init()
        self.recorded = recorded
        self.target.append(objectsIn: target)
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case activity = "activity"
        case agent = "agent"
        case entity = "entity"
        case location = "location"
        case period = "period"
        case policy = "policy"
        case reason = "reason"
        case recorded = "recorded"
        case signature = "signature"
        case target = "target"
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

        self.activity = try container.decodeIfPresent(CodeableConcept.self, forKey: .activity)
        self.agent.append(objectsIn: try container.decodeIfPresent([ProvenanceAgent].self, forKey: .agent) ?? [])
        self.entity.append(objectsIn: try container.decodeIfPresent([ProvenanceEntity].self, forKey: .entity) ?? [])
        self.location = try container.decodeIfPresent(Reference.self, forKey: .location)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.policy.append(objectsIn: try container.decodeIfPresent([RealmString].self, forKey: .policy) ?? [])
        self.reason.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .reason) ?? [])
        self.recorded = try container.decodeIfPresent(Instant.self, forKey: .recorded)
        self.signature.append(objectsIn: try container.decodeIfPresent([Signature].self, forKey: .signature) ?? [])
        self.target.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .target) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.activity, forKey: .activity)
        try container.encode(Array(self.agent), forKey: .agent)
        try container.encode(Array(self.entity), forKey: .entity)
        try container.encodeIfPresent(self.location, forKey: .location)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encode(Array(self.policy), forKey: .policy)
        try container.encode(Array(self.reason), forKey: .reason)
        try container.encodeIfPresent(self.recorded, forKey: .recorded)
        try container.encode(Array(self.signature), forKey: .signature)
        try container.encode(Array(self.target), forKey: .target)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Provenance.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Provenance. Will return empty instance: \(error))")
		}
		return Provenance.init()
	}
}


/**
 *  Agents involved in creating resource.
 *
 *  An agent takes a role in an activity such that the agent can be assigned some degree of responsibility for the
 *  activity taking place. An agent can be a person, an organization, software, or other entities that may be ascribed
 *  responsibility.
 */
open class ProvenanceAgent: BackboneElement {
	override open class var resourceType: String {
		get { return "ProvenanceAgent" }
	}

    @objc public dynamic var actor: Reference?
    public func upsert(actor: Reference?) {
        upsert(prop: &self.actor, val: actor)
    }
    public let relatedAgent = RealmSwift.List<ProvenanceAgentRelatedAgent>()
    @objc public dynamic var role: Coding?
    public func upsert(role: Coding?) {
        upsert(prop: &self.role, val: role)
    }
    @objc public dynamic var userId: Identifier?
    public func upsert(userId: Identifier?) {
        upsert(prop: &self.userId, val: userId)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(role: Coding) {
        self.init()
        self.role = role
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case actor = "actor"
        case relatedAgent = "relatedAgent"
        case role = "role"
        case userId = "userId"
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

        self.actor = try container.decodeIfPresent(Reference.self, forKey: .actor)
        self.relatedAgent.append(objectsIn: try container.decodeIfPresent([ProvenanceAgentRelatedAgent].self, forKey: .relatedAgent) ?? [])
        self.role = try container.decodeIfPresent(Coding.self, forKey: .role)
        self.userId = try container.decodeIfPresent(Identifier.self, forKey: .userId)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.actor, forKey: .actor)
        try container.encode(Array(self.relatedAgent), forKey: .relatedAgent)
        try container.encodeIfPresent(self.role, forKey: .role)
        try container.encodeIfPresent(self.userId, forKey: .userId)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ProvenanceAgent.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ProvenanceAgent. Will return empty instance: \(error))")
		}
		return ProvenanceAgent.init()
	}
}


/**
 *  Track delegation between agents.
 *
 *  A relationship between two the agents referenced in this resource. This is defined to allow for explicit description
 *  of the delegation between agents.  For example, this human author used this device, or one person acted on another's
 *  behest.
 */
open class ProvenanceAgentRelatedAgent: BackboneElement {
	override open class var resourceType: String {
		get { return "ProvenanceAgentRelatedAgent" }
	}

    @objc public dynamic var target: String?
    @objc public dynamic var type: CodeableConcept?
    public func upsert(type: CodeableConcept?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(target: String, type: CodeableConcept) {
        self.init()
        self.target = target
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case target = "target"
        case type = "type"
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

        self.target = try container.decodeIfPresent(String.self, forKey: .target)
        self.type = try container.decodeIfPresent(CodeableConcept.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.target, forKey: .target)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ProvenanceAgentRelatedAgent.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ProvenanceAgentRelatedAgent. Will return empty instance: \(error))")
		}
		return ProvenanceAgentRelatedAgent.init()
	}
}


/**
 *  An entity used in this activity.
 */
open class ProvenanceEntity: BackboneElement {
	override open class var resourceType: String {
		get { return "ProvenanceEntity" }
	}

    @objc public dynamic var agent: ProvenanceAgent?
    public func upsert(agent: ProvenanceAgent?) {
        upsert(prop: &self.agent, val: agent)
    }
    @objc public dynamic var display: String?
    @objc public dynamic var reference: String?
    @objc public dynamic var role: String?
    @objc public dynamic var type: Coding?
    public func upsert(type: Coding?) {
        upsert(prop: &self.type, val: type)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(reference: String, role: String, type: Coding) {
        self.init()
        self.reference = reference
        self.role = role
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case agent = "agent"
        case display = "display"
        case reference = "reference"
        case role = "role"
        case type = "type"
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

        self.agent = try container.decodeIfPresent(ProvenanceAgent.self, forKey: .agent)
        self.display = try container.decodeIfPresent(String.self, forKey: .display)
        self.reference = try container.decodeIfPresent(String.self, forKey: .reference)
        self.role = try container.decodeIfPresent(String.self, forKey: .role)
        self.type = try container.decodeIfPresent(Coding.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.agent, forKey: .agent)
        try container.encodeIfPresent(self.display, forKey: .display)
        try container.encodeIfPresent(self.reference, forKey: .reference)
        try container.encodeIfPresent(self.role, forKey: .role)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(ProvenanceEntity.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy ProvenanceEntity. Will return empty instance: \(error))")
		}
		return ProvenanceEntity.init()
	}
}

