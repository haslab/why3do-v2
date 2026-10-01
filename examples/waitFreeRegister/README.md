# Wait-free Shared Register

Formalization, by specification refinement, of Simpson's algorithm.
It implements a shared register in a wait-free (and datarace-free) way,
using 4 non-atomic registers. Proof of datarace freedom.

## Files

- [slotsAbstract.mlw](slotsAbstract.mlw): abstract specification of
  data race-free access to a set of slots
- [fourSlots.mlw](fourSlots.mlw): Simpson's algorithm: uses 4 slots and
  4 control (atomic) registers to implement a single shared register
  in a wait-free way. Refines slotsAbstract

## Refinement Hierarchy

```mermaid
graph TD
    slots["slotsAbstract.mlw<br/>(abstract spec)"]
    four["fourSlots.mlw<br/>(Simpson's 4-slot algorithm)"]

    four --> slots
```

## Limitations

- Simpson's algorithm as modelled is the single-writer,
  single-reader case: two processes (Writer / Reader)
- The 4 control registers are atomic; only the 4 data slots are the
  non-atomic part
- Only data-race freedom is proved: the abstract spec tracks control
  states only, and nothing is claimed about the values read or written
