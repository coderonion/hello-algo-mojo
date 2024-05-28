"""
File: time_complexity.mojo
Created Time: 2024-05-26
Author: codingonion (coderonion@gmail.com)
"""

fn constant(n: Int) -> Int:
    """常数阶."""
    var count = 0
    var size = 100000
    for _ in range(size):
        count += 1
    return count

fn linear(n: Int) -> Int:
    """线性阶."""
    var count = 0
    for _ in range(n):
        count += 1
    return count

fn array_traversal(nums: StaticIntTuple) -> Int:
    """线性阶（遍历数组）."""
    var count = 0
    # 循环次数与数组长度成正比
    for i in range(len(nums)):
        count += 1
    return count

fn quadratic(n: Int) -> Int:
    """平方阶."""
    var count = 0
    # 循环次数与数据大小 n 成平方关系
    for i in range(n):
        for j in range(n):
            count += 1
    return count

fn bubble_sort(inout nums: StaticIntTuple) -> Int:
    """平方阶（冒泡排序）."""
    var count = 0  # 计数器
    # 外循环：未排序区间为 [0, i]
    for i in range(len(nums) - 1, 0, -1):
        # 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        for j in range(i):
            if nums[j] > nums[j + 1]:
                # 交换 nums[j] 与 nums[j + 1]
                var tmp: Int = nums[j]
                nums[j] = nums[j + 1]
                nums[j + 1] = tmp
                count += 3  # 元素交换包含 3 个单元操作
    return count

fn exponential(n: Int) -> Int:
    """指数阶（循环实现）."""
    var count = 0
    var base = 1
    # 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
    for _ in range(n):
        for _ in range(base):
            count += 1
        base *= 2
    # count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count

fn exp_recur(n: Int) -> Int:
    """指数阶（递归实现）."""
    if n == 1:
        return 1
    return exp_recur(n - 1) + exp_recur(n - 1) + 1

fn logarithmic(_n: Int) -> Int:
    """对数阶（循环实现）."""
    var count = 0
    var n = _n
    while n > 1:
        n = int(n / 2)
        count += 1
    return count

fn log_recur(n: Int) -> Int:
    """对数阶（递归实现）."""
    if n <= 1:
        return 0
    return log_recur(int(n / 2)) + 1

fn linear_log_recur(n: Int) -> Int:
    """线性对数阶."""
    if n <= 1:
        return 1
    var count: Int = linear_log_recur(n // 2) + linear_log_recur(n // 2)
    for _ in range(n):
        count += 1
    return count

fn factorial_recur(n: Int) -> Int:
    """阶乘阶（递归实现）."""
    if n == 0:
        return 1
    var count = 0
    # 从 1 个分裂出 n 个
    for _ in range(n):
        count += factorial_recur(n - 1)
    return count

"""Driver Code"""
fn main():
    # 可以修改 n 运行，体会一下各种复杂度的操作数量变化趋势
    alias n = 8
    print("输入数据大小 n =", n)

    var count = constant(n)
    print("常数阶的操作数量 =", count)

    count = linear(n)
    print("线性阶的操作数量 =", count)
    count = array_traversal(StaticIntTuple[n]())
    print("线性阶（遍历数组）的操作数量 =", count)

    count = quadratic(n)
    print("平方阶的操作数量 =", count)
    var nums = StaticIntTuple[n]()
    for i in range(n):
        nums[i] = n - i  # [n, n-1, ..., 2, 1]
    count = bubble_sort(nums)
    print("平方阶（冒泡排序）的操作数量 =", count)

    count = exponential(n)
    print("指数阶（循环实现）的操作数量 =", count)
    count = exp_recur(n)
    print("指数阶（递归实现）的操作数量 =", count)

    count = logarithmic(n)
    print("对数阶（循环实现）的操作数量 =", count)
    count = log_recur(n)
    print("对数阶（递归实现）的操作数量 =", count)

    count = linear_log_recur(n)
    print("线性对数阶（递归实现）的操作数量 =", count)

    count = factorial_recur(n)
    print("阶乘阶（递归实现）的操作数量 =", count)
