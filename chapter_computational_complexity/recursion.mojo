"""
File: recursion.mojo
Created Time: 2024-03-16
Author: codingonion (coderonion@gmail.com)
"""

fn recur(n: Int) -> Int:
    """递归."""
    # 终止条件
    if n == 1:
        return 1
    # 递：递归调用
    var res = recur(n - 1)
    # 归：返回结果
    return n + res

fn forLoopRecur(n: Int) -> Int:
    """使用迭代模拟递归."""
    # 使用一个显式的栈来模拟系统调用栈
    var stack = List[Int]()
    var res = 0
    # 递：递归调用
    for i in range(n, 0, -1):
        # 通过“入栈操作”模拟“递”
        stack.append(i)
    # 归：返回结果
    while len(stack):
        # 通过“出栈操作”模拟“归”
        res += stack.pop_back()
    # res = 1+2+3+...+n
    return res

fn tailRecur(n: Int, res: Int) -> Int:
    """尾递归."""
    # 终止条件
    if n == 0:
        return res
    # 尾递归调用
    return tailRecur(n - 1, res + n)

fn fib(n: Int) -> Int:
    """斐波那契数列：递归."""
    # 终止条件 f(1) = 0, f(2) = 1
    if n == 1 or n == 2:
        return n - 1
    # 递归调用 f(n) = f(n-1) + f(n-2)
    var res = fib(n - 1) + fib(n - 2)
    # 返回结果 f(n)
    return res


"""Driver Code"""
fn main() raises:
    var n = 5
    var res = recur(n)
    print("\n递归函数的求和结果 res =", res)

    res = forLoopRecur(n)
    print("\n使用迭代模拟递归求和结果 res =", res)

    res = tailRecur(n, 0)
    print("\n尾递归函数的求和结果 res =", res)

    res = fib(n)
    print("\n斐波那契数列的第 " + n.__str__() + " 项为 " + res.__str__())