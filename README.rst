
Trying to reproduce the issue https://github.com/NixOS/nix/issues/847

To reproduce the following approach is chosen:

* Define the source as a fixed output derivation

* Build on NixOS

* Build on Darwin

Assumption: This will fail on one system since the hashes don't match due to
incompatibilities in the unicode handling.
