# Paxos Consensus (Stand-alone)

Earlier formalization of the Paxos consensus protocol, not using
the refinement approach. The algorithm is specified and proved in a
single monolithic module.

## Files

- [paxos.mlw](paxos.mlw): monolithic Paxos specification and proof of
  correctness. Uses a tuple-based world representation with no
  refinement chain.

See also [paxos/](../paxos/) for the refinement-based version of the
same algorithm.

## Limitations

- Same modelling assumptions as the refinement-based development:
  quorum intersection is an axiom, ballots are unbounded, and only
  safety is proved
- The monolithic proof is harder to survey than the refinement chain,
  which is why [paxos/](../paxos/) supersedes it
