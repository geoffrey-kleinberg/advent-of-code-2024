day = "07"
# file_name = "12-#{day}-24/sampleIn.txt"
file_name = "12-#{day}-24/input.txt"

data = File.read(file_name).split("\n").map { |i| i.strip }

def to_base_b_string(num, b, l)
  str = num.to_s(b)
  while str.length < l
    str = '0' + str
  end
  return str
end

def part1(input)
    sum = 0
    for line in input
      goal, nums = line.split(": ")
      nums = nums.split(" ").map { |i| i.to_i }
      goal = goal.to_i
    #   puts goal
      for o in 0...(2 ** (nums.length - 1))
        ops = to_base_b_string(o, 2, (nums.length - 1)).split("")
        val = nums[0]
        for i in 1...nums.length
          if ops[i - 1] == "1"
            val += nums[i]
          else
            val *= nums[i]
          end
        end
        # puts val
        if val == goal
          sum += goal
          break
        end
      end
    #   puts
    end
    return sum
end

def part2(input)
    sum = 0
    for line in input
      goal, nums = line.split(": ")
      nums = nums.split(" ").map { |i| i.to_i }
      goal = goal.to_i
    #   puts goal
      for o in 0...(3 ** (nums.length - 1))
        ops = to_base_b_string(o, 3, (nums.length - 1)).split("")
        val = nums[0]
        for i in 1...nums.length
          if ops[i - 1] == "2"
            val += nums[i]
          elsif ops[i - 1] == "1"
            val *= nums[i]
          else
            val = (val.to_s + nums[i].to_s).to_i
          end
        end
        # puts val
        if val == goal
          sum += goal
          break
        end
      end
    #   puts
    end
    return sum
end

# puts part1(data)
puts part2(data)