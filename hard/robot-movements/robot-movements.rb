# A robot is located at the top-left corner of a 4x4 grid. The robot can move
# either up, down, left, or right, but can not visit the same spot twice. The
# robot is trying to reach the bottom-right corner of the grid.
#
# Print out the unique number of ways the robot can reach its destination.

def count_paths grid, x, y, w, h
  return 0 if grid[x][y]                # Already visited this location
  return 1 if x == w - 1 and y == h - 1 # Reached our destination

  count = 0
  grid[x][y] = true # Keep track of where we've visited
  count += count_paths grid, x - 1, y, w, h if x > 0
  count += count_paths grid, x + 1, y, w, h if x < w - 1
  count += count_paths grid, x, y - 1, w, h if y > 0
  count += count_paths grid, x, y + 1, w, h if y < h - 1
  grid[x][y] = false

  count
end

width, height = 4, 4
grid = (1..width).map { Array.new height, false }
puts count_paths grid, 0, 0, width, height
