# My boxkit
# **DEPRECATED**
## No longer used or updated due to distrobox-assemble accomplishing this in a cleaner manner. The equivalent distrobox-assemble INI can be found [here](https://github.com/jerbmega/ublue/blob/live/usr/share/ublue-os/boxkit.ini).

This is my personal Boxkit image. See the [upstream](https://github.com/ublue-os/boxkit) for more info.

## How to use

### Create Box

If you use distrobox:

    distrobox create -i ghcr.io/jerbmega/boxkit -n boxkit
    distrobox enter boxkit
    
If you use toolbx:

    toolbox create -i ghcr.io/jerbmega/boxkit -c boxkit
    toolbox enter boxkit

### Pull down your config

Use `chezmoi` to pull down your dotfiles and set up git sync.


### Make your own

Fork and add programs to this this image - over time you'll end up with the perfect CLI for you.
Keeping it as a pet works, though the author recommends leaving all your config in git and routinely pulling a new image.

The user experience is much nicer if you [set your terminal open right in the container](https://distrobox.privatedns.org/useful_tips.html#using-distrobox-as-main-cli) and is the intended experience. 

## Verification

These images are signed with sigstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/jerbmega/boxkit
    
If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets) on keeping secrets in github. You need to [generate a new keypair](https://docs.sigstore.dev/cosign/overview/) with cosign. The public key can be in your public repo (your users need it to check the signatures), and you can paste the private key in Settings -> Secrets -> Actions.
