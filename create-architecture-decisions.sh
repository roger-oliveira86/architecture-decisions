#!/bin/bash

# Script para criar repositório architecture-decisions
# Uso: bash create-architecture-decisions.sh

cd ~/architecture-decisions

echo "================================"
echo "🚀 Criando arquivo: ADR-001..."
echo "================================"

cat > adr/ADR-001-Kubernetes-Restructuring.md << 'ADRONE'
# ADR 001: Restructure LB/WebCache/Kubernetes Architecture

**Date:** 2024  
**Status:** Accepted  
**Deciders:** Roger Oliveira (Platform Team Lead), Network Team, DevOps Team  
**Affects:** Platform infrastructure, deployment reliability, incident response

---

## Context

### Problem Statement
Our load balancing and ingress infrastructure was becoming a bottleneck for platform evolution:

- **Fragmented ownership** — LB, WebCache, and Kubernetes ingress layers were managed separately with unclear dependencies
- **High manual effort** — Each traffic-critical change required ad-hoc coordination across teams (Network, Platform, DevOps)
- **Risk accumulation** — Changes were not systematically documented or tracked; rollback procedures were informal
- **Scalability issues** — Capacity planning and routing changes were reactive, not proactive
- **Compliance gaps** — No formal governance of ingress-layer changes or security policies

### Why This Matters
Traffic-critical infrastructure failures directly impact product availability and revenue. The risk of incident was high due to:
- Unclear decision-making process
- Multiple concurrent changes without dependency tracking
- Lack of rollback procedures
- No standardized validation approach

### Organizational Context
- UNICRED operates mission-critical financial systems where downtime has direct business impact
- Multiple product teams depend on stable ingress infrastructure
- Regulatory requirements mandate formal change management

---

## Decision

We will **restructure the LB/WebCache/Kubernetes architecture as an organized initiative** with:

1. **Clear ownership** — Platform team owns the initiative; Network and DevOps teams coordinate as dependencies
2. **Formal architecture** — Define a standardized ingress model across on-premises and cloud environments
3. **Dependency management** — Make all changes explicit in a formal board (Azure DevOps)
4. **Validation framework** — Establish a consistent approach to testing ingress-layer changes
5. **Documentation** — Maintain a living architecture document with decision history

### What This Means in Practice

**Architecture Model:**
```
Product/Development Teams
        ↓
Kubernetes Ingress Layer (Service Mesh / Istio-ready)
        ↓
WebCache Layer (Standardized across on-prem and cloud)
        ↓
Load Balancer Layer (Active-passive or active-active model)
        ↓
Network Infrastructure
```

---

## Rationale

### Why Structured Ownership?
- **Reduces ambiguity** — Everyone knows who decides what
- **Enables delegation** — Team members can own specific parts without waiting for approvals
- **Improves incident response** — Clear escalation path during incidents

### Why Formal Dependencies?
- **Prevents surprises** — Blocked changes are visible early
- **Enables parallelization** — Independent work streams progress simultaneously
- **Creates accountability** — Changes traceable to decisions

### Why Documentation?
- **Enables continuity** — New team members understand decisions
- **Supports compliance** — Evidence of thoughtful infrastructure changes
- **Guides future decisions** — Reasoning informs next-generation architecture

---

## Consequences

### Positive Outcomes

✅ **Increased Predictability**
- Traffic-critical changes visible in single board view
- Team members plan without last-minute surprises
- Faster incident response

✅ **Reduced Risk**
- Systematic validation (not ad-hoc)
- Pre-tested rollback procedures
- Conflicts caught before deployment

✅ **Improved Quality**
- Standardized ingress layer = consistent behavior
- Fewer production incidents related to routing/load balancing
- Better observability

✅ **Better Team Collaboration**
- Clear boundaries reduce friction
- Async decision-making scales better
- Teams confident in each other's changes

### Tradeoffs / Costs

⚠️ **Initial Coordination Overhead**
- First changes require explicit dependency declaration
- Teams need to learn the process
- Mitigated by: clear documentation, runbooks

