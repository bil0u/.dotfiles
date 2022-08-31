# Windows

The Windows config data resides under the `windows` key in [`.chezmoidata.yaml`](/home/.chezmoidata.yaml). All keys referenced further are relative to `windows`.

**Table of contents**

<style>
    #toc { display:flex; flex-direction:column; margin-bottom:16px }
    .lvl1 { padding-left:32px; font-weight:bolder; }
    .lvl2 { padding-left:48px; }
</style>
<div id="toc">
  <a href="#bootstrap" class="lvl1">Bootstrap</a>
  <a href="#cleanup" class="lvl1">Cleanup</a>
  <a href="#apps-binaries" class="lvl1">Apps & binaries</a>
  <a href="#drivers" class="lvl2">Drivers</a>
  <a href="#packages" class="lvl2">Packages</a>
  <a href="#games" class="lvl2">Games</a>
  <a href="#preferences" class="lvl1">Preferences</a>
  <a href="#dotfiles" class="lvl2">Dotfiles</a>
  <a href="#registry" class="lvl2">Registry</a>
  <a href="#ssh-agent" class="lvl2">SSH agent</a>
  <a href="#extra-features" class="lvl2">Extra features</a>
  <a href="#taskbar" class="lvl2">Taskbar</a>
  <a href="#shortcuts" class="lvl2">Shortcuts</a>
  <a href="#updates" class="lvl1">Updates</a>

</div>

<a name="bootstrap"></a>

## Bootstrap

<a name="cleanup"></a>

## Cleanup

<a name="apps-binaries"></a>

## Apps & binaries

<a name="drivers"></a>

##### Drivers

<a name="packages"></a>

##### Packages

<a name="games"></a>

##### Games

<a name="preferences"></a>

## Preferences

<a name="dotfiles"></a>

##### Dotfiles

<a name="registry"></a>

##### Registry

Registry overrides can be defined in [`.chezmoidata.yaml`](/home/.chezmoidata.yaml), under the `windows.registry` key.

Paths can be splitted before `\`.
Note that if there's no '\' character beginning the key

Value can be specified with implicit type if it just needs update, or explicitly by settings each key as child value.

#### Implicit typing

```yaml
registry:
  HKLM:\SOFTWARE:
    \Path:
      myKey: 0
```

This will produce the following command:

```powershell
Set-ItemProperty -Path "HKLM:\SOFTWARE\Path" -Name myKey -Value 0
```

#### Explicit typing

```yaml
registry:
  HKLM:\SOFTWARE:
    \Path:
      myKey:
        Type: DWord
        Value: 0
```

This will produce the following command:

```powershell
Set-ItemProperty -Path HKLM:\SOFTWARE\Path -Name myKey -Type DWord -Value 0
```

<a name="ssh-agent"></a>

##### SSH agent

<a name="extra-features"></a>

##### Extra features

<a name="taskbar"></a>

##### Taskbar

<a name="shortcuts"></a>

##### Shortcuts

<a name="updates"></a>

## Updates
