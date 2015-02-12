#/bin/bash
#批量测试
for i in {1..200}
do
    sh shelog_test.sh &
done
