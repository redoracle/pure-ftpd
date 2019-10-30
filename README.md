# Pure-Ftpd


Pure-FTPd is a free (BSD), secure, production-quality and standard-conformant FTP server. It doesn't provide useless bells and whistles, but focuses on efficiency and ease of use. It provides simple answers to common needs, plus unique useful features for personal users as well as hosting providers.

# docker-compose.yml

pure-ftpd:
  image: vimagick/pure-ftpd
  net: host
  volumes:
    - ./data/ftpuser:/home/ftpuser
    - ./data/pure-ftpd:/etc/pure-ftpd
  privileged: true
  restart: always
Please config firewall according to PassivePortRange.

----------
# Server
$ cd ~/fig/pure-ftpd/
$ docker-compose up -d
$ docker-compose exec pure-ftpd bash
----------

----------
>>> pure-pw useradd kev -u ftpuser -d /home/ftpuser/kev -t 1024 -T 1024 -y 1 -m
>>> pure-pw list
>>> pure-pw show kev
>>> pure-pw passwd kev -m
>>> pure-pw userdel kev -m
>>> pure-ftpwho -n
>>> exit

----------
# Tree
$ tree -F
.
├── docker-compose.yml
└── data/
    ├── ftpuser/
    │   └── kev/
    │       └── file.txt
    └── pure-ftpd/
        ├── pure-ftpd.conf
        ├── pureftpd.passwd
        └── pureftpd.pdb
        
----------

# Client

$ ftp remote-server
Name: kev
Password: ******
ftp> !touch file.txt
ftp> !ls
ftp> put file.txt
ftp> !rm file.txt
ftp> get file.txt
ftp> del file.txt
ftp> ls
ftp> bye
