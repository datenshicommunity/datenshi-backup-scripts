# Simple Backup Scripts

We do not use mysqldump because its dumb

# Requirements

- Mounted Google Drive on the Server
- Handsome

# Usage

`./backup.sh`

# Configuration

Make sure you already mount the google drive on your server before start this scripts

![image](https://user-images.githubusercontent.com/10250068/123075343-bb4d3600-d44a-11eb-81b9-4fc085abe0b6.png)

If you dont know how to mount it, go to [google-drive-ocamlfuse](https://github.com/astrada/google-drive-ocamlfuse) repository

Then `cp crot.config crot.config`

`crot.config`
```
webhookDC="INSERT_YOUR_DISCORD_WEBHOOK"
```

Also edit `backup.sh` and locate your config file
