#!/bin/bash

# 检查内核是否启用地址空间布局随机化(ASLR)
echo "执行测试用例: 检查内核是否启用地址空间布局随机化(ASLR)"

# 执行命令获取当前配置
result=$(cat /proc/sys/kernel/randomize_va_space 2>/dev/null)

# 检查结果
if [[ "$result" == "2" ]]; then
    echo "PASS: ASLR已完全启用，值为: $result"
    exit 0
elif [[ "$result" == "1" ]]; then
    echo "WARNING: ASLR部分启用，值为: $result"
    echo "建议将ASLR完全启用(值为2)"
    exit 1
else
    echo "FAIL: ASLR未启用，值为: $result"
    echo "建议启用ASLR(值为2)"
    exit 1
fi
