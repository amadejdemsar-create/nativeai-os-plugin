---
name: team-expenses
description: Shared team expenses and repayments across NativeAI and Dropshipping (Splitwise style). Use when someone records a cost they paid for the team ("I paid €120 for dropshipping ads, split it equally among the four of us"), asks what they owe or are owed ("what do I owe, per business and across both?"), records a repayment ("I repaid Maks €30"), or corrects or voids an expense or repayment. Team reimbursement only, not accounting or bank transfers.
---

# Team expenses and repayments

The tools come from NativeAI OS or Dropshipping OS (the same names in both): `workspaces`, `expenses`, `expense_get`, `expense_create`, `expense_update`, `expense_void`, `balances`, `settlements`, `settlement_record`, `settlement_void`. They act as the signed-in person; every change is recorded as "<person> via <your tool>". Nothing here moves money: a repayment is a record of a payment that already happened.

## Rules that never bend

1. **Never guess money facts.** Before `expense_create` you need, stated or unambiguous from the conversation: the business, who paid (whose own money), the amount, the currency, who shares it, and how (equal, percent, exact amounts, or shares). Ask for whatever is missing, all in one short question. "The four of us" is resolved only if that business has exactly four active members and the person is one of them; otherwise ask who.
2. **Currency is the person's, not yours.** "€" is EUR, "$" is USD. With no symbol and no context, ask. Never convert, never add EUR and USD together; report each currency separately.
3. **Amounts are minor units.** €120 is `12000`, €30.50 is `3050`.
4. **People are ids, resolved per business** with `workspaces` (members of THAT business). If a name matches no one or more than one, ask. The same person in the other business is the one whose `linkedId` points to them; never match by name.
5. **Retries never duplicate.** Every write gets a fresh `idempotencyKey`; on a timeout or network error, retry with the same key. After any other error, read back (`expenses`, `settlements`) before trying again.
6. **Suggestions are not payments.** `balances` returns suggested repayments; nothing is settled until the person says a payment happened and you record it.
7. **You record only your own costs.** A person records an expense they paid or share in (an admin may record any). If they ask to record a cost between two other people, explain that one of those two records it.
8. **Say back the money write in one line before you make it** when you resolved anything yourself (a person, the business, "the four of us"): "Record: Dropshipping, €120.00 ads paid by you, split equally Amadej, Maks, Žan, Pero (€30.00 each)?" When every fact was stated explicitly, record it and then report it.

## Common requests

- **"I paid €120 for dropshipping ads; split it equally among these four members"**: business `dropshipping`, payer `me`, amount 12000, EUR, category `ads`, split `{ mode: "equal", participants: [the four ids] }`, today's date unless given. After saving, report each share from the returned allocations (they always add up to the total; mention who carries a rounding cent if any).
- **"What do I owe, per business and across both?"**: `balances` with `scope: "both"`. Answer per business and per currency: what you owe whom, what others owe you, your net. Then the across-both lines per person. If one person is owed in one business and owes in the other, show both amounts and say: "Netting one business against the other is off until the owners decide it." If a business did not answer, say so; never show it as zero.
- **"I repaid Maks €30; record that settlement"**: `balances` (scope both) to see where you owe Maks in EUR. If you owe him in exactly one business and €30 is not more than that, record it there (`settlement_record`, from `me`, to Maks's id in that business). If you owe him in both, ask which business, or offer to record it as two repayments (one per business, each within what is open there, the same `groupRef`). If €30 is more than what is open, say how much is open and ask. If nothing is open, say so and record nothing.
- **Correcting an expense**: `expense_update`. Text, category, project, notes and receipt change in place. A different amount, date, currency, payer or split voids the old expense and saves a corrected one; ask for a short reason and pass it.
- **Voiding**: `expense_void` or `settlement_void` with the person's reason. The record stays in history and leaves the balances.

Answer in the person's language (Slovenian amounts as 1.234,56 EUR, English as €1,234.56). Name expenses by description, never by id.
