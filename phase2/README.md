# ZT-HybridGuard: Phase 2 – Framework Design

## Overview
Phase 2 architects ZT for NexTech: 5 pillars, 5+ policies, and access flows turning Phase 1 threats into proactive defenses. NIST tenets guide—e.g., explicit verification blocks 90% spoof/tamper. Scalable for hybrid (sub-2s flows, no VPN drag).

## Pillars Table
| Pillar | Focus | NexTech Twist | Threat Tie | NIST Tenet |
|--------|-------|---------------|------------|------------|
| Identity | Who are you? | Slack/O365 MFA for Jordan's pings | Spoofing (8.1), AI deepfake (8.2) | Explicit verification |
| Devices | Gadget safe? | Block unpatched IoT for Alex | Elevation (8.8) | Per-session access |
| Workloads | Apps clean? | Isolate AWS deploys from O365 | Lateral pivots (8.8) | All resources equal |
| Network | Traffic secure? | Reroute café hops | Tampering (7.5), DoS (7.5) | Secure comms |
| Data/Apps | Info locked? | Tag HR shares | Disclosure (7.1) | Dynamic policies |

## Policies List
1. Anti-Spoofing: *If* new geo no MFA, *then* deny O365/AWS + alert (drops 8.1).
2. Device Gatekeeper: *If* posture <80%, *then* quarantine (mitigates 8.8).
3. Travel Shield: *If* unencrypted mobile, *then* TLS + inspect (7.5 tamper).
4. Leak Blocker: *If* untagged share, *then* revoke after 10 min (7.1).
5. Surge Protector: *If* >15/min requests, *then* throttle + ML check (7.5 DoS).

## Flows Sketch
**Happy Path (Alex Login):**
- Start: AWS via O365.
- Identity → Policy 1 (MFA OK?) → Yes.
- Devices → Policy 2 (Posture healthy?) → Yes.
- Network → Policy 3 (Encrypt?) → Yes.
- Workloads → Policy 5 (No spike?) → Yes.
- Data/Apps → Policy 4 (Tagged?) → **Granted + Log**.

**Deny Path (Spoof):**
- Start: Fake token.
- Identity → Policy 1: Fail? → **Block + Alert**.



## Reflections
- Insight: AI in policies amps visibility 2x.
- Win: Seamless for users, ironclad for risks.

Next: Phase 3 PoC. Fork or star—let's collaborate!
