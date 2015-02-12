#!/bin/bash
##! @TODO: SHELL日志工具类
##! @打印日志格式如下
##! @[2015-01-16 14:02:53] -- [ERRO] -- [test.sh] -- [ERRMSG HERE1] -- [LOGID_1421388173893038000_26572] -- [1]
##! @[2015-01-16 14:02:53] -- [ERRO] -- [test.sh] -- [ERRMSG HERE2] -- [LOGID_1421388173893038000_26572] -- [2]
##! @VERSION: 0.1
##! @AUTHOR: weiyanyan@baidu.com

# 防止脚本被重复导入
_util_she_log_sourced_="__sourced_$$__"
if [ -z "${!_util_she_log_sourced_}" ]
then
    eval "$_util_she_log_sourced_=1"
else
    return
fi

#引入日志配置
source ./shelogconf.sh

# 每个运行脚本唯一LOGID
UTIL_SHE_LOG_LOGID=0
# 日志序号（同一个请求按序号排列）
UTIL_SHE_LOG_INCRNO=0

##! @TODO: 日志打印
##! @AUTHOR: weiyanyan
##! @VERSION: 0.1
##! @IN: $1 => 日志类型 UTIL_SHE_LOG_LOGTYPE数组的元素之一
##! @IN: $2 => 日志内容
##! @OUT: 0 => success; 1 => 参数数量错误; 2 => 日志类型错误
function util_log()
{
    # 参数数量判断
    if [ $# -ne 2 ]
    then
        return 1;
    fi
    # 日志文件不存在，则新建
    if [ ! -f "${UTIL_SHE_LOG_PATH_FILE}" ]
    then
        echo "file not exists";
        # 目录不存在也需要建立目录
        if [ ! -d "${UTIL_SHE_LOG_PATH}" ]
        then
            mkdir -p ${UTIL_SHE_LOG_PATH};
        fi
        touch ${UTIL_SHE_LOG_PATH_FILE}
    fi
    # 字段1：时间
    LOG_DATE_TIME=`date "+%Y-%m-%d %H:%M:%S"`;
    # 字段2：消息类型判断，类型为UTIL_SHE_LOG_LOGTYPE其中之一
    local LOG_TYPE_IN=0
    for logtype in ${UTIL_SHE_LOG_LOGTYPE[@]}
    do
        if [ "$logtype" == "$1" ]
        then
            LOG_TYPE_IN=1
            break;
        fi
    done
    if [ "${LOG_TYPE_IN}" == "0" ]
    then
        return 2
    fi
    LOG_TYPE=$1
    # 字段3：运行脚本名称
    LOG_RUNNING_FILE=$0
    # 字段4：日志信息
    LOG_INFO=$2
    # 字段5：日志ID
    if [ "${UTIL_SHE_LOG_LOGID}" == "0" ]
    then
       UTIL_SHE_LOG_LOGID=`util_log_get_uniq_id`
    fi
    # 日志序列号自增
    ((UTIL_SHE_LOG_INCRNO++))
    printf "${UTIL_SHE_LOG_FORMAT}" "${LOG_DATE_TIME}" "${LOG_TYPE}" "${LOG_RUNNING_FILE}" "${LOG_INFO}" "LOGID_${UTIL_SHE_LOG_LOGID}" "${UTIL_SHE_LOG_INCRNO}" >> ${UTIL_SHE_LOG_PATH_FILE}
}

##! @TODO: 打印错误信息日志
##! @AUTHOR: weiyanyan
##! @VERSION: 0.1
##! @IN: $1 => 日志内容
##! @OUT: 0 => success; 1 => 参数数量错误;
function util_log_error()
{
    if [ $# -ne 1 ]
    then
      return 1;
    fi
    util_log "ERRO" "$1"
}

##! @TODO: 打印警告信息日志
##! @AUTHOR: weiyanyan
##! @VERSION: 1.0
##! @IN: $1 => 日志内容
##! @OUT: 0 => success; 1 => 参数数量错误;
function util_log_warning()
{
    if [ $# -ne 1 ]
    then
      return 1;
    fi
    util_log "WARN" "$1";
}

##! @TODO: 打印提示信息日志
##! @AUTHOR: weiyanyan
##! @VERSION: 0.1
##! @IN: $1 => 日志内容
##! @OUT: 0 => success; 1 => 参数数量错误;
function util_log_info()
{
    if [ $# -ne 1 ]
    then
      return 1;
    fi
    util_log "INFO" "$1";
}

##! @TODO: 获取日志唯一ID【脚本维度】
##! @AUTHOR: weiyanyan
##! @VERSION: 1.0
##! @OUT: 0 => 日志ID;
function util_log_get_uniq_id()
{
    local currentTimeStamp=`date +%s%N`
    local pid=$$
    echo ${currentTimeStamp}"_"${pid}
}
