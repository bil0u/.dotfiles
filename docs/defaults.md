# User preferences, aka _defaults_

Most of my defaults are set automatically.

On macOS, this operations is splitted in two scripts:

- [`run_onchange_before_03-defaults`](/config/.chezmoiscripts/darwin/run_onchange_before_03-defaults.tmpl): sets macOS system preferences, alongside with some apple applications.
- [`run_onchange_after_01-apps-defaults`](/config/.chezmoiscripts/darwin/run_onchange_after_01-apps-defaults): configures third party applications

#### Resources

I used this resources to find and reference all the domains and values:

- [`plistwatch`](https://github.com/catilac/plistwatch) : awesome utility to detect defaults changes when modifying macos settings interactively
- [`prefsniff`](https://github.com/zcutlip/prefsniff) : similar as `plistwatch` but for observing directories or files
- [`defaults-edit`](https://github.com/ThatsJustCheesy/defaults-edit) : GUI app to explore and edit system defaults by domain
- [mathiasbyens's `.macos`](https://github.com/mathiasbynens/dotfiles/blob/main/.macos) : a lot of defaults listed and organised in a bash script