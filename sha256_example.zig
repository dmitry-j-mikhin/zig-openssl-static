const std = @import("std");
const c = @cImport({
    @cInclude("openssl/sha.h");
});

pub fn main() !void {
    const message = "Hello, Zig and OpenSSL!";
    var digest: [c.SHA256_DIGEST_LENGTH]u8 = undefined;

    // Hash the message using OpenSSL SHA256
    _ = c.SHA256(message.ptr, message.len, &digest);

    // Print the result
    const stdout = std.io.getStdOut().writer();
    try stdout.print("SHA256 digest for '{s}': ", .{message});
    for (digest) |byte| {
        try stdout.print("{x:0>2}", .{byte});
    }
    try stdout.print("\n", .{});
}
