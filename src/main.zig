const std = @import("std");

const magicBall = @import("magic-ball/magic_ball.zig").MagicBall;

pub fn main() !void {
    // mutable buffer that must outlive the writer
    var stdin_buffer: [1024]u8 = undefined;
    var stdout_buffer: [1024]u8 = undefined;

    // pass a slice (you can also use `&stdout_buffer` in some examples)
    var stdin_reader = std.fs.File.stdin().reader(&stdin_buffer);
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);

    const input = &stdin_reader.interface;
    const stdout = &stdout_writer.interface;

    try stdout.print("You are welcomed by the magic zig ball!\n Ask any question you would like below.\n", .{});
    try stdout.flush();

    _ = try input.takeDelimiterExclusive('\n');

    try stdout.print("{s}\n", .{magicBall.selectAnswer()});
    try stdout.flush();
}
