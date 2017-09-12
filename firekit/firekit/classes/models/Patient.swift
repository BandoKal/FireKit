//
//  Patient.swift
//  SwiftFHIR
//
//  Generated from FHIR 1.0.2.7202 (http://hl7.org/fhir/StructureDefinition/Patient) on 2017-09-12.
//  2017, SMART Health IT.
//

import Foundation
import Realm
import RealmSwift


/**
 *  Information about an individual or animal receiving health care services.
 *
 *  Demographics and other administrative information about an individual or animal receiving care or other health-
 *  related services.
 */
open class Patient: DomainResource {
	override open class var resourceType: String {
		get { return "Patient" }
	}

    public let active = RealmOptional<Bool>()
    public let address = RealmSwift.List<Address>()
    @objc public dynamic var animal: PatientAnimal?
    public func upsert(animal: PatientAnimal?) {
        upsert(prop: &self.animal, val: animal)
    }
    @objc public dynamic var birthDate: FHIRDate?
    public let careProvider = RealmSwift.List<Reference>()
    public let communication = RealmSwift.List<PatientCommunication>()
    public let contact = RealmSwift.List<PatientContact>()
    public let deceasedBoolean = RealmOptional<Bool>()
    @objc public dynamic var deceasedDateTime: DateTime?
    @objc public dynamic var gender: String?
    public let identifier = RealmSwift.List<Identifier>()
    public let link = RealmSwift.List<PatientLink>()
    @objc public dynamic var managingOrganization: Reference?
    public func upsert(managingOrganization: Reference?) {
        upsert(prop: &self.managingOrganization, val: managingOrganization)
    }
    @objc public dynamic var maritalStatus: CodeableConcept?
    public func upsert(maritalStatus: CodeableConcept?) {
        upsert(prop: &self.maritalStatus, val: maritalStatus)
    }
    public let multipleBirthBoolean = RealmOptional<Bool>()
    public let multipleBirthInteger = RealmOptional<Int>()
    public let name = RealmSwift.List<HumanName>()
    public let photo = RealmSwift.List<Attachment>()
    public let telecom = RealmSwift.List<ContactPoint>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case active = "active"
        case address = "address"
        case animal = "animal"
        case birthDate = "birthDate"
        case careProvider = "careProvider"
        case communication = "communication"
        case contact = "contact"
        case deceasedBoolean = "deceasedBoolean"
        case deceasedDateTime = "deceasedDateTime"
        case gender = "gender"
        case identifier = "identifier"
        case link = "link"
        case managingOrganization = "managingOrganization"
        case maritalStatus = "maritalStatus"
        case multipleBirthBoolean = "multipleBirthBoolean"
        case multipleBirthInteger = "multipleBirthInteger"
        case name = "name"
        case photo = "photo"
        case telecom = "telecom"
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

