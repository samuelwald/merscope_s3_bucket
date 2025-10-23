## Instructions for uploading data from Pharma2-44 to s3 bucket

### 1) Install wsl Ubuntu
```bash
wsl --install -d Ubuntu
```

### 2) Install and configure rclone
```bash
sudo apt install rclone
```
The config should look like this:
```bash
rclone config show
```
```text
[radosgw]
type = s3
provider = Ceph
access_key_id = ***
secret_access_key = ***
endpoint = https://radosgw.public.os.wwu.de
```
### 3) Clone repository
```bash
git clone https://github.com/samuelwald/merscope_s3_bucket.git
```

### 4) Mount pharma2-44
```bash
cd /scripts
sudo bash mount_pharma2-44.sh 
```

### 5) Mount s3 bucket

```bash
cd /scripts
sudo bash mount_s3_bucket.sh
```

### 6) Upload data
```bash
tmux new -s rclone # To keep job running even when terminal is closed
cd /scripts
bash rclone_copy.sh
# tmux attach -t rclone # If you want to access the session again
```
