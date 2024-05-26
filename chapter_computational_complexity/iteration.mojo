"""
File: iteration.mojo
Created Time: 2024-03-16
Author: codingonion (coderonion@gmail.com)
"""

fn for_loop(n: Int) -> Int:
    """For 循环."""
    var res = 0
    # 循环求和 1, 2, ..., n-1, n
    for i in range(1, n + 1):
        res += i
    return res

fn while_loop(n: Int) -> Int:
    """While 循环."""
    var res = 0
    var i = 1  # 初始化条件变量
    # 循环求和 1, 2, ..., n-1, n
    while i <= n:
        res += i
        i += 1  # 更新条件变量
    return res

fn while_loop_ii(n: Int) -> Int:
    """While 循环（两次更新）."""
    var res = 0
    var i = 1  # 初始化条件变量
    # 循环求和 1, 4, 10, ...
    while i <= n:
        res += i
        # 更新条件变量
        i += 1
        i *= 2
    return res

fn nested_for_loop(n: Int) -> String:
    """双层 for 循环."""
    var res: String = ""
    # 循环 i = 1, 2, ..., n-1, n
    for i in range(1, n + 1):
        # 循环 j = 1, 2, ..., n-1, n
        for j in range(1, n + 1):
            res = res + "(" + i + ", " + j + "), "
    return res

"""Driver Code"""
fn main() raises:
    var n = 5
    var res = for_loop(n)
    print("\nfor 循环的求和结果 res = ", res)

    res = while_loop(n)
    print("\nwhile 循环的求和结果 res = ", res)

    res = while_loop_ii(n)
    print("\nwhile 循环（两次更新）求和结果 res = ", res)

    var res_new = nested_for_loop(n)
    print("\n双层 for 循环的遍历结果 ", res_new)