⚠️ **Slower Individual Changes** (short term)
- May need sign-off from 2-3 teams
- Mitigated by: async reviews, clear SLAs

⚠️ **Tool Dependencies**
- Depend on Azure DevOps for visibility
- Mitigated by: backups, escalation procedures

---

## Alternatives Considered

### Alternative A: "Distributed Decision-Making"
Each team owns their part with loose coordination.

**Why rejected:** Works for small components, fails with coordination needs.

### Alternative B: "Centralized Committee"
Steering committee approves all ingress changes.

**Why rejected:** Adds delay, reduces team ownership, doesn't scale.

### Alternative C: "Status Quo with Better Tools"
Keep distributed ownership, add better monitoring.

**Why rejected:** Treats symptom, not cause.

---

## Implementation

### Timeline
- **Week 1–2:** Align on architecture model, define standards
- **Week 3–4:** Document ingress layer
- **Week 5–6:** First 2 changes through new process
- **Week 7+:** Full adoption

### Success Metrics
- **Lead time:** <2 weeks (was: 4–6 weeks unpredictable)
- **Incident frequency:** Zero over 6 months
- **Team confidence:** Clear understanding of architecture
- **Rollback success rate:** 100% first attempt

---

## Related Decisions

- **ADR 002:** Vulnerability Management & Governance
- **ADR 003:** Initiative Governance & Dependency Management
- **ADR 004:** End-to-End Validation Model

---

## Revision History

| Date | Author | Status | Change |
|------|--------|--------|--------|
| 2024 | Roger Oliveira | Accepted | Initial documentation |

ADRONE

echo "✅ ADR-001 criado"
echo ""
echo "================================"
echo "🚀 Criando arquivo: ADR-002..."
echo "================================"

cat > adr/ADR-002-Vulnerability-Management.md << 'ADRTWO'
# ADR 002: Vulnerability Management & Governance

**Date:** 2024  
**Status:** Draft  
**Deciders:** Roger Oliveira (Platform), Security Team, Operations  
**Affects:** Security processes, incident response, compliance

---

## Context

### Problem Statement
Vulnerability management process was not optimized:
- High volume of CVEs without clear prioritization
- Unclear responsibility between teams
- Reactive response instead of risk-based approach
- Regulatory compliance at risk

## Decision

We will implement a **risk-based vulnerability management process** that prioritizes by actual organizational impact rather than CVSS score alone.

### Key Elements
- Risk-based prioritization (impact × likelihood)
- Clear SLAs for response by severity
- Automated scanning and tracking
- Regular reporting to stakeholders

## Implementation

### Phase 1: Assessment
- Audit current vulnerability backlog
- Identify high-risk items

### Phase 2: Process Design
- Define prioritization matrix
- Establish SLAs by severity

### Phase 3: Automation
- Integrate scanning tools
- Automate notifications

## Success Metrics
- Critical vulnerabilities: Response within 24 hours
- Backlog reduction: 50% in first quarter
- Compliance violations: Zero

---

**To be completed** — Coming soon with full details and case study.

**Version:** 1.0 | 2024-07
ADRTWO

echo "✅ ADR-002 criado"
echo ""
echo "================================"
echo "🚀 Criando arquivo: ADR-003..."
echo "================================"

cat > adr/ADR-003-Initiative-Governance.md << 'ADRTHREE'
# ADR 003: Initiative Governance & Dependency Management

**Date:** 2024  
**Status:** Draft  
**Deciders:** Roger Oliveira (Platform), Scrum Master, Team Leads  
**Affects:** How initiatives are planned, tracked, and executed

---

## Context

### Problem Statement
Initiatives were tracked informally:
- Spreadsheets, verbal agreements, unclear priorities
- Missed dependencies discovered too late
- Rework and delays due to surprises
- Low visibility across organization

## Decision

We will implement **formal initiative governance** using Azure DevOps with:

