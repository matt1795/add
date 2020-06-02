const Allocator = @import("std").mem.Allocator;

pub fn concat(allocator: *Allocator, lhs: []const u8, rhs: []const u8) ![]const u8 {
    var buf = try allocator.alloc(u8, lhs.len + rhs.len);

    for (buf) |i|
        buf[i] = if (i < lhs.len) lhs[i] else rhs[i - lhs.len];

    return buf;
}
