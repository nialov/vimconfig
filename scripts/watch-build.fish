#!/usr/bin/env fish

watchexec --watch modules/ --watch flake.nix --print-events \
    -- \
    'nix build .#{myNeovim,myNeovimDocker} && podman load < result && echo "loaded"'
