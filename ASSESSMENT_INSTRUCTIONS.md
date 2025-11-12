# Full-Stack Developer Assessment
## Code Review & Enhancement Exercise

**Candidate Name:** _________________________  
**Time Allocation:** 2-3 hours total
- Part A: 45 minutes
- Part B: 1.5-2 hours

---

## Important Guidelines

- This assessment evaluates **practical skills**, not perfection
- Focus on demonstrating your **problem-solving approach** and **code quality awareness**
- **Time management** is important - don't get stuck on one issue
- **Document your assumptions** if anything is unclear
- **Working code** is better than perfect code

---

## Part A: Code Review (45 minutes)

### Objective
Review the provided codebase and identify issues in both backend and frontend code.

### What to Look For

**Backend Issues:**
- Security vulnerabilities (SQL injection, authentication, etc.)
- Performance problems (N+1 queries, missing indexes, etc.)
- Poor error handling
- Missing validation
- Transaction management issues
- Code quality and maintainability

**Frontend Issues:**
- React anti-patterns
- Performance issues (unnecessary re-renders, etc.)
- Missing error handling
- Poor state management
- Accessibility issues
- User experience problems

### Deliverable

Document your findings in **CODE_REVIEW.md**

For each issue, provide:
1. **Location:** File and line number
2. **Issue Description:** What's wrong?
3. **Impact:** Why does it matter? (security, performance, UX, etc.)
4. **Suggested Fix:** How would you improve it?

**Target:** Identify and document **5-7 significant issues**

---

## Part B: Implementation (1.5-2 hours)

### Task 1: Fix Critical Issues (30-45 minutes)

Select **2-3 of the most critical issues** from Part A and implement fixes.

### Task 2: Implement New Feature (1-1.5 hours)

**Feature: Bulk Order Status Update**

#### Business Requirement
Users need to update the status of multiple orders simultaneously.

#### Backend Requirements

**Create endpoint:** `PUT /api/orders/bulk-status`

**Request Body:**
```json
{
  "orderIds": [1, 2, 3, 4, 5],
  "newStatus": "SHIPPED"
}
```

**Response Format:**
```json
{
  "successful": [1, 2, 4],
  "failed": [
    {
      "orderId": 3,
      "reason": "Order is already cancelled"
    }
  ]
}
```

#### Frontend Requirements

- Add checkbox to each order row for bulk selection
- Add "Bulk Update Status" button with dropdown
- Implement optimistic UI updates
- Show loading states and error messages

---

## Submission Instructions

```bash
# Create your branch
git checkout -b assessment/[your-name]

# Commit your changes
git add .
git commit -m "Complete assessment"

# Push your branch
git push origin assessment/[your-name]
```

**Deadline:** [INSERT DEADLINE]

**Good luck!**
