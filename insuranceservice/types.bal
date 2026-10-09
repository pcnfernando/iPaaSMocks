// Insurance policy record
public type InsurancePolicy record {|
    string username;
    string policyNumber;
    string policyType;   // "HEALTH"
    decimal coverageAmount;
    decimal premiumAmount;
    string startDate;
    string endDate;
    string status;       // "ACTIVE", "EXPIRED", "SUSPENDED"
    // B2B: set only for partner-organization employees (Asgardeo child orgs,
    // e.g. "Best Car Mart") covered by a group policy the partner buys for
    // its staff; unset for direct (B2C) customers and insurer employees.
    string organization?;
|};

// Claim record
public type Claim record {|
    string claimId;
    string claimType;
    decimal amount;
    string description;
    string submittedDate;
    string status;       // "PENDING", "APPROVED", "REJECTED"
|};

// Request types
public type UsernameRequest record {|
    string username;
|};

public type ClaimSubmitRequest record {|
    string username;
    string claimType;
    decimal amount;
    string description;
|};

public type PolicyUpdateRequest record {|
    string policyNumber;
    string status;
|};

// A claim plus the username of its policyholder — claimsDatabase is keyed
// by username with plain Claim[] values (no username on Claim itself), so
// the agent-facing "list all pending claims" view needs this wider shape
// to show who filed each claim (mirrors InsurancePolicy's own username
// field for the equivalent listAllPolicies view).
public type AgentClaim record {|
    string username;
    string claimId;
    string claimType;
    decimal amount;
    string description;
    string submittedDate;
    string status;
|};

public type ClaimUpdateRequest record {|
    string claimId;
    string status;
|};

// Response types
public type PolicyResponse record {|
    string policyNumber;
    string policyType;
    decimal coverageAmount;
    decimal premiumAmount;
    string startDate;
    string endDate;
    string status;
    string organization?;
|};

public type SuccessResponse record {|
    string message;
    true success;
|};

public type ErrorResponse record {|
    string message;
    string? errorCode = ();
|};
