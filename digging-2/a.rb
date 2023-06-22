# Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.

def contains_nearby_duplicate(nums, _k)
  board = {}
  result = []
  nums.each do |num|
    p num
    p nums[num] == nums[nums[num]]
    p '--' if num <= nums.length - 1
  end
  p board
  board.each do |k, i|
    return true if k == i && ((k - i).abs <= k)
  end
  false
end

p contains_nearby_duplicate([1, 2, 3, 1], 3)
