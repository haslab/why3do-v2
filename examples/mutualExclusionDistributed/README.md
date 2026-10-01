# Mutual Exclusion (Distributed)

Formalization, by specification refinement, of distributed mutual
exclusion algorithms using message passing.

## Files

- [MutexSpec.mlw](MutexSpec.mlw): abstract specification of mutual
  exclusion (critical section occupancy invariant)
- [tokenMutex.mlw](tokenMutex.mlw): intermediate specification based on
  a unique token. Refines MutexSpec
- [Lamport.mlw](Lamport.mlw): Lamport's distributed mutex algorithm
  using logical clocks and request queues. Refines MutexSpec
  *(Original model by: Joao Duarte, Luis Silva. Adapted to the why3do
  refinement framework, with corrections to the clock update and reply
  guard.)*
- [RicartAgrawala.mlw](RicartAgrawala.mlw): Ricart-Agrawala distributed
  mutex algorithm. Refines MutexSpec
  *(Original model by: Claudia Pinto, Patricia Carvalho. Adapted to the
  why3do refinement framework.)*
- [RicartAgrawalaNet.mlw](RicartAgrawalaNet.mlw): Ricart-Agrawala with
  replies in flight: grant_Reply is split into send_Reply and
  deliver_Reply. Refines RicartAgrawala, turning its collapsed-
  send-and-receive limitation (and the stale-request assumption it
  carries) into proved properties
- [suzukiKasami.mlw](suzukiKasami.mlw): Suzuki-Kasami distributed mutex
  algorithm using a token with a queue. Refines TokenMutex

## Refinement Hierarchy

```mermaid
graph TD
    spec["MutexSpec.mlw<br/>(abstract spec)"]
    token["tokenMutex.mlw<br/>(token-based spec)"]
    lamport["Lamport.mlw<br/>(Lamport's algorithm)"]
    ricart["RicartAgrawala.mlw<br/>(Ricart-Agrawala)"]
    ricartnet["RicartAgrawalaNet.mlw<br/>(replies in flight)"]
    suzuki["suzukiKasami.mlw<br/>(Suzuki-Kasami)"]

    token --> spec
    lamport --> spec
    ricart --> spec
    ricartnet --> ricart
    suzuki --> token
```