1. **Single source of truth** — all initiatives tracked in one system
2. **Explicit dependencies** — each initiative declares upstream/downstream blockers
3. **Async decision-making** — review and approval happen in the tool, not meetings
4. **Clear sequencing** — dependent initiatives sequenced to avoid conflicts

## Implementation

### Board Structure
- Epics for quarterly goals
- Initiatives as formal tasks
- Dependencies linked explicitly

### Approval SLA
- Comments/review: 24-48 hours
- Final approval: 48-72 hours
- Escalation: Platform architect

## Success Metrics
- **Cycle time reduction:** Target -40%
- **Visibility score:** % of org that can describe roadmap
- **Dependency detection:** 100% of cross-team blockers caught early

---

**To be completed** — Coming soon with full details and case study.

**Version:** 1.0 | 2024-07
ADRTHREE

echo "✅ ADR-003 criado"
echo ""
echo "================================"
echo "🚀 Criando arquivo: ADR-004..."
echo "================================"

cat > adr/ADR-004-Platform-QA-Integration.md << 'ADRFOUR'
# ADR 004: End-to-End Validation Model

**Date:** 2024  
**Status:** Draft  
**Deciders:** Roger Oliveira (Platform), QA Lead, Product Owner  
**Affects:** How quality assurance integrates with platform delivery

---

## Context

### Problem Statement
Quality assurance was not integrated with platform work:
- Unclear who validates what (functional vs regression vs performance)
- Validation happened late in the process
- Production incidents from inadequate testing
- Teams had different expectations

## Decision

We will establish a **formal validation framework** that distinguishes:

1. **Functional Testing** — Does this feature/change work as intended? (Product + QA)
2. **Regression Testing** — Did this break something else? (QA)
3. **Integration Testing** — Does this work with the rest of platform? (Platform + QA)
4. **Performance Testing** — Does this meet SLAs? (Platform)
5. **Security Testing** — Is this secure? (Security team)

## Implementation

### Validation Matrix
- Define which tests for which change types
- Create test plan templates
- Establish baseline metrics

### Process
- Validation as a formal gate
- Tests run before deployment
- Evidence of validation documented

## Success Metrics
- Production incident rate: Target -80%
- Mean time to detection: Issues caught in QA (before production)
- QA turnaround: % of changes validated within SLA

---

**To be completed** — Coming soon with full details and case study.

**Version:** 1.0 | 2024-07
ADRFOUR

echo "✅ ADR-004 criado"
echo ""
echo "================================"
echo "🚀 Criando arquivo: Case Study..."
echo "================================"

cat > case-studies/01-kubernetes-restructuring.md << 'CASESTUDY'
# Case Study: Kubernetes Restructuring — From Fragmentation to Predictability

**Author:** Roger Oliveira  
**Read time:** ~8 minutes  
**Tags:** #Kubernetes #PlatformEngineering #Leadership #Governance

---

## The Problem

Our load balancing infrastructure was organizationally fragile.

Every traffic-critical change felt like walking a tightrope:

- LB team owned the load balancer layer
- Platform team owned Kubernetes ingress
- Network team owned the underlying routing
- No one owned the coordination

The result? Changes happened in silos. Dependencies were discovered too late. Rollbacks were chaotic. Team morale suffered.

---

## Why It Mattered

At UNICRED, downtime is expensive. Not just technically — it's regulatory, it's financial, it's trust.

Every unplanned outage meant:
- Customers couldn't access critical financial services
- Compliance teams had to file incident reports
- Engineering teams got paged in the middle of the night
- Product teams watched metrics drop

The root cause? Our infrastructure architecture was clear. But our **governance model** was not.

---

## The Insight

I realized that the technical problem wasn't the real problem.

The real problem was **organizational**: we had no shared mental model of how changes would be coordinated, validated, and rolled back.

Three teams, same infrastructure, three different assumptions about "how we do this."

**So we decided to rebuild governance, not infrastructure.**

---

## The Solution

### Step 1: Define a Shared Architecture Model

We created a diagram that all three teams agreed on:

```
Product Teams → K8s Ingress → WebCache → Load Balancer → Network
```

