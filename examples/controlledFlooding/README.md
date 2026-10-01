# Controlled Flooding Broadcast

Formalization of a controlled flooding protocol for reliable broadcast
in a network. Proves that every informed node holds the source message,
that the informed set never shrinks and is bounded by the number of
nodes, that flooding terminates after at most that many steps, and --
conditionally on quiescence and reachability -- that every node with a
path from the source is informed.

## Files

- [controlledFlooding.mlw](controlledFlooding.mlw): standalone
  specification of the controlled flooding algorithm with safety and
  termination proofs

## Limitations

- Passing the message is one atomic step: no channel, no message in
  flight, no loss, duplication, reordering or delay; nodes do not fail
- Only one flood is modelled -- no sequence numbers or hop counts, so
  a second, different message is out of scope
- The edge relation is not assumed symmetric, so coverage means
  reachability from the source, not mutual reachability
- Completeness is conditional on quiescence; termination shows flooding
  cannot run forever, but does not construct a run reaching quiescence
- No fairness or timing, and no liveness property is stated

*(Contribution by: Goncalo Caixeiro. Adapted to the why3do refinement
framework.)*
