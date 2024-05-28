"""
File: my_list.mojo
Created Time: 2024-05-26
Author: codingonion (coderonion@gmail.com)
"""

@value
struct MyList:
    """列表类."""

    var _capacity: Int
    var _arr: List[Int]
    var _size: Int
    var _extend_ratio: Int

    fn __init__(inout self):
        """构造方法."""
        self._capacity = 10  # 列表容量
        self._arr = List[Int](capacity = self._capacity)  # 数组（存储列表元素）
        self._size = 0  # 列表长度（当前元素数量）
        self._extend_ratio = 2  # 每次列表扩容的倍数

    fn size(self) -> Int:
        """获取列表长度（当前元素数量）."""
        return self._size

    fn capacity(self) -> Int:
        """获取列表容量."""
        return self._capacity

    fn get(self, index: Int) raises -> Int:
        """访问元素."""
        # 索引如果越界，则抛出异常，下同
        if index < 0 or index >= self._size:
            raise Error("索引越界")
        return self._arr[index]

    fn set(inout self, num: Int, index: Int) raises:
        """更新元素."""
        if index < 0 or index >= self._size:
            raise Error("索引越界")
        self._arr[index] = num

    fn add(inout self, num: Int):
        """在尾部添加元素."""
        # 元素数量超出容量时，触发扩容机制
        if self.size() == self.capacity():
            self.extend_capacity()
        self._arr.append(num)
        self._size += 1

    fn insert(inout self, num: Int, index: Int) raises:
        """在中间插入元素."""
        if index < 0 or index >= self._size:
            raise Error("索引越界")
        # 元素数量超出容量时，触发扩容机制
        if self._size == self.capacity():
            self.extend_capacity()
        self._arr.append(0)
        # 将索引 index 以及之后的元素都向后移动一位
        for j in range(self._size - 1, index - 1, -1):
            self._arr[j + 1] = self._arr[j]
        self._arr[index] = num
        # 更新元素数量
        self._size += 1

    fn remove(inout self, index: Int) raises -> Int:
        """删除元素."""
        if index < 0 or index >= self._size:
            raise Error("索引越界")
        var num = self._arr[index]
        # 将索引 index 之后的元素都向前移动一位
        for j in range(index, self._size - 1):
            self._arr[j] = self._arr[j + 1]
        _ = self._arr.pop()
        # 更新元素数量
        self._size -= 1
        # 返回被删除的元素
        return num

    fn extend_capacity(inout self):
        """列表扩容."""
        # 新建一个长度为原数组 _extend_ratio 倍的新数组，并将原数组复制到新数组
        self._arr.extend(List[Int](capacity = self.capacity() * (self._extend_ratio - 1)))
        # 更新列表容量
        self._capacity = self.capacity() * self._extend_ratio

    def to_array(self) -> List[Int]:
        """返回有效长度的列表."""
        return self._arr

"""Driver Code"""
fn main() raises:
    # 初始化列表
    var nums = MyList()
    # 在尾部添加元素
    nums.add(1)
    nums.add(3)
    nums.add(2)
    nums.add(5)
    nums.add(4)
    print("列表 nums =", __type_of(nums.to_array()).__str__(nums.to_array()), ", 容量 =", nums.capacity(), ", 长度 =", nums.size())

    # 在中间插入元素
    nums.insert(6, index=3)
    print("在索引 3 处插入数字 6 ，得到 nums =", __type_of(nums.to_array()).__str__(nums.to_array()))

    # 删除元素
    _ = nums.remove(3)
    print("删除索引 3 处的元素，得到 nums =", __type_of(nums.to_array()).__str__(nums.to_array()))

    # 访问元素
    var num = nums.get(1)
    print("访问索引 1 处的元素，得到 num =", num)

    # 更新元素
    nums.set(0, 1)
    print("将索引 1 处的元素更新为 0 ，得到 nums =", __type_of(nums.to_array()).__str__(nums.to_array()))

    # 测试扩容机制
    for i in range(10):
        # 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
        nums.add(i)
    print("扩容后的列表", __type_of(nums.to_array()).__str__(nums.to_array()), ", 容量 =", nums.capacity(), ", 长度 =", nums.size())