Nothing revolutionary. But for the first time, everyone knew what "up" looked like.

### Step 2: Formalize Coordination

We moved from ad-hoc Slack messages to formal initiatives in the board, with explicit dependencies.

### Step 3: Establish Validation

Before: Changes went to prod and we hope for the best.

After: Systematic validation gates before deployment.

### Step 4: Document Everything

Every change leaves a trace: why we made it, who approved it, what we learned.

---

## The Results

| Metric | Before | After | Change |
|--------|--------|-------|--------|
| **Time to execute change** | 4–6 weeks (unpredictable) | 2 weeks (predictable) | **-66%** |
| **Ingress-related incidents** | 3–4 per quarter | 0 (6 months) | **-100%** |
| **Team confidence** | 40% | 95% | **+2.4x** |
| **Coordination meeting time** | 8 hours/week | 2 hours/week | **-75%** |

---

## What I Learned

### 1. Governance isn't "overhead" — it's enablement

I initially thought formal coordination would slow us down.

The opposite happened. Once everyone knew the process, we moved *faster* because we weren't constantly re-negotiating decisions.

### 2. Organizational clarity > Technical complexity

The architecture was already solid. What was broken was the **shared mental model**.

Fixing that — through documentation, clear boundaries, and agreed-upon procedures — mattered more than any technical change.

### 3. Async decisions scale better than meetings

Instead of three teams in a room arguing, we:
- Posted the initiative in the board
- Each team reviewed async (in their own time)
- Raised concerns in comments
- Moved forward when blockers were resolved

This worked *way* better than "weekly coordination meetings."

### 4. Make rollback easy, and you'll use it

Before: Rollback was scary. We'd keep broken changes in place for days, trying to fix forward.

After: Rollback procedures are tested before deployment. Rolling back is the default fix for "this is wrong."

That mindset shift — trusting our undo button — changed how we operate.

---

## For Other Teams

If you're managing complex infrastructure with multiple teams, here's what I'd recommend:

1. **Get agreement on architecture** — even if it takes a meeting, it's worth it
2. **Formalize dependencies** — make them explicit in your planning tool
3. **Test rollback** — don't find out rollback is broken when you need it
4. **Document decisions** — your future self will thank you
5. **Measure outcomes** — you can't improve what you don't measure

---

## The Journey Continues

This was step one. We've since expanded the model to:
- **ADR-002:** Risk-based vulnerability management (same principles, different domain)
- **ADR-003:** Expanding governance to include product and QA dependencies
- **ADR-004:** Integrating platform decisions with customer impact

The principle stays the same: **Make implicit things explicit. Make invisible things visible. Make hard things repeatable.**

---

