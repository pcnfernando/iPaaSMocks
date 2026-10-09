// Mock policy database
// All policies are HealthGuard health insurance plans (GRP-HG-2024).
// Plan tiers per policy document:
//   Basic    – POL-HEALTH-00x – $100,000 coverage – $120.00/month
//   Standard – POL-HEALTH-00x – $150,000 coverage – $145.00/month
//   Enhanced – POL-HEALTH-00x – $250,000 coverage – $180.00/month
//   Premier  – POL-HEALTH-00x – $500,000 coverage – $350.00/month
//
// Keyed by "username", but really an email — /insurance/customer/policy
// and /insurance/customer/claims look this up by whatever the caller's
// Asgardeo identity resolves to (see sample_ui_apps/*/pages/*Dashboard.jsx),
// which for a real login is the user's email. The three entries below
// (sam@gmail.com/emp@insu.com/manager@insu.com) match the actual users
// scripts/04-provision-users-agent-identity-and-map-in-asgardeo-iam.sh
// provisions in Asgardeo — without a matching key here, a real logged-in
// user's policy/claims lookups always come back empty even with a
// perfectly valid, correctly-scoped token. sam@insu.com/pri_sam@insu.com/
// emp_jack@insu.com/man_jack@insu.com were the old two-tier
// ordinary/privilege model's users (retired 2026-09-04) and are gone from
// Asgardeo entirely now — replaced below. The rest (john_doe, emma_premier,
// etc.) were never real login identities in either model, just generic
// other-customers demo data for the employee/manager "list all policies"
// view — kept as-is.
// rami.desilva@gmail.com is a Google-login user (README Step 30): it must exist
// as a LOCAL Asgardeo user in insu_customer, not a JIT-provisioned one.
// B2B partner-organization users (Asgardeo child orgs "Best Car Mart" and
// "Acme Logistics", provisioned by scripts/28-setup-b2b-organizations.sh).
// Each partner employee sees only their own policy/claims (keyed by email
// like every other entry); insurer employees/managers see all via the
// list-all views, with the organization field showing whose policy it is.
map<InsurancePolicy> policyDatabase = {
    "alice@bestcarmart.com": {
        username: "alice@bestcarmart.com",
        policyNumber: "GRP-BCM-001",
        policyType: "HEALTH",
        coverageAmount: 150000.00,
        premiumAmount: 145.00,
        startDate: "2024-03-01",
        endDate: "2025-03-01",
        status: "ACTIVE",
        organization: "Best Car Mart"
    },
    "bob@bestcarmart.com": {
        username: "bob@bestcarmart.com",
        policyNumber: "GRP-BCM-002",
        policyType: "HEALTH",
        coverageAmount: 150000.00,
        premiumAmount: 145.00,
        startDate: "2024-03-01",
        endDate: "2025-03-01",
        status: "ACTIVE",
        organization: "Best Car Mart"
    },
    "carol@acmelogistics.com": {
        username: "carol@acmelogistics.com",
        policyNumber: "GRP-ACM-001",
        policyType: "HEALTH",
        coverageAmount: 250000.00,
        premiumAmount: 180.00,
        startDate: "2024-05-01",
        endDate: "2025-05-01",
        status: "ACTIVE",
        organization: "Acme Logistics"
    },
    "dave@acmelogistics.com": {
        username: "dave@acmelogistics.com",
        policyNumber: "GRP-ACM-002",
        policyType: "HEALTH",
        coverageAmount: 250000.00,
        premiumAmount: 180.00,
        startDate: "2024-05-01",
        endDate: "2025-05-01",
        status: "ACTIVE",
        organization: "Acme Logistics"
    },
    "sam@gmail.com": {
        username: "sam@gmail.com",
        policyNumber: "POL-HEALTH-009",
        policyType: "HEALTH",
        coverageAmount: 250000.00,
        premiumAmount: 180.00,
        // Renewed 2026-10-04 so the Insurance Policy Card credential isn't issued already
        // expired (docs/README_verifiable_credentials.md, Step 11).
        startDate: "2026-01-15",
        endDate: "2027-01-15",
        status: "ACTIVE"
    },
    // Verifiable-credentials demo users (docs/README_verifiable_credentials.md): Jane is
    // JIT-provisioned by a wallet login (use case 2), Mark self-registers with the wallet
    // (use case 3). Both are deleted and re-created in IS on every run, so their data lives
    // here keyed by email like everyone else's. Mark Taylor is NOT manager@insu.com.
    "jane@gmail.com": {
        username: "jane@gmail.com",
        policyNumber: "POL-HEALTH-014",
        policyType: "HEALTH",
        coverageAmount: 150000.00,
        premiumAmount: 145.00,
        startDate: "2026-03-01",
        endDate: "2027-03-01",
        status: "ACTIVE"
    },
    "mark.taylor@example.com": {
        username: "mark.taylor@example.com",
        policyNumber: "POL-HEALTH-015",
        policyType: "HEALTH",
        coverageAmount: 100000.00,
        premiumAmount: 120.00,
        startDate: "2026-06-01",
        endDate: "2027-06-01",
        status: "ACTIVE"
    },
    "pam@gmail.com": {
        username: "pam@gmail.com",
        policyNumber: "POL-HEALTH-012",
        policyType: "HEALTH",
        coverageAmount: 150000.00,
        premiumAmount: 145.00,
        startDate: "2024-04-01",
        endDate: "2025-04-01",
        status: "ACTIVE"
    },
    "rami.desilva@gmail.com": {
        username: "rami.desilva@gmail.com",
        policyNumber: "POL-HEALTH-013",
        policyType: "HEALTH",
        coverageAmount: 250000.00,
        premiumAmount: 180.00,
        startDate: "2024-06-01",
        endDate: "2025-06-01",
        status: "ACTIVE"
    },
    "emp@insu.com": {
        username: "emp@insu.com",
        policyNumber: "POL-HEALTH-010",
        policyType: "HEALTH",
        coverageAmount: 150000.00,
        premiumAmount: 145.00,
        startDate: "2024-02-10",
        endDate: "2025-02-10",
        status: "ACTIVE"
    },
    "manager@insu.com": {
        username: "manager@insu.com",
        policyNumber: "POL-HEALTH-011",
        policyType: "HEALTH",
        coverageAmount: 500000.00,
        premiumAmount: 350.00,
        startDate: "2024-02-10",
        endDate: "2025-02-10",
        status: "ACTIVE"
    },
    "john_doe": {
        username: "john_doe",
        policyNumber: "POL-HEALTH-001",
        policyType: "HEALTH",
        coverageAmount: 100000.00,
        premiumAmount: 120.00,
        startDate: "2024-01-01",
        endDate: "2025-01-01",
        status: "ACTIVE"
    },
    "emma_premier": {
        username: "emma_premier",
        policyNumber: "POL-HEALTH-002",
        policyType: "HEALTH",
        coverageAmount: 500000.00,
        premiumAmount: 350.00,
        startDate: "2024-01-01",
        endDate: "2025-01-01",
        status: "ACTIVE"
    },
    "alex_cashier": {
        username: "alex_cashier",
        policyNumber: "POL-HEALTH-006",
        policyType: "HEALTH",
        coverageAmount: 150000.00,
        premiumAmount: 145.00,
        startDate: "2024-03-01",
        endDate: "2025-03-01",
        status: "ACTIVE"
    },
    "sarah_williams": {
        username: "sarah_williams",
        policyNumber: "POL-HEALTH-007",
        policyType: "HEALTH",
        coverageAmount: 100000.00,
        premiumAmount: 120.00,
        startDate: "2023-06-01",
        endDate: "2024-06-01",
        status: "EXPIRED"
    },
    "michael_brown": {
        username: "michael_brown",
        policyNumber: "POL-HEALTH-008",
        policyType: "HEALTH",
        coverageAmount: 500000.00,
        premiumAmount: 350.00,
        startDate: "2024-01-15",
        endDate: "2025-01-15",
        status: "ACTIVE"
    },
    "rami.desilva@auth0.com": {
        username: "rami.desilva@auth0.com",
        policyNumber: "POL-HEALTH-003",
        policyType: "HEALTH",
        coverageAmount: 150000.00,
        premiumAmount: 145.00,
        startDate: "2024-02-01",
        endDate: "2025-02-01",
        status: "ACTIVE"
    },
    "rami.desilva.pri@auth0.com": {
        username: "rami.desilva.pri@auth0.com",
        policyNumber: "POL-HEALTH-004",
        policyType: "HEALTH",
        coverageAmount: 500000.00,
        premiumAmount: 350.00,
        startDate: "2024-02-01",
        endDate: "2025-02-01",
        status: "ACTIVE"
    },
    "lisa_chen": {
        username: "lisa_chen",
        policyNumber: "POL-HEALTH-005",
        policyType: "HEALTH",
        coverageAmount: 250000.00,
        premiumAmount: 180.00,
        startDate: "2024-03-01",
        endDate: "2025-03-01",
        status: "ACTIVE"
    }
};