        self.active.value = try container.decodeIfPresent(Bool.self, forKey: .active)
        self.address.append(objectsIn: try container.decodeIfPresent([Address].self, forKey: .address) ?? [])
        self.animal = try container.decodeIfPresent(PatientAnimal.self, forKey: .animal)
        self.birthDate = try container.decodeIfPresent(FHIRDate.self, forKey: .birthDate)
        self.careProvider.append(objectsIn: try container.decodeIfPresent([Reference].self, forKey: .careProvider) ?? [])
        self.communication.append(objectsIn: try container.decodeIfPresent([PatientCommunication].self, forKey: .communication) ?? [])
        self.contact.append(objectsIn: try container.decodeIfPresent([PatientContact].self, forKey: .contact) ?? [])
        self.deceasedBoolean.value = try container.decodeIfPresent(Bool.self, forKey: .deceasedBoolean)
        self.deceasedDateTime = try container.decodeIfPresent(DateTime.self, forKey: .deceasedDateTime)
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender)
        self.identifier.append(objectsIn: try container.decodeIfPresent([Identifier].self, forKey: .identifier) ?? [])
        self.link.append(objectsIn: try container.decodeIfPresent([PatientLink].self, forKey: .link) ?? [])
        self.managingOrganization = try container.decodeIfPresent(Reference.self, forKey: .managingOrganization)
        self.maritalStatus = try container.decodeIfPresent(CodeableConcept.self, forKey: .maritalStatus)
        self.multipleBirthBoolean.value = try container.decodeIfPresent(Bool.self, forKey: .multipleBirthBoolean)
        self.multipleBirthInteger.value = try container.decodeIfPresent(Int.self, forKey: .multipleBirthInteger)
        self.name.append(objectsIn: try container.decodeIfPresent([HumanName].self, forKey: .name) ?? [])
        self.photo.append(objectsIn: try container.decodeIfPresent([Attachment].self, forKey: .photo) ?? [])
        self.telecom.append(objectsIn: try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.active.value, forKey: .active)
        try container.encode(Array(self.address), forKey: .address)
        try container.encodeIfPresent(self.animal, forKey: .animal)
        try container.encodeIfPresent(self.birthDate, forKey: .birthDate)
        try container.encode(Array(self.careProvider), forKey: .careProvider)
        try container.encode(Array(self.communication), forKey: .communication)
        try container.encode(Array(self.contact), forKey: .contact)
        try container.encodeIfPresent(self.deceasedBoolean.value, forKey: .deceasedBoolean)
        try container.encodeIfPresent(self.deceasedDateTime, forKey: .deceasedDateTime)
        try container.encodeIfPresent(self.gender, forKey: .gender)
        try container.encode(Array(self.identifier), forKey: .identifier)
        try container.encode(Array(self.link), forKey: .link)
        try container.encodeIfPresent(self.managingOrganization, forKey: .managingOrganization)
        try container.encodeIfPresent(self.maritalStatus, forKey: .maritalStatus)
        try container.encodeIfPresent(self.multipleBirthBoolean.value, forKey: .multipleBirthBoolean)
        try container.encodeIfPresent(self.multipleBirthInteger.value, forKey: .multipleBirthInteger)
        try container.encode(Array(self.name), forKey: .name)
        try container.encode(Array(self.photo), forKey: .photo)
        try container.encode(Array(self.telecom), forKey: .telecom)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(Patient.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy Patient. Will return empty instance: \(error))")
		}
		return Patient.init()
	}
}


/**
 *  This patient is known to be an animal (non-human).
 *
 *  This patient is known to be an animal.
 */
open class PatientAnimal: BackboneElement {
	override open class var resourceType: String {
		get { return "PatientAnimal" }
	}

    @objc public dynamic var breed: CodeableConcept?
    public func upsert(breed: CodeableConcept?) {
        upsert(prop: &self.breed, val: breed)
    }
    @objc public dynamic var genderStatus: CodeableConcept?
    public func upsert(genderStatus: CodeableConcept?) {
        upsert(prop: &self.genderStatus, val: genderStatus)
    }
    @objc public dynamic var species: CodeableConcept?
    public func upsert(species: CodeableConcept?) {
        upsert(prop: &self.species, val: species)
    }

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(species: CodeableConcept) {
        self.init()
        self.species = species
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case breed = "breed"
        case genderStatus = "genderStatus"
        case species = "species"
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

        self.breed = try container.decodeIfPresent(CodeableConcept.self, forKey: .breed)
        self.genderStatus = try container.decodeIfPresent(CodeableConcept.self, forKey: .genderStatus)
        self.species = try container.decodeIfPresent(CodeableConcept.self, forKey: .species)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.breed, forKey: .breed)
        try container.encodeIfPresent(self.genderStatus, forKey: .genderStatus)
        try container.encodeIfPresent(self.species, forKey: .species)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(PatientAnimal.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy PatientAnimal. Will return empty instance: \(error))")
		}
		return PatientAnimal.init()
	}
}


/**
 *  A list of Languages which may be used to communicate with the patient about his or her health.
 *
 *  Languages which may be used to communicate with the patient about his or her health.
 */
open class PatientCommunication: BackboneElement {
	override open class var resourceType: String {
		get { return "PatientCommunication" }
	}

