
==========
 Overview
==========

Trying to reproduce the issue https://github.com/NixOS/nix/issues/847

To reproduce the following approach is chosen:

* Define the source as a fixed output derivation

* Build on NixOS

* Build on Darwin

Assumption: This will fail on one system since the hashes don't match due to
incompatibilities in the unicode handling.


Result on darwin
================

.. code:: shell

    $ nix-build -A tarball --check
    checking path(s) ‘/nix/store/85k0lfp0dqza0yny0b8ljnhwg7jsnmy5-9c7029ef3b9301c9faf55659ea281332f5f6a281.tar.gz’

    trying https://github.com/johbo/reproduce-nix-unicode-darwin/archive/9c7029ef3b9301c9faf55659ea281332f5f6a281.tar.gz
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                    Dload  Upload   Total   Spent    Left  Speed
    100   176    0   176    0     0    176      0 --:--:-- --:--:-- --:--:--   301
    100   501  100   501    0     0    501      0  0:00:01  0:00:01 --:--:--   702
    unpacking source archive /private/var/folders/v2/kx2sg5693tb1h84zc2hmjjgr0000gn/T/nix-build-9c7029ef3b9301c9faf55659ea281332f5f6a281.tar.gz.drv-0/9c7029ef3b9301c9faf55659ea281332f5f6a281.tar.gz
    warning: rewriting hashes in ‘/nix/store/85k0lfp0dqza0yny0b8ljnhwg7jsnmy5-9c7029ef3b9301c9faf55659ea281332f5f6a281.tar.gz’; cross fingers
    /nix/store/85k0lfp0dqza0yny0b8ljnhwg7jsnmy5-9c7029ef3b9301c9faf55659ea281332f5f6a281.tar.gz



Result on NixOS
===============


.. code:: shell

    $ nix-build -A tarball
    these derivations will be built:
      /nix/store/idpgvqqr2ybc4yljz2gxaqnaa2gqphvj-source.drv
    building path(s) ‘/nix/store/py8mvgb52sng8xa99s7dnmnhbifh0vid-source’

    trying https://github.com/johbo/reproduce-nix-unicode-darwin/archive/9c7029ef3b9301c9faf55659ea281332f5f6a281.tar.gz
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                    Dload  Upload   Total   Spent    Left  Speed
    100   176    0   176    0     0    176      0 --:--:-- --:--:-- --:--:--   216
    100   501    0   501    0     0    501      0 --:--:--  0:00:01 --:--:--   501
    unpacking source archive /tmp/nix-build-source.drv-0/9c7029ef3b9301c9faf55659ea281332f5f6a281.tar.gz
    output path ‘/nix/store/py8mvgb52sng8xa99s7dnmnhbifh0vid-source’ has r:sha256 hash ‘0izvp8n1mby460w4ylpmicg1j4jla722vjk8psflizqjn9xl26jc’ when ‘1h7z2wax8ywhp0zr08qm78573rcd6nq3y8scl5pbv3lhpilf44sr’ was expected
    error: build of ‘/nix/store/idpgvqqr2ybc4yljz2gxaqnaa2gqphvj-source.drv’ failed
