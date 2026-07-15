# Runbook: Ingress Layer Change Management

**Owner:** Roger Oliveira | **Last updated:** 2024-07

## Overview
Standard process for executing changes to ingress layer.

## Pre-Change Checklist
- [ ] Change documented in ADR
- [ ] Initiative in Azure DevOps
- [ ] All teams reviewed
- [ ] Rollback tested
- [ ] On-call aware

## Process
1. **Staging** - Create, apply, validate, document (Day 1-2)
2. **Approval** - Request, address feedback, get sign-off (Day 2-3)
3. **Rollback Test** - Test undo, confirm forward (Day 3)
4. **Production** - Off-peak deploy, monitor 30min (Day 4)

## Emergency
Rollback immediately if: Error >1%, >20% backend failures, customer impact

**Version:** 1.0 | 2024-07