    @objc public dynamic var language: CodeableConcept?
    public func upsert(language: CodeableConcept?) {
        upsert(prop: &self.language, val: language)
    }
    public let preferred = RealmOptional<Bool>()

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(language: CodeableConcept) {
        self.init()
        self.language = language
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case language = "language"
        case preferred = "preferred"
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

        self.language = try container.decodeIfPresent(CodeableConcept.self, forKey: .language)
        self.preferred.value = try container.decodeIfPresent(Bool.self, forKey: .preferred)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.language, forKey: .language)
        try container.encodeIfPresent(self.preferred.value, forKey: .preferred)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(PatientCommunication.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy PatientCommunication. Will return empty instance: \(error))")
		}
		return PatientCommunication.init()
	}
}


/**
 *  A contact party (e.g. guardian, partner, friend) for the patient.
 */
open class PatientContact: BackboneElement {
	override open class var resourceType: String {
		get { return "PatientContact" }
	}

    @objc public dynamic var address: Address?
    public func upsert(address: Address?) {
        upsert(prop: &self.address, val: address)
    }
    @objc public dynamic var gender: String?
    @objc public dynamic var name: HumanName?
    public func upsert(name: HumanName?) {
        upsert(prop: &self.name, val: name)
    }
    @objc public dynamic var organization: Reference?
    public func upsert(organization: Reference?) {
        upsert(prop: &self.organization, val: organization)
    }
    @objc public dynamic var period: Period?
    public func upsert(period: Period?) {
        upsert(prop: &self.period, val: period)
    }
    public let relationship = RealmSwift.List<CodeableConcept>()
    public let telecom = RealmSwift.List<ContactPoint>()

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case address = "address"
        case gender = "gender"
        case name = "name"
        case organization = "organization"
        case period = "period"
        case relationship = "relationship"
        case telecom = "telecom"
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

        self.address = try container.decodeIfPresent(Address.self, forKey: .address)
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender)
        self.name = try container.decodeIfPresent(HumanName.self, forKey: .name)
        self.organization = try container.decodeIfPresent(Reference.self, forKey: .organization)
        self.period = try container.decodeIfPresent(Period.self, forKey: .period)
        self.relationship.append(objectsIn: try container.decodeIfPresent([CodeableConcept].self, forKey: .relationship) ?? [])
        self.telecom.append(objectsIn: try container.decodeIfPresent([ContactPoint].self, forKey: .telecom) ?? [])
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.address, forKey: .address)
        try container.encodeIfPresent(self.gender, forKey: .gender)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.organization, forKey: .organization)
        try container.encodeIfPresent(self.period, forKey: .period)
        try container.encode(Array(self.relationship), forKey: .relationship)
        try container.encode(Array(self.telecom), forKey: .telecom)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(PatientContact.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy PatientContact. Will return empty instance: \(error))")
		}
		return PatientContact.init()
	}
}


/**
 *  Link to another patient resource that concerns the same actual person.
 *
 *  Link to another patient resource that concerns the same actual patient.
 */
open class PatientLink: BackboneElement {
	override open class var resourceType: String {
		get { return "PatientLink" }
	}

    @objc public dynamic var other: Reference?
    public func upsert(other: Reference?) {
        upsert(prop: &self.other, val: other)
    }
    @objc public dynamic var type: String?

    /** Convenience initializer, taking all required properties as arguments. */
    public convenience init(other: Reference, type: String) {
        self.init()
        self.other = other
        self.type = type
    }

    // MARK: Codable
    private enum CodingKeys: String, CodingKey {
        case other = "other"
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

        self.other = try container.decodeIfPresent(Reference.self, forKey: .other)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.other, forKey: .other)
        try container.encodeIfPresent(self.type, forKey: .type)
    }

	public override func copy(with zone: NSZone? = nil) -> Any {
		do {
			let data = try JSONEncoder().encode(self)
			let clone = try JSONDecoder().decode(PatientLink.self, from: data)
			return clone
		} catch let error {
			print("Failed to copy PatientLink. Will return empty instance: \(error))")
		}
		return PatientLink.init()
	}
}

