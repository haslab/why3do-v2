# Two-phase Handshake

Formalization of a hardware protocol where two processes alternately
perform actions, refined from an abstract specification.

This example is a WhyML adaptation of a [TLA+
example](https://github.com/tlaplus/Examples/blob/master/specifications/TwoPhase).

## Files

- [alternate.mlw](alternate.mlw): abstract specification
- [twoPhase.mlw](twoPhase.mlw): implementation

## Refinement Hierarchy

```mermaid
graph TD
    alternate["alternate.mlw<br/>(abstract spec)"]
    twoPhase["twoPhase.mlw<br/>(implementation)"]

    twoPhase --> alternate
```

## Limitations

- The abstract spec is parameterized by uninterpreted predicates
  (`xInit`, `xAct`): it proves the alternation structure of the
  protocol, not any property of the actions themselves
- No invariant beyond the alternation property; no liveness or
  fairness
