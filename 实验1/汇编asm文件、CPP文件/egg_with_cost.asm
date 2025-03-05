

# 寄存器用途：
# $2 (楼层上限): 建筑物的最大楼层数 (1024)
# $3 (鸡蛋耐摔值): 鸡蛋的最大可忍受摔落楼层 (65)
# $4 (总摔鸡蛋次数): 记录总共的摔鸡蛋次数
# $5 (碎裂的鸡蛋数): 记录摔碎的鸡蛋数
# $6 (最后一个鸡蛋是否碎裂): 标志位，1 表示鸡蛋碎裂，0 表示未碎裂
# $7 (左边搜索边界): 二分查找时的左边搜索边界
# $8 (右边搜索边界): 二分查找时的右边搜索边界
# $9 (中间值): 二分查找时的中间值
# $10 (常数1): 常数值1
# $11 (物质匮乏时期总成本): 记录物质匮乏时期的总成本
# $12 (人力成本增长时期总成本): 记录人力成本增长时期的总成本
# $13 (p1): 上楼成本
# $14 (p2): 下楼成本
# $15 (p3): 鸡蛋成本
# $16 (上楼层次数 m): 累加上楼的总层数
# $17 (下楼层次数 n): 累加下楼的总层数
# $18 (上次尝试的楼层): 上一次尝试楼层的值，初始为 (n + 1) / 2


.text
    #addi $2, $0, 128      # 设置楼层上限 n
    #addi $3, $0, 20       # 设置鸡蛋耐摔值 m
    addi $10, $0, 1         # 常数 1
    add $7, $0, $0          # 左边界 l = 0
    add $8, $0, $2          # 右边界 r = n
    addi $18, $2, 1         # 上次尝试楼层初始值为 (n + 1) / 2
    sra $18, $18, 1         # $18 = (n + 1) / 2
    add $11, $0, $0         # 初始化物质匮乏时期总成本为0
    add $12, $0, $0         # 初始化人力成本增长时期总成本为0
    add $16, $0, $0         # 初始化上楼层次数为0
    add $17, $0, $0         # 初始化下楼层次数为0
    add $5, $0, $0          # 初始化摔碎的鸡蛋次数为0

    # 设置物质匮乏时期成本参数 (p1=2, p2=1, p3=4)
    addi $13, $0, 2         # p1 = 2
    addi $14, $0, 1         # p2 = 1
    addi $15, $0, 4         # p3 = 4

LOOP:
    slt $19, $7, $8         # 检查左边界是否小于右边界 ($19=1 表示 l < r)
    beq $19, $0, END  # 如果 l >= r，跳转到 CALC_COST

    addi $4, $4, 1          # 增加总摔鸡蛋次数
    add $9, $7, $8          # 计算中间值 (l + r + 1) / 2
    addi $9, $9, 1
    sra $9, $9, 1           # mid = (l + r + 1) / 2

    # 计算上楼或下楼的层数
    slt $19, $18, $9        # 如果 $18 < $9，表示上楼
    bne $19, $0, GOING_UP   # 若上楼，跳转到 GOING_UP
    sub $20, $18, $9        # 下楼层数 = last_try_floor - mid
    add $17, $17, $20       # 累加下楼层次数
    j UPDATE_LAST_FLOOR

GOING_UP:
    sub $20, $9, $18        # 上楼层数 = mid - last_try_floor
    add $16, $16, $20       # 累加上楼层次数

UPDATE_LAST_FLOOR:
    add $18, $0, $9         # 更新上次尝试的楼层为 mid

    # 判断鸡蛋是否碎裂
    slt $19, $3, $9         # 如果耐摔值 < mid ($19=1)
    beq $19, $10, BROKE     # 若鸡蛋耐摔值小于 mid，跳转到 BROKE

RESIST:
    add $6, $0, $0          # 最后一个鸡蛋未碎裂
    add $7, $0, $9          # 更新左边界为 mid
    j LOOP

BROKE:
    addi $5, $5, 1          # 增加碎裂的鸡蛋数
    add $6, $0, $10         # 设置最后一个鸡蛋碎裂标志
    addi $8, $9, -1         # 更新右边界为 mid - 1
    j LOOP
    
END:
    #j END                   # 无限循环
.text  ends




