all_coords = [(13, 6), (14, 6), (12, 7), (12, 8), (15, 7), (15, 8), (13, 9), (14, 9), (12, 10),
 (12, 11), (12, 12), (15, 10), (15, 11), (14, 12), (13, 13), (16, 10), (16, 12),
 (17, 9), (18, 8), (17, 13), (18, 13)]



for a, b in all_coords:
    # Create the string for the current coordinate and add it to the list
    line = f"VGA_draw_point_ASM(26*x+{a},26*y+{b},1);"
    print(line)
# for b in range(14,21,1):
#     a = 7
#     line = f"VGA_draw_point_ASM(26*x+{a},26*y+{b},1);"
#     print(line)
# Join all lines into a single string with line breaks
output_code = "\n".join(lines_of_code)
output_code