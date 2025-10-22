## Instructions for uploading data from Pharma2-44 to s3 bucket

### 1) Install wsl Ubuntu
```bash
wsl --install -d Ubuntu
```

### 2) Install and configure rclone
```bash
sudo apt install rclone
```

### 3) Clone repository
```bash
git clone https://github.com/samuelwald/merscope_s3_bucket.git
```

### 4) Mount pharma2-44
```bash
cd /scripts
bash mount_pharma2-44.sh 
```

### 5) Mount s3 bucket

```bash
cd /scripts
bash mount_s3_bucket.sh
```

### 6) Upload data
```bash
cd /scripts
bash rclone_copy.sh
```
