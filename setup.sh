#!/bin/sh
# Install why3find packages from the repo's own sources.
# Run this once after cloning, before `why3find prove`.

set -e

PKGROOT=$(why3find where)

install_pkg() {
  name="$1"
  src="$2"
  echo "installing $name <- $src"
  mkdir -p "$PKGROOT/$name"
  cp "$src" "$PKGROOT/$name/$(basename "$src")"
  echo '{}' > "$PKGROOT/$name/META.json"
}

# base library
install_pkg inductiveness.mlw stateMachineModels/inductiveness.mlw
install_pkg refinement.mlw    stateMachineModels/refinement.mlw

# counter
install_pkg counter     examples/counter/counter.mlw
install_pkg counter_alt examples/counter/counter_alt.mlw

# twoPhase
install_pkg alternate   examples/twoPhase/alternate.mlw

# mutualExclusionConcurrent
install_pkg mutexAbstractN examples/mutualExclusionConcurrent/mutexAbstractN.mlw
install_pkg mutexAbstract  examples/mutualExclusionConcurrent/mutexAbstract.mlw
install_pkg Peterson       examples/mutualExclusionConcurrent/Peterson.mlw
install_pkg PetersonFilter  examples/mutualExclusionConcurrent/PetersonFilter.mlw

# mutualExclusionDistributed (student contributions)
install_pkg MutexSpec      examples/mutualExclusionDistributed/MutexSpec.mlw
install_pkg Lamport        examples/mutualExclusionDistributed/Lamport.mlw
install_pkg LamportNet     examples/mutualExclusionDistributed/LamportNet.mlw
install_pkg RicartAgrawala examples/mutualExclusionDistributed/RicartAgrawala.mlw
install_pkg RicartAgrawalaNet examples/mutualExclusionDistributed/RicartAgrawalaNet.mlw
install_pkg tokenMutex     examples/mutualExclusionDistributed/tokenMutex.mlw
install_pkg suzukiKasami   examples/mutualExclusionDistributed/suzukiKasami.mlw

# mutualExclusionNeighbors
install_pkg oneToken        examples/mutualExclusionNeighbors/oneToken.mlw

# leaderElection
install_pkg leaderElect     examples/leaderElection/leaderElect.mlw
install_pkg leaderElectMax  examples/leaderElection/leaderElectMax.mlw

# waitFreeRegister
install_pkg slotsAbstract   examples/waitFreeRegister/slotsAbstract.mlw

# paxos
install_pkg consensus       examples/paxos/consensus.mlw
install_pkg voting          examples/paxos/voting.mlw

# leaderElection (student contribution: João Gonçalves, Carlos Pina)
install_pkg leaderElectMaxAlive              examples/leaderElection/leaderElectMaxAlive.mlw
install_pkg bully                            examples/leaderElection/Bully.mlw
install_pkg leaderElectDynamicFull           examples/dynamicBully/leaderElectDynamicFull.mlw
install_pkg leaderElectMaxAliveDynamicFull   examples/dynamicBully/leaderElectMaxAliveDynamicFull.mlw
install_pkg bullyDynamicFull                 examples/dynamicBully/bullyDynamicFull.mlw

# wip/petersonN (student project)
# (removed with the wip/ directory in commit 6afc00a)

# raft (refinement chain: raftLedger -> raftCore -> raftNet)
install_pkg raftLedger                      examples/raft/raftLedger.mlw
install_pkg raftCore                        examples/raft/raftCore.mlw
install_pkg raftNet                         examples/raft/raftNet.mlw

# controlledFlooding (student project: Gonçalo Caixeiro)
install_pkg controlledFlooding              examples/controlledFlooding/controlledFlooding.mlw

# wip/ricartAgrawala (student project: Cláudia Pinto, Patrícia Carvalho)
# (moved to examples/mutualExclusionDistributed)

# wip/lamport (student project: João Duarte, Luís Silva)
# (moved to examples/mutualExclusionDistributed)

echo "done. packages installed:"
why3find list
