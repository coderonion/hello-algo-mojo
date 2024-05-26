"""
File: worst_best_time_complexity.py
Created Time: 2024-05-26
Author: codingonion (coderonion@gmail.com)
"""

import random

fn shuffle(inout nums: StaticIntTuple):
    """随机打乱数组元素."""
    random.seed()
    for i in range(len(nums) - 1, 0, -1):
        var j = random.random_ui64(0, i)
        nums[i], nums[j] = nums[j], nums[i]

fn random_numbers[n: Int]() -> StaticIntTuple[n]:
    """生成一个数组，元素为: 1, 2, ..., n ，顺序被打乱."""
    # 生成数组 nums =: 1, 2, 3, ..., n
    var nums = StaticIntTuple[n]()
    for i in range(1, n + 1):
        nums[i] = i
    # 随机打乱数组元素
    shuffle(nums)
    return nums

fn find_one(nums: StaticIntTuple) -> Int:
    """查找数组 nums 中数字 1 所在索引."""
    for i in range(len(nums)):
        # 当元素 1 在数组头部时，达到最佳时间复杂度 O(1)
        # 当元素 1 在数组尾部时，达到最差时间复杂度 O(n)
        if nums[i] == 1:
            return i
    return -1

"""Driver Code"""
fn main():
    for i in range(10):
        alias n = 100
        var nums = random_numbers[n]()
        var index = find_one(nums)
        print("\n数组 [ 1, 2, ..., n ] 被打乱后 =", nums)
        print("数字 1 的索引为", index)