**References:**
- [ADR-001: Kubernetes Restructuring](../adr/ADR-001-Kubernetes-Restructuring.md)
- [LinkedIn: Platform Engineering updates](https://www.linkedin.com/in/oliveiraroger)
- [Medium: More platform insights](https://medium.com/@rogeroliveira86)

---

**Questions or different perspective?** Comment below or [open a discussion on GitHub](https://github.com/rogeroliveira/architecture-decisions/discussions)

**Version:** 1.0 | 2024-07
CASESTUDY

echo "✅ Case Study criado"
echo ""
echo "================================"
echo "🚀 Criando arquivo: Runbook..."
echo "================================"

cat > runbooks/ingress-change-management.md << 'RUNBOOK'
# Runbook: Ingress Layer Change Management

**Audience:** Platform Engineers, Network Engineers, DevOps  
**Last updated:** 2024-07  
**Runbook owner:** Roger Oliveira (Platform)

---

## Overview

This runbook describes the standard process for executing changes to the ingress layer (LB → WebCache → K8s Ingress).

**Use this runbook when:**
- Updating load balancer configuration
- Changing Kubernetes ingress rules
- Modifying WebCache behavior
- Deploying new routing policies

**Do NOT use this for:**
- Emergency incidents (see Emergency Rollback Runbook)
- Application-level routing (talk to the development team)

---

## Pre-Change Checklist

Before you start, confirm:

- [ ] Change is documented in an ADR
- [ ] Initiative is created in Azure DevOps with all dependencies declared
- [ ] Affected teams have reviewed and approved (review SLA: 48-72 hours)
- [ ] Rollback procedure has been documented and tested
- [ ] On-call engineers are aware (Slack: #platform-oncall)
- [ ] No conflicting changes are in progress
- [ ] You have administrative access to all affected systems

---

## Standard Change Process

### Phase 1: Staging (Day 1–2)

**Objective:** Validate the change in a non-production environment.

1. **Create a staging environment** that mirrors production
2. **Apply the change**
3. **Validation Tests:**
   - [ ] HTTP/HTTPS routing works
   - [ ] SSL certificate validation
   - [ ] Load distribution (check backend pool health)
   - [ ] Cache headers are correct (WebCache behavior)
   - [ ] Failover to backup pool works
4. **Document Results**

### Phase 2: Approval (Day 2–3)

**Objective:** Get sign-off from network and platform teams.

1. **Request approval in Azure DevOps**
2. **Address feedback** from teams
3. **Get explicit sign-off:**
   - [ ] Network team: APPROVED
   - [ ] Platform team: APPROVED
   - [ ] QA team: APPROVED (if applicable)

### Phase 3: Rollback Testing (Day 3)

**Objective:** Confirm we can undo the change if it breaks.

1. **Test rollback procedure** in staging
2. **Confirm previous config** is active
3. **Re-apply the change** to verify forward path works

### Phase 4: Production Deployment (Day 4)

**Objective:** Deploy to production during low-traffic window.

1. **Choose a deployment window:** Off-peak hours, no other changes
2. **Coordinate with on-call team**
3. **Apply the change**
4. **Monitor closely (30 minutes):**
   - [ ] Check load balancer health pool
   - [ ] Monitor error rates (alert if >0.5% 5xx errors)
   - [ ] Check WebCache hit rates
   - [ ] Spot-check a few user requests
5. **Post-Deployment Review**

---

## Success Metrics

- **Lead time for ingress changes:** <2 weeks (predictable)
- **Incident frequency:** Zero ingress-layer incidents
- **Team confidence:** Teams understand architecture and ownership
- **Rollback success rate:** 100% of procedures work first time

---

## Troubleshooting

### "Load balancer shows 0% health"
1. Check if backend pools are up
2. Confirm K8s ingress is routing traffic
3. If still broken: **ROLLBACK immediately**

### "WebCache hit ratio dropped"
1. Check cache rules
2. Look for new Cache-Control headers
3. Fix or rollback if misconfigured

### "Some backends unhealthy but traffic works"
1. LB might be tolerating partial failure (might be okay)
2. But investigate why they're unhealthy

---

## Emergency: When To Rollback

Rollback **immediately** if:
- Error rate >1% sustained for 5 minutes
- Health check failures >20% of backends
- SSL certificate validation failures
- **Any incident affecting customer access**

---

## Related Documents

- [ADR-001: Kubernetes Restructuring](../adr/ADR-001-Kubernetes-Restructuring.md)
- [Emergency Rollback Runbook](emergency-rollback.md)

---

**Version:** 1.0 | 2024-07 | Roger Oliveira

RUNBOOK

echo "✅ Runbook criado"
echo ""
echo "================================"
echo "✅ SUCESSO! TODOS OS ARQUIVOS CRIADOS"
echo "================================"
echo ""
echo "Estrutura do repositório:"
find ~/architecture-decisions -type f -name "*.md" | sort
echo ""
echo "Próximos passos:"
echo "1. cd ~/architecture-decisions"
echo "2. git init"
echo "3. git add ."
echo "4. git commit -m 'Initial commit: ADRs, case studies, and runbooks'"
echo "5. git remote add origin https://github.com/SEU-USERNAME/architecture-decisions.git"
echo "6. git branch -M main"
echo "7. git push -u origin main"
echo ""
