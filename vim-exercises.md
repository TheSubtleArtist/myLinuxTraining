# VIM Exercises for CompTIA Linux+ (XK0-006) Preparation

**Purpose**: Progressive hands-on practice with VIM, focused on common system administration tasks involving configuration files, scripts, and logs.  
**Skill ceiling**: Basic navigation → insert/change/delete → yank/put → visual modes → search/replace → simple regex → multi-file editing.  
**Exam relevance**: Aligns with 1.5 Text Editors (vi/vim) and practical use of high-impact files (/etc/hosts, /etc/fstab, .bashrc, sudoers.d, systemd units, crontab, sshd_config, etc.).

- [Setup (Do Once)](#setup-do-once)
- [Fundamental Level (Exercises 1–12)](#fundamental-level-exercises-112)
  - [Exercise 1 – Create and save a basic hosts file copy](#exercise-1--create-and-save-a-basic-hosts-file-copy)
  - [Exercise 2 – Navigate and edit hosts sample](#exercise-2--navigate-and-edit-hosts-sample)
  - [Exercise 3 – Delete lines in fstab sample](#exercise-3--delete-lines-in-fstab-sample)
  - [Exercise 4 – Yank and put in .bashrc snippet](#exercise-4--yank-and-put-in-bashrc-snippet)
  - [Exercise 5 – Insert multiple lines at once](#exercise-5--insert-multiple-lines-at-once)
  - [Exercise 6 – Change word under cursor](#exercise-6--change-word-under-cursor)
  - [Exercise 7 – Repeat last change with .](#exercise-7--repeat-last-change-with-)
  - [Exercise 8 – Search forward/backward](#exercise-8--search-forwardbackward)
  - [Exercise 9 – Replace single occurrence](#exercise-9--replace-single-occurrence)
  - [Exercise 10 – Show line numbers](#exercise-10--show-line-numbers)
  - [Exercise 11 – Delete multiple lines \& to end](#exercise-11--delete-multiple-lines--to-end)
  - [Exercise 12 – Exit variations](#exercise-12--exit-variations)
- [Experienced Level (Exercises 13–24)](#experienced-level-exercises-1324)
  - [Exercise 13 – Visual line mode delete](#exercise-13--visual-line-mode-delete)
  - [Exercise 14 – Visual block column edit](#exercise-14--visual-block-column-edit)
  - [Exercise 15 – Global replace with confirm](#exercise-15--global-replace-with-confirm)
  - [Exercise 16 – Simple regex uncomment](#exercise-16--simple-regex-uncomment)
  - [Exercise 17 – Yank to named register](#exercise-17--yank-to-named-register)
  - [Exercise 18 – Change case in visual mode](#exercise-18--change-case-in-visual-mode)
  - [Exercise 19 – Substitute with range](#exercise-19--substitute-with-range)
  - [Exercise 20 – Delete lines matching pattern](#exercise-20--delete-lines-matching-pattern)
  - [Exercise 21 – Multi-file editing basics](#exercise-21--multi-file-editing-basics)
  - [Exercise 22 – Append from external command](#exercise-22--append-from-external-command)
  - [Exercise 23 – Visual mode indent](#exercise-23--visual-mode-indent)
  - [Exercise 24 – Undo/redo multiple steps](#exercise-24--undoredo-multiple-steps)
- [Advanced Level (Exercises 25–36)](#advanced-level-exercises-2536)
  - [Exercise 25 – Replace with capture group (simple backref)](#exercise-25--replace-with-capture-group-simple-backref)
  - [Exercise 26 – Comment/uncomment block](#exercise-26--commentuncomment-block)
  - [Exercise 27 – Sort lines in visual mode](#exercise-27--sort-lines-in-visual-mode)
  - [Exercise 28 – Delete every other line](#exercise-28--delete-every-other-line)
  - [Exercise 29 – Join lines](#exercise-29--join-lines)
  - [Exercise 30 – Case-insensitive search](#exercise-30--case-insensitive-search)
  - [Exercise 31 – Replace tabs with spaces](#exercise-31--replace-tabs-with-spaces)
  - [Exercise 32 – Number lines automatically](#exercise-32--number-lines-automatically)
  - [Exercise 33 – Edit multiple buffers](#exercise-33--edit-multiple-buffers)
  - [Exercise 34 – Quick fix common typo across file](#exercise-34--quick-fix-common-typo-across-file)
  - [Exercise 35 – Trim trailing whitespace](#exercise-35--trim-trailing-whitespace)
  - [Exercise 36 – Simulate config cleanup](#exercise-36--simulate-config-cleanup)
- [Quick Reference – Common VIM Commands Used](#quick-reference--common-vim-commands-used)
- [Answers and Recommended Keystrokes/Solutions](#answers-and-recommended-keystrokessolutions)

## Setup (Do Once)

```bash
mkdir -p ~/vim-lab
cd ~/vim-lab
```

**Critical Rule**  
**Never edit real system files** in /etc, /var, etc. during these exercises. Always work on copies or sample files created in ~/vim-lab.

## Fundamental Level (Exercises 1–12)  
Focus: Modes, navigation, basic insert/delete/change, yank/put, undo, simple search/replace, saving/quitting.

### Exercise 1 – Create and save a basic hosts file copy
**Objective**: Open Vim, enter insert mode, add content, save and quit.  
**Tasks**:
1. `touch hosts-copy`
2. `vim hosts-copy`
3. Enter insert mode and add:
   ```
   127.0.0.1   localhost
   192.168.1.10 server1.example.com server1
   ::1         localhost ip6-localhost ip6-loopback
   ```
4. Exit insert mode, save, and quit.

### Exercise 2 – Navigate and edit hosts sample
**Objective**: Practice h/j/k/l, G, gg, append, insert new line.  
**Tasks**:
1. Open `hosts-copy`
2. Move to line 2 → append " alias1" to the end
3. Go to end of file → insert new line: `10.0.0.5 backup.example.com`
4. Save and quit.

### Exercise 3 – Delete lines in fstab sample
**Objective**: dd, u (undo)  
**Preparatory**:
```bash
cat > fstab-copy <<EOF
/dev/sda1               /           ext4    defaults        0 1
UUID=abcd-1234          /boot       ext4    defaults        0 2
/dev/sdb1               none        swap    sw              0 0
tmpfs                   /tmp        tmpfs   defaults,noatime 0 0
EOF
```
**Tasks**:
1. Open `fstab-copy`
2. Delete line 3 (swap)
3. Undo
4. Delete line 4 (tmpfs) instead
5. Save and quit.

### Exercise 4 – Yank and put in .bashrc snippet
**Objective**: yy, p, P, cw  
**Preparatory**:
```bash
cat > bashrc-snippet <<EOF
export PATH=$PATH:/usr/local/bin
alias ll='ls -l'
PS1='\u@\h:\w\$ '
EOF
```
**Tasks**:
1. Open `bashrc-snippet`
2. Yank the alias line
3. Paste below PS1 line
4. Change pasted line to `alias la='ls -A'`
5. Save and quit.

### Exercise 5 – Insert multiple lines at once
**Objective**: o / O for new lines  
**Tasks**:
1. Open `bashrc-snippet`
2. Go to end
3. Open new line below and insert:
   ```
   # Custom functions
   myfunc() { echo "Hello $1"; }
   ```
4. Save and quit.

### Exercise 6 – Change word under cursor
**Objective**: cw / cW  
**Preparatory**:
```bash
cat > resolv-conf-copy <<EOF
nameserver 8.8.8.8
nameserver 8.8.4.4
search example.com localdomain
EOF
```
**Tasks**:
1. Open file
2. Change "example.com" → "corp.example.com" using change-word
3. Save and quit.

### Exercise 7 – Repeat last change with .
**Objective**: . (dot) command  
**Tasks**:
1. Open `resolv-conf-copy`
2. Change first 8.8.8.8 → 1.1.1.1 using cw
3. Move to line 2 → repeat change (to 1.0.0.1)
4. Save and quit.

### Exercise 8 – Search forward/backward
**Objective**: / ? n N  
**Preparatory**:
```bash
echo "student ALL=(ALL) NOPASSWD: /usr/bin/systemctl restart sshd" > sudoers-d-copy
```
**Tasks**:
1. Open file
2. Search forward for "NOPASSWD"
3. Search backward for "ALL"
4. Jump next/previous occurrence
5. Quit without saving.

### Exercise 9 – Replace single occurrence
**Objective**: :s/old/new  
**Tasks**:
1. Open `sudoers-d-copy`
2. Replace "sshd" with "httpd" on current line only
3. Save and quit.

### Exercise 10 – Show line numbers
**Objective**: :set nu / :set nonu, :line_number  
**Tasks**:
1. Open any previous file (e.g. `fstab-copy`)
2. Turn on line numbers
3. Jump to line 3 with `:3`
4. Turn numbers off
5. Quit without saving.

### Exercise 11 – Delete multiple lines & to end
**Objective**: 3dd, d$  
**Tasks**:
1. Open `fstab-copy`
2. On line 1: delete last 3 characters (d$)
3. Delete lines 2–4 at once (3dd)
4. Undo twice
5. Save and quit.

### Exercise 12 – Exit variations
**Objective**: :q :q! :wq ZZ  
**Preparatory**:
```bash
echo "practice" > test-exit
```
**Tasks**:
1. Open, add " vim" to line
2. Try :q! (discard)
3. Reopen, add again, save & quit with ZZ

## Experienced Level (Exercises 13–24)
Focus: Visual mode (v V Ctrl-v), global replace (:s/g/c), named registers, multi-file, ex commands.

### Exercise 13 – Visual line mode delete
**Objective**: V to select lines, d to delete  
**Tasks**:
1. Open `fstab-copy`
2. V on line 1 → extend down 2 lines → d
3. u (undo)
4. Save and quit.

### Exercise 14 – Visual block column edit
**Objective**: Ctrl-v, I (insert before)  
**Preparatory**:
```bash
cat > logrotate-copy <<EOF
/var/log/messages {
    weekly
    rotate 4
    compress
}
/var/log/secure {
    weekly
    rotate 4
    compress
}
EOF
```
**Tasks**:
1. Open file
2. Ctrl-v select indentation of "weekly\nrotate 4\ncompress" in first block
3. I# Esc (comment them)
4. Save and quit.

### Exercise 15 – Global replace with confirm
**Objective**: :%s/old/new/gc  
**Tasks**:
1. Open `resolv-conf-copy` (add duplicates if needed)
2. :%s/nameserver/dns-server/gc → y first, n second
3. Save and quit.

### Exercise 16 – Simple regex uncomment
**Objective**: :%s/^#//g  
**Preparatory**:
```bash
cat > sshd-config-copy <<EOF
#Port 22
#PermitRootLogin prohibit-password
#PasswordAuthentication yes
EOF
```
**Tasks**:
1. Open file
2. :%s/^#//g
3. Save and quit.

### Exercise 17 – Yank to named register
**Objective**: "a yy, "a p  
**Tasks**:
1. Open `logrotate-copy`
2. V select first block → "ay
3. G "ap
4. Save and quit.

### Exercise 18 – Change case in visual mode
**Objective**: v select, ~ toggle case  
**Preparatory**:
```bash
echo "welcome to production server - authorized access only" > issue-copy
```
**Tasks**:
1. Open file
2. v select "production" → ~
3. Save and quit.

### Exercise 19 – Substitute with range
**Objective**: :start,end s/old/new/g  
**Preparatory**:
```bash
head -30 /etc/services > services-copy
```
**Tasks**:
1. Open file
2. :5,15s/tcp/TCP/g
3. Save and quit.

### Exercise 20 – Delete lines matching pattern
**Objective**: :g/pattern/d  
**Tasks**:
1. Open `sshd-config-copy` (add duplicates)
2. :g/PasswordAuthentication/d
3. Save and quit.

### Exercise 21 – Multi-file editing basics
**Objective**: vim file1 file2, :n, :wqa  
**Tasks**:
1. `vim hosts-copy fstab-copy`
2. Edit line 1 in first
3. :n → edit in second
4. :wqa

### Exercise 22 – Append from external command
**Objective**: :r !command  
**Preparatory**:
```bash
touch motd-copy
```
**Tasks**:
1. Open file
2. :r !date
3. oSystem uptime: Esc :r !uptime
4. Save and quit.

### Exercise 23 – Visual mode indent
**Objective**: V select, > indent  
**Tasks**:
1. Open `logrotate-copy`
2. V select inner block of first section
3. >> (twice for 4 spaces)
4. Save and quit.

### Exercise 24 – Undo/redo multiple steps
**Objective**: Multiple u / Ctrl-r  
**Tasks**:
1. Open any file, make 4-5 changes
2. u 3 times
3. Ctrl-r twice
4. Save final.

## Advanced Level (Exercises 25–36)
Focus: Combining features, capture groups, batch editing, sysadmin simulations.

### Exercise 25 – Replace with capture group (simple backref)
**Objective**: :%s/\(pattern\)/\1 new/g  
**Preparatory**:
```bash
cat > crontab-copy <<EOF
0 2 * * * /backup.sh full
30 3 * * 0 /backup.sh incremental
EOF
```
**Tasks**:
1. Open file
2. :%s/backup\.sh \(\w\+\)/backup-daily.sh \1/g
3. Save and quit.

### Exercise 26 – Comment/uncomment block
**Objective**: Ctrl-v, I# / remove  
**Tasks**:
1. Open `sshd-config-copy` (expand to 8-10 lines)
2. Ctrl-v select first column lines 3-7 → I# Esc
3. Repeat to remove #
4. Save and quit.

### Exercise 27 – Sort lines in visual mode
**Objective**: V select, :sort  
**Preparatory**:
```bash
cat > users-copy <<EOF
bob:x:1001:1001::/home/bob:/bin/bash
alice:x:1002:1001::/home/alice:/bin/bash
zoe:x:1000:1000::/home/zoe:/bin/bash
EOF
```
**Tasks**:
1. Open file
2. V select all → :sort
3. Save and quit.

### Exercise 28 – Delete every other line
**Objective**: :g/^/+d  
**Preparatory**:
```bash
seq 1 10 > lines-copy
```
**Tasks**:
1. Open file
2. :g/^/+d
3. Save and quit.

### Exercise 29 – Join lines
**Objective**: J / gJ  
**Preparatory**:
```bash
cat > fragmented <<EOF
This is a
long config
line that
needs joining.
EOF
```
**Tasks**:
1. Open file
2. gg V G J
3. Save and quit.

### Exercise 30 – Case-insensitive search
**Objective**: /pattern/i  
**Tasks**:
1. Open any file with mixed case "root"
2. /root/i
3. Quit without saving.

### Exercise 31 – Replace tabs with spaces
**Objective**: :%s/\t/  /g  
**Preparatory**:
```bash
echo -e "line1\twith\ttabs\nline2\twith\ttabs" > tabbed-copy
```
**Tasks**:
1. Open file
2. :%s/\t/  /g
3. Save and quit.

### Exercise 32 – Number lines automatically
**Objective**: :%s/^/\=line('.') . ' '/  
**Preparatory**:
```bash
cat > list-copy <<EOF
item1
item2
item3
item4
item5
EOF
```
**Tasks**:
1. Open file
2. :%s/^/\=line('.') . ' '/
3. Save and quit.

### Exercise 33 – Edit multiple buffers
**Objective**: :ls, :bN, :bd  
**Tasks**:
1. `vim hosts-copy fstab-copy resolv-conf-copy`
2. :ls
3. :b2 (switch)
4. :bd3 (delete third)
5. :qall

### Exercise 34 – Quick fix common typo across file
**Objective**: :%s/teh/the/g  
**Preparatory**:
```bash
cat > script-copy <<EOF
teh quick brown fox
jumps over teh lazy dog
teh end
EOF
```
**Tasks**:
1. Open file
2. :%s/teh/the/g
3. Save and quit.

### Exercise 35 – Trim trailing whitespace
**Objective**: :%s/\s\+$//e  
**Preparatory**:
```bash
cat > whitespace-copy <<EOF
line with trailing space   
another one  
no trailing
EOF
```
**Tasks**:
1. Open file
2. :%s/\s\+$//e
3. Save and quit.

### Exercise 36 – Simulate config cleanup
**Objective**: :g/^#/d, remove duplicates/blank lines  
**Tasks**:
1. Open expanded `sshd-config-copy` with comments/duplicates
2. :g/^#/d
3. :g/^$/d (repeat for multiples)
4. Save and quit.

## Quick Reference – Common VIM Commands Used

| Action                     | Command(s)                          |
|----------------------------|-------------------------------------|
| Enter insert               | i I a A o O                         |
| Exit insert                | Esc                                 |
| Save & quit                | :wq  ZZ                             |
| Quit without save          | :q!                                 |
| Undo / redo                | u / Ctrl-r                          |
| Delete line                | dd                                  |
| Yank line                  | yy                                  |
| Paste                      | p P                                 |
| Search                     | /pattern  ?pattern  n N             |
| Replace current line       | :s/old/new                          |
| Replace all in file        | :%s/old/new/g                       |
| Replace with confirm       | :%s/old/new/gc                      |
| Visual line                | V                                   |
| Visual block               | Ctrl-v                              |
| Line numbers               | :set nu / :set nonu                 |
| Go to line                 | :42                                 |
| Repeat last change         | .                                   |

## Answers and Recommended Keystrokes/Solutions

**Fundamental**  
1. i [content] Esc :wq  
2. j $ a alias1 Esc G o 10.0.0.5 backup.example.com Esc :wq  
3. jj dd u 3G dd :wq  
4. j yy jp cwla Esc cw'ls -A' Esc :wq  
5. G o # Custom functions Esc o myfunc() { echo "Hello $1"; } Esc :wq  
6. /example.com cwcorp.example.com Esc :wq  
7. cw1.1.1.1 Esc j . :wq  
8. /NOPASSWD ?ALL n N :q  
9. :s/sshd/httpd :wq  
10. :set nu :3 :set nonu :q  
11. $ xxx 2G 3dd u u :wq  
12. i vim Esc :q! [reopen] i vim Esc ZZ  

**Experienced**  
13. V jj d u :wq  
14. Ctrl-v jjji# Esc :wq  
15. :%s/nameserver/dns-server/gc [y/n] :wq  
16. :%s/^#//g :wq  
17. Vjjjj "ay G "ap :wq  
18. /production v$ ~ :wq  
19. :5,15s/tcp/TCP/g :wq  
20. :g/PasswordAuthentication/d :wq  
21. cwchange Esc :n cwchange Esc :wqa  
22. :r !date oSystem uptime: Esc :r !uptime :wq  
23. j V jj >> >> :wq  
24. [make changes] u u u Ctrl-r Ctrl-r :wq  

**Advanced**  
25. :%s/backup\.sh \(\w\+\)/backup-daily.sh \1/g :wq  
26. Ctrl-v 4j I# Esc [repeat for remove with x] :wq  
27. gg V G :sort :wq  
28. :g/^/+d :wq  
29. gg V G J :wq  
30. /root/i n :q  
31. :%s/\t/  /g :wq  
32. :%s/^/\=line('.') . ' '/ :wq  
33. :ls :b2 :bd3 :qall  
34. :%s/teh/the/g :wq  
35. :%s/\s\+$//e :wq  
36. :g/^#/d :g/^$/d :wq  

Practice repeatedly on copies. Good luck with Linux+ XK0-006!