# why3dofind

A WhyML library for reasoning about state machine specifications and
distributed systems, using [why3find](https://why3find.readthedocs.io/)
for proof management.

## Structure

| Folder | Description |
|---|---|
| [stateMachineModels/](stateMachineModels) | Base library (inductive invariants, refinement) |
| [examples/counter/](examples/counter) | Concurrent counter using a lock, by refinement |
| [examples/twoPhase/](examples/twoPhase) | Two-phase handshake protocol, by refinement |
| [examples/mutualExclusionConcurrent/](examples/mutualExclusionConcurrent) | Concurrent mutual exclusion (Peterson, Bakery, filter) |
| [examples/mutualExclusionDistributed/](examples/mutualExclusionDistributed) | Distributed mutual exclusion (Lamport, Ricart-Agrawala, Suzuki-Kasami) |
| [examples/mutualExclusionNeighbors/](examples/mutualExclusionNeighbors) | Dijkstra self-stabilizing ring and bidirectional array (neighbor communication), delivering mutual exclusion via tokenMutex |
| [examples/leaderElection/](examples/leaderElection) | Chang-Roberts and Bully leader election, by refinement |
| [examples/dynamicBully/](examples/dynamicBully) | Dynamic Bully leader election with crash/recovery |
| [examples/waitFreeRegister/](examples/waitFreeRegister) | Simpson's 4-slot wait-free register, by refinement |
| [examples/paxosNoRefinement/](examples/paxosNoRefinement) | Paxos consensus (stand-alone, no refinement) |
| [examples/paxos/](examples/paxos) | Paxos consensus, two-step refinement |
| [examples/raft/](examples/raft) | Raft leader election, three-step refinement chain |
| [examples/controlledFlooding/](examples/controlledFlooding) | Controlled flooding broadcast |
| [examples/spanningTree/](examples/spanningTree) | DIM self-stabilizing spanning tree (stable phase, closure property) |

Cross-file dependencies in why3find are resolved through installed
packages, not folder loadpaths. Every `.mlw` file is registered as a
why3find package by `setup.sh`, so cross-file `use` and `clone`
references resolve through the installed packages. See `why3find.json`
for the full package list.

## Setup

Requires [Why3](https://why3.lris.fr/) 1.8+,
[why3find](https://why3find.readthedocs.io/) 1.3+, and at least one SMT
prover (CVC5, Alt-Ergo, Z3). See `why3find.json` for the exact prover
versions and tactics used.

```sh
eval $(opam env)
./setup.sh          # install packages from repo sources (run once)
why3find prove -r . # replay all proofs
```

## Commands

```sh
why3find prove .              # update proof certificates
why3find prove -r .           # replay proofs (no changes)
why3find prove -f .           # force rebuild all proofs
why3find prove -i file.mlw    # launch Why3 IDE on failed goals
why3find prove --goals .      # per-goal breakdown
```

## How proofs are stored

Each `.mlw` file has a matching `proof.json` certificate in a
subdirectory of the same name (e.g. `counter.mlw` -> `counter/proof.json`).
These are JSON files recording which prover (or tactic + prover
combination) closes each goal. The `.why3find/` cache directory is
gitignored.
