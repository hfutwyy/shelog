#!/bin/bash
# 日志记录工具类--线下测试代码

#set -x

source ./SheLog.sh
#util_log_error "ERRMSG HERE1";
#util_log_info  "INFO LOG HERE HAHAHA1";
#util_log_warning "WARNING INFO HERE1";

# 重复引用测试
#source ./SheLog.sh
#util_log_error "ERRMSG HERE2    ";
#util_log_info  "INFO LOG HERE\n HAHAHA2";
#util_log_warning "WARNING INFO\" HERE2";

# 打印500条错误日志
for i in {1..500}
do
    util_log_error "ERRMSG_$$"
done