// Mock claims database
// Valid claim types per HealthGuard policy document:
//   Outpatient    – doctor visits, specialist, lab, imaging, mental health outpatient
//   Hospitalization – inpatient hospital stay, surgery, mental health inpatient
//   Emergency     – emergency room visit
//   Pharmacy      – prescription drug (out-of-network pharmacy)
//   DME           – durable medical equipment purchase
//   Medical       – other medical services
map<Claim[]> claimsDatabase = {
    "alice@bestcarmart.com": [
        {
            claimId: "CLM-BCM-01",
            claimType: "Outpatient",
            amount: 320.00,
            description: "Annual physical and blood panel",
            submittedDate: "2024-06-12",
            status: "APPROVED"
        }
    ],
    "bob@bestcarmart.com": [
        {
            claimId: "CLM-BCM-02",
            claimType: "Dental",
            amount: 480.00,
            description: "Dental crown replacement",
            submittedDate: "2024-07-02",
            status: "PENDING"
        }
    ],
    "carol@acmelogistics.com": [
        {
            claimId: "CLM-ACM-01",
            claimType: "Physiotherapy",
            amount: 640.00,
            description: "Back-injury physiotherapy course (warehouse)",
            submittedDate: "2024-06-25",
            status: "APPROVED"
        }
    ],
    "dave@acmelogistics.com": [
        {
            claimId: "CLM-ACM-02",
            claimType: "Emergency",
            amount: 1850.00,
            description: "Emergency room visit after workplace incident",
            submittedDate: "2024-07-09",
            status: "PENDING"
        }
    ],
    "john_doe": [
        {
            claimId: "CLM-001",
            claimType: "Hospitalization",
            amount: 3200.00,
            description: "Emergency appendix surgery and inpatient recovery",
            submittedDate: "2024-03-10",
            status: "APPROVED"
        },
        {
            claimId: "CLM-002",
            claimType: "Outpatient",
            amount: 450.00,
            description: "Specialist consultation and diagnostic lab tests",
            submittedDate: "2024-05-22",
            status: "PENDING"
        }
    ],
    "emma_premier": [
        {
            claimId: "CLM-003",
            claimType: "Hospitalization",
            amount: 12000.00,
            description: "Knee replacement surgery and inpatient rehabilitation",
            submittedDate: "2024-02-18",
            status: "APPROVED"
        }
    ],
    "alex_cashier": [
        {
            claimId: "CLM-004",
            claimType: "Outpatient",
            amount: 280.00,
            description: "Urgent care visit for acute respiratory infection",
            submittedDate: "2024-04-05",
            status: "APPROVED"
        },
        {
            claimId: "CLM-005",
            claimType: "Pharmacy",
            amount: 95.00,
            description: "Prescription medication - antibiotics and inhaler (out-of-network pharmacy)",
            submittedDate: "2024-06-01",
            status: "APPROVED"
        }
    ],
    "sarah_williams": [
        {
            claimId: "CLM-011",
            claimType: "Outpatient",
            amount: 150.00,
            description: "Annual wellness exam and routine blood panel",
            submittedDate: "2024-03-20",
            status: "APPROVED"
        }
    ],
    "michael_brown": [
        {
            claimId: "CLM-012",
            claimType: "Hospitalization",
            amount: 18500.00,
            description: "Cardiac catheterization and coronary stent placement",
            submittedDate: "2024-04-10",
            status: "APPROVED"
        },
        {
            claimId: "CLM-013",
            claimType: "Outpatient",
            amount: 640.00,
            description: "Cardiac rehabilitation outpatient sessions (8 sessions)",
            submittedDate: "2024-06-15",
            status: "APPROVED"
        }
    ],
    "rami.desilva@auth0.com": [
        {
            claimId: "CLM-006",
            claimType: "Outpatient",
            amount: 320.00,
            description: "Annual health screening and lipid panel",
            submittedDate: "2024-07-14",
            status: "APPROVED"
        }
    ],
    "pam@gmail.com": [
        {
            claimId: "CLM-016",
            claimType: "Outpatient",
            amount: 210.00,
            description: "Dermatology consultation and skin allergy test",
            submittedDate: "2024-05-12",
            status: "APPROVED"
        },
        {
            claimId: "CLM-017",
            claimType: "Pharmacy",
            amount: 64.00,
            description: "Prescription medication - antihistamines (out-of-network pharmacy)",
            submittedDate: "2024-06-18",
            status: "PENDING"
        }
    ],
    "rami.desilva@gmail.com": [
        {
            claimId: "CLM-018",
            claimType: "Outpatient",
            amount: 275.00,
            description: "Specialist consultation and follow-up lab work",
            submittedDate: "2024-07-18",
            status: "APPROVED"
        },
        {
            claimId: "CLM-019",
            claimType: "Pharmacy",
            amount: 88.00,
            description: "Prescription medication (out-of-network pharmacy)",
            submittedDate: "2024-08-03",
            status: "PENDING"
        }
    ],
    "sam@gmail.com": [
        {
            claimId: "CLM-007",
            claimType: "Outpatient",
            amount: 560.00,
            description: "Orthopedic specialist consultation and X-ray imaging",
            submittedDate: "2024-06-20",
            status: "APPROVED"
        }
    ],
    "lisa_chen": [
        {
            claimId: "CLM-008",
            claimType: "Hospitalization",
            amount: 8500.00,
            description: "Laparoscopic cholecystectomy (gallbladder removal) and recovery",
            submittedDate: "2024-05-15",
            status: "APPROVED"
        },
        {
            claimId: "CLM-009",
            claimType: "Outpatient",
            amount: 180.00,
            description: "Post-operative follow-up consultation",
            submittedDate: "2024-06-10",
            status: "APPROVED"
        }
    ],
    "emp@insu.com": [
        {
            claimId: "CLM-010",
            claimType: "Medical",
            amount: 1200.00,
            description: "Comprehensive health screening and diagnostic tests",
            submittedDate: "2024-04-25",
            status: "APPROVED"
        },
        {
            claimId: "CLM-014",
            claimType: "DME",
            amount: 420.00,
            description: "CPAP device for diagnosed sleep apnea",
            submittedDate: "2024-07-08",
            status: "PENDING"
        }
    ],
    "manager@insu.com": [
        {
            claimId: "CLM-015",
            claimType: "Emergency",
            amount: 2750.00,
            description: "Emergency room visit for acute abdominal pain",
            submittedDate: "2024-05-02",
            status: "APPROVED"
        },
        {
            claimId: "CLM-020",
            claimType: "Outpatient",
            amount: 385.00,
            description: "Cardiology consultation and stress test",
            submittedDate: "2024-07-22",
            status: "PENDING"
        }
    ]
};
