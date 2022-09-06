# Manual steps

Unfortunately, everything cannot be automatized, or at least is not worth it.

This file references a few things i do manually during the bootstrap process.

<style>
    #toc { display:flex; flex-direction:column; margin-bottom:16px }
    .lvl1 { padding-left:32px; font-weight:bolder; }
    .lvl2 { padding-left:48px; }
</style>
<div id="toc">
  <a href="#common" class="lvl1">Common</a>
  <a href="#1password" class="lvl2">1Password</a>
  <a href="#protonmail" class="lvl2">Protonmail bridge</a>
  <a href="#macos" class="lvl1">macOS</a>
  <a href="#additional-apps" class="lvl2">Additional apps</a>
  <a href="#windows" class="lvl1">Windows</a>

</div>

<a name="common"></a>

## Common

<a name="1password"></a>

#### 1Password

Before being able to use SSH keys, the following needs to be enabled. Also enables Touch ID unlock for supported Macs.

- **Preferences**
  - **Security**
    - **Touch ID** : `Enabled` _(macOS w/ TouchID only)_
  - **Developer**
    - **Use SSH Agent**: `Enabled`
    - **1Password CLI 2**: `Enable biometric unlock` _(macOS w/ TouchID only)_

<a name="protonmail"></a>

#### Protonmail bridge

Open `ProtonMail Bridge` application, and login.
Then, enable `Split addresses`, and then using the select menu, choose the email address to set up and click `Configure`. Then pick your email client and click `Configure automatically`.
Repeat for all addresses to add.

Finally, go to preferences and enable `Open on startup`

<a name="macos"></a>

## macOS

<a name="additional-apps"></a>

#### Additional apps

A few apps installed manually

- CleanMyMac
- Adobe CC Suite
- iStats Menu
- Parallels Desktop

<a name="windows"></a>

## Windows

Not documented yet
