# gentoo-overlay

This is my first gentoo overlay, and may have some problems. Pull requests are always welcome.

## Packages
- nitch
    - `USE=nerd-fonts`

## How to add?

One liner method:
```bash
eselect repository add joshrandall8478 git https://github.com/joshrandall8478/gentoo-overlay.git
emaint sync -r joshrandall8478
```

Manual method:
Create `/etc/portage/repos.conf/joshrandall8478.conf`:
```ini
[joshrandall8478]
location = /var/db/repos/joshrandall8478
sync-type = git
sync-uri = https://github.com/joshrandall8478/gentoo-overlay.git
```
Then run the following command: 
```bash
emaint sync -r joshrandall8478
```
