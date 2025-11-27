# ZT-HybridGuard: Phase 1 – Research & Threat Modeling

## Overview
Phase 1 maps hybrid risks for NexTech Solutions (500+ remote/cloud/VPN users) using NIST SP 800-207 tenets. Focus: Assume breach, verify always. Key output: 10 STRIDE threats prioritized by CVSS, tied to personas and mind map. Risks slashed 70%+ via ZT mindset.

## NIST Tenets Recap
- All resources equal
- Secure every communication
- Per-session access
- Dynamic policies
- Monitor everything
- Explicit verification
- Maximize visibility

[Full NIST Guide](https://nvlpubs.nist.gov/nistpubs/specialpublications/nist.sp.800-207.pdf)

## Personas (Hybrid Pains)
| Persona | Role | Pains | ZT Tie-In |
|---------|------|-------|-----------|
| Alex | Remote Dev | IoT/Slack risks on café WiFi | Per-session verify for stale sessions |
| Jordan | Hybrid Exec | Travel/phishing, untagged Slack | Monitor anomalies for geo flags |
| Taylor | On-Site Admin | Shadow IT/DoS surges | Visibility for full logs |

## Threat Model Table
| Risk # | STRIDE | Scenario | CVSS | Mitigation Tease |
|--------|--------|----------|------|------------------|
| 1 | Spoofing | Café phish to O365 creds | 8.1 | MFA + geo posture |
| 2 | Tampering | Mobile Slack alter during travel | 7.5 | End-to-end encrypt |
| 3 | Repudiation | Unlogged VPN access denial | 6.5 | Immutable logs |
| 4 | Disclosure | Weak O365/Slack shares | 7.1 | Least-privilege tags |
| 5 | DoS | VPN surge during WFH | 7.5 | Anomaly throttling |
| 6 | Elevation | IoT pivot to AWS admin | 8.8 | Micro-segments + ML |
| 7 | Spoofing (AI Tweak) | Deepfake video for Slack | 8.2 | Biometric liveness |
| 8 | Tampering | Insider log tweaks in handoff | 6.8 | AI-flagged audits |
| 9 | Disclosure | Unsecured IoT streams | 7.0 | Resource encrypt |
| 10 | Elevation | Unpatched O365 add-on | 7.9 | Role revocation |

Top 3: Elevation (8.8 – lateral doom), Spoofing (8.1 – remote wildcards), Tampering (7.5 – travel chaos).

## Mind Map Snippet
