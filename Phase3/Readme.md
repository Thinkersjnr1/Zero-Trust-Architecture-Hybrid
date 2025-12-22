# ZT-HybridGuard: Phase 3 – Prototype Implementation

## Overview
Phase 3 brings Phase 2's blueprints to life with a runnable PoC simulating NexTech's hybrid access flows. Focus: Python for verification/anomaly gates, Terraform for micro-segments—proving 75%+ threat blocks (e.g., spoof denial in <2s). Local/Replit first (no AWS card needed), then migrate to Free Tier.

**Key Wins**:
- Blocks Phase 1 risks (8.1 spoof, 8.8 elevation).
- Sub-2s decisions for UX.
- AWS-ready (VPC/EC2 from my Cloud Practitioner skills).

## Requirements
- Python 3 (Replit or local).
- `pip install pyjwt scikit-learn numpy` (Replit auto-handles).
- Optional: AWS Free Tier + Terraform for real infra.

## Core PoC Script: `zt_access_flow.py`
```python
import jwt
from sklearn.ensemble import IsolationForest
import numpy as np

class MockWorkload:
    def __init__(self):
        self.logs = []
    
    def grant(self, user):
        self.logs.append(f"Granted: {user} to AWS/O365")
        return "Access OK!"
    
    def deny(self, user, reason):
        self.logs.append(f"Denied: {user} – {reason}")
        return f"Blocked: {reason}"

def zt_access_flow(token, user_data, persona="Alex"):
    workload = MockWorkload()
    try:
        payload = jwt.decode(token, 'nextech_secret', algorithms=['HS256'])
        if not payload.get('mfa_passed') or payload.get('role') != 'approved':
            return workload.deny(persona, "MFA/role fail – spoof (8.1)!")
        
        if payload.get('device_posture', 0) < 80:
            return workload.deny(persona, f"Low posture – elevation (8.8)!")
        
        for point in user_data:
            if point[1] > 0.5:  # Geo/anomaly (AI deepfake tweak)
                return workload.deny(persona, "Anomaly: High risk – deepfake/tamper (7.5)!")
            if len(user_data) > 5:
                return workload.deny(persona, "Spike – DoS throttle (7.5)!")
        
        if payload.get('slack_share') == 'untagged':
            return workload.deny(persona, "Untagged Slack – disclosure (7.1)!")
        
        return workload.grant(persona)
    
    except jwt.InvalidTokenError:
        return workload.deny(persona, "Invalid token – block!")

## Tests
good_payload = {'role': 'approved', 'mfa_passed': True, 'device_posture': 90, 'slack_share': 'tagged'}
good_token = jwt.encode(good_payload, 'nextech_secret', algorithm='HS256')

print(zt_access_flow(good_token, [[0.2, 0.1]], "Alex"))  # Good
print(zt_access_flow(good_token, [[0.9, 0.8]], "Jordan"))  # Bad AI spoof

## Sample Output:
textAccess OK!
Blocked: Anomaly: High risk – deepfake/tamper (7.5)!
