#shell common log library, Named shelog.



SHELL日志记录类

特点：

1.日志分级，并可自己定制

2.同一进程有相同的LOGID

3.同一进程的不同日志有自增中ID

4.日志格式友好，并可简单配置修改

日志

用法：
参考shelog_test.sh

示例：

[2015-02-12 01:14:30] -- [ERRO] -- [shelog_test.sh] -- [ERRMSG HERE1] -- [LOGID_1423732470698687721_43560] -- [1]

[2015-02-12 01:14:30] -- [INFO] -- [shelog_test.sh] -- [INFO LOG HERE HAHAHA1] -- [LOGID_1423732470698687721_43560] -- [2]

[2015-02-12 01:14:30] -- [WARN] -- [shelog_test.sh] -- [WARNING INFO HERE1] -- [LOGID_1423732470698687721_43560] -- [3]

[2015-02-12 01:14:30] -- [ERRO] -- [shelog_test.sh] -- [ERRMSG HERE2    ] -- [LOGID_1423732470698687721_43560] -- [4]

[2015-02-12 01:14:30] -- [INFO] -- [shelog_test.sh] -- [INFO LOG HERE\n HAHAHA2] -- [LOGID_1423732470698687721_43560] -- [5]

[2015-02-12 01:14:30] -- [WARN] -- [shelog_test.sh] -- [WARNING INFO" HERE2] -- [LOGID_1423732470698687721_43560] -- [6]



日志以" -- "分隔各字段，并且每部分放在[]中。


大叔好2
