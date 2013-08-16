ps|grep '??'|grep -v grep|awk -F ' ' '{print $1}'|xargs kill -SIGKILL
