const std = @import("std");

extern fn get_optimization() [*:0]const u8;

pub fn main() !void {
    std.debug.print("{s}\n", .{get_optimization()});
}
