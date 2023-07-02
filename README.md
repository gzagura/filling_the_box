# filling_the_box


You can execute the program simply by
```bash
  ruby fill_the_box.rb "2 2 2 8 1"
```
The program can handle *.txt files like this 
```bash
  ruby fill_the_box.rb "boxes.txt"
```
The program can handle even things like this
```bash
  ruby fill_the_box.rb "boxes.txt" "2 2 2 8 1" "1 2 4 8 1"
```
The program will answer like this 
```bash
  ruby fill_the_box.rb "2 2 2 8 1"
  line: 2 2 2 8 1
  result: 1 <--smalest amount of cubes to fill the box
  ------------------------------
```

## You can create your own .txt file 
Every problem end with newline
```bash
  4 4 8 10 10 1
  5 5 5 61 7 1
  5 5 6 61 4 1
```

Here are the instructions:
  - 2 3 4 5 6
  - 7 8 9 1 2 3 4
  - a box with dimensions 2 x 3 x 4, 5 cubes of 1x1x1 and 6 cubes of 2x2x2
  - a box with dimensions 7 x 8 x 9, 1 cube of 1x1x1, 2 of 2x2x2, 3 of 4x4x4, and 4
  of 8x8x8.
