# How to enumerate next tasks (plan-next)

Purpose: Identify high-signal "next tasks" in a repo to reduce risk and move forward.

Baseline steps:
- Confirm goals: clarify priorities across scope, quality, and deadlines.
- Check current failures: tests/build/typecheck/lint.
- List risks: start with high-impact or fragile areas.
- Resolve dependencies: identify prerequisite work (types/tests/config).
- Add a quick win: at least one task under 15 minutes.

Concrete sources:
- Failing checks: test / lint / typecheck / build.
- Spec/README gaps: behavior that does not match docs.
- TODO/FIXME: temporary code paths or missing edge cases.
- Untested areas: changed logic without tests.
- Broken wiring: API calls, routes, or flows that stop mid-way.

Output format guidelines:
- Propose exactly 5 tasks, ordered by priority.
- Each task includes: Title, Why now, Scope, Done criteria, one runnable command.
