#!/bin/bash
##########################################################################
#
#
#
#	This scripts is used to delete db,seeks,redis,image,videos,hdfs_data
#	
#	write by xums on 5/18 2016
#
#
#
##########################################################################
# params


#source /etc/profile


# ip分割
function splitips(){
    local all_oldips=$1
    local start_ip=""
    local end=""
    local ip_header=""
    local newips=""
    
    for oldips in $all_oldips
    do
        start_ip=${oldips%-*}
        end=${oldips#*-}
    
        if [ "$end" == "$start_ip" ]
        then
            if [ "$newips" == "" ]
            then
                newips=$start_ip
            else
                newips="$newips $start_ip"
            fi
        else
            start=${start_ip##*.}
            ip_header=${start_ip%.*}
    
            for((num=$start;num<=$end;num++))
            do
                if [ "$newips" == "" ]
                then
                    newips="$ip_header.$num"
                else
                    newips="$newips $ip_header.$num"
                fi
            done
        fi
    done
    echo $newips
}


function get_redis_ip(){
    local aaa=`ssh master cat /homed/allips.sh | grep "export pub_redis_ips" `
    #aaa='pub_redis_ips="10.129.17.20 10.129.17.21"'
    eval $aaa
	redis_srv_ips=`splitips ${pub_redis_ips}`
	#redis_srv_ips=${pub_redis_ips}
    if [ -z "$redis_srv_ips" ]; then
        echo "allips.sh not find redis_srv_ips" >> ./error.log
        exit 0
    fi
    REDISPORT=7379
    
    echo ${redis_srv_ips}
#	for REDISIP in ${pub_redis_ips}; do
#		echo $REDISIP
#      	done
	for REDISIP in $redis_srv_ips; do
	echo "goto" $REDISIP "for test"
        ssh master "cd /homed/redis/bin && ./redis-cli.exe -p $REDISPORT -h $REDISIP -w ipanel info Replication | grep 'role:master'"
        if [ $? == 0 ];then
        echo "get redis master:" $REDISIP
        fi

	done
}

get_redis_ip
