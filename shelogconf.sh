#!/bin/bash
##! @TODO: 日志配置
##! @VERSION: 0.1
##! @AUTHOR: weiyanyan@baidu.com

# 日志文件路径
UTIL_SHE_LOG_PATH='/home/weiyanyan/var/logs/'`date "+%Y%m%d"`'/'
# 日志文件名称
UTIL_SHE_LOG_FILE='shell.log'
# 日志文件最终地址
UTIL_SHE_LOG_PATH_FILE=${UTIL_SHE_LOG_PATH}${UTIL_SHE_LOG_FILE}
# 日志格式：时间 --  报警级别   --  脚本  --  日志信息  --  LOGID_进程ID  --  自增ID
UTIL_SHE_LOG_FORMAT="[%s] -- [%s] -- [%s] -- [%s] -- [%s] -- [%d]\n"
# 日志支持的等级
UTIL_SHE_LOG_LOGTYPE=("INFO" "WARN" "ERRO